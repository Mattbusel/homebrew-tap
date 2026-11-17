#!/usr/bin/env python3
"""Moves every formula (Formula/*.rb) or Scoop manifest (bucket/*.json) to its project's
latest GitHub release.

For each file: read the version and the release asset URLs, ask the GitHub API for the
project's latest release, and when it is newer, point every URL at the new tag and take each
asset's sha256 from the release's SHA256SUMS.txt (or the asset's own .sha256 file). A file is
left alone when the new release lacks any asset the file uses, so a release without binaries
never breaks an install.

    python scripts/bump.py            # rewrite the files that have a newer release
    python scripts/bump.py --check    # only report

Standard library only. Set GITHUB_TOKEN to raise the API rate limit.
"""
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
URL_RE = re.compile(r"https://github\.com/([^/]+)/([^/]+)/releases/download/v([^/]+)/([^\"\s]+)")


def get(url, accept="application/vnd.github+json"):
    headers = {"User-Agent": "tap-bump", "Accept": accept}
    if os.environ.get("GITHUB_TOKEN") and "api.github.com" in url:
        headers["Authorization"] = "Bearer " + os.environ["GITHUB_TOKEN"]
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=60) as r:
        return r.read()


def latest(owner, repo):
    rel = json.loads(get(f"https://api.github.com/repos/{owner}/{repo}/releases/latest"))
    return rel["tag_name"], {a["name"]: a["browser_download_url"] for a in rel["assets"]}


def sums_for(assets):
    out = {}
    if "SHA256SUMS.txt" in assets:
        for line in get(assets["SHA256SUMS.txt"], "application/octet-stream").decode().splitlines():
            parts = line.split()
            if len(parts) == 2:
                out[parts[1].lstrip("*").rsplit("/", 1)[-1]] = parts[0].lower()
    return out


def vkey(v):
    return [int(x) if x.isdigit() else x for x in re.split(r"[.\-]", v)]


def bump_text(text, old, new, sums, assets, release_assets):
    """New text with every URL and hash moved from old to new, or None if an asset is
    missing from the new release."""
    names = []
    for m in URL_RE.finditer(text):
        if m.group(3) != old:
            continue
        name = m.group(4).replace(old, new)
        if name not in release_assets:
            return None, f"release v{new} has no {name}"
        if name not in sums:
            sha_file = name + ".sha256"
            if sha_file not in release_assets:
                return None, f"no checksum for {name}"
            sums[name] = get(release_assets[sha_file], "application/octet-stream").decode().split()[0].lower()
        names.append((m.group(4), name))
    return names, None


def update_formula(path, check):
    text = path.read_text(encoding="utf-8")
    vm = re.search(r'^\s*version "([^"]+)"', text, re.M)
    um = URL_RE.search(text)
    if not vm or not um:
        return f"{path.name}: no version or release URL, skipped"
    old = vm.group(1)
    tag, assets = latest(um.group(1), um.group(2))
    new = tag.lstrip("v")
    if vkey(new) <= vkey(old):
        return f"{path.name}: {old} is current"
    sums = sums_for(assets)
    names, err = bump_text(text, old, new, sums, None, assets)
    if err:
        return f"{path.name}: {old} -> {new} skipped ({err})"
    if check:
        return f"{path.name}: {old} -> {new} available"
    lines = text.split("\n")
    for i, line in enumerate(lines):
        if line.strip().startswith("version "):
            lines[i] = line.replace(f'"{old}"', f'"{new}"')
        m = URL_RE.search(line)
        if m and m.group(3) == old:
            name = m.group(4).replace(old, new)
            lines[i] = line.replace(f"/v{old}/{m.group(4)}", f"/v{new}/{name}")
            for j in (i + 1, i + 2):
                if j < len(lines) and re.search(r'sha256 "[0-9a-f]{64}"', lines[j]):
                    lines[j] = re.sub(r'sha256 "[0-9a-f]{64}"', f'sha256 "{sums[name]}"', lines[j])
                    break
    path.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    return f"{path.name}: {old} -> {new}"


def update_manifest(path, check):
    d = json.loads(path.read_text(encoding="utf-8"))
    old = d.get("version")
    arch = d.get("architecture", {}).get("64bit", d)
    um = URL_RE.search(arch.get("url", ""))
    if not old or not um:
        return f"{path.name}: no version or release URL, skipped"
    tag, assets = latest(um.group(1), um.group(2))
    new = tag.lstrip("v")
    if vkey(new) <= vkey(old):
        return f"{path.name}: {old} is current"
    name = um.group(4).replace(old, new)
    if name not in assets:
        return f"{path.name}: {old} -> {new} skipped (release v{new} has no {name})"
    sums = sums_for(assets)
    if name not in sums and name + ".sha256" in assets:
        sums[name] = get(assets[name + ".sha256"], "application/octet-stream").decode().split()[0].lower()
    if name not in sums:
        return f"{path.name}: {old} -> {new} skipped (no checksum for {name})"
    if check:
        return f"{path.name}: {old} -> {new} available"
    d["version"] = new
    arch["url"] = arch["url"].replace(f"/v{old}/{um.group(4)}", f"/v{new}/{name}")
    arch["hash"] = sums[name]
    if "extract_dir" in arch:
        arch["extract_dir"] = arch["extract_dir"].replace(old, new)
    path.write_text(json.dumps(d, indent=4, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")
    return f"{path.name}: {old} -> {new}"


def main():
    check = "--check" in sys.argv
    files = sorted((ROOT / "Formula").glob("*.rb")) + sorted((ROOT / "bucket").glob("*.json"))
    changed = 0
    for f in files:
        try:
            msg = update_formula(f, check) if f.suffix == ".rb" else update_manifest(f, check)
        except urllib.error.HTTPError as e:
            msg = f"{f.name}: GitHub API {e.code}, skipped"
        print(msg)
        changed += msg.count(" -> ") and not msg.endswith(")")
    print(f"{changed} file(s) {'can be' if check else ''} updated".replace("  ", " "))


if __name__ == "__main__":
    main()
