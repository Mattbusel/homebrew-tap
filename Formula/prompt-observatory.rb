class PromptObservatory < Formula
  desc "Local dashboard that streams an LLM reply and flags claims worth checking"
  homepage "https://github.com/Mattbusel/prompt-observatory"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/prompt-observatory/releases/download/v0.3.0/prompt-observatory-v0.3.0-macos-arm64.tar.gz"
      sha256 "c1bdbe1489edc4ccea8a516b565aa072fd57cdc649be645f29656f1aa6a6f90d"
    end
    on_intel do
      url "https://github.com/Mattbusel/prompt-observatory/releases/download/v0.3.0/prompt-observatory-v0.3.0-macos-x86_64.tar.gz"
      sha256 "05b0f73acb38a8da3ec85766f90ad45bc812f4639945f6ee6fe5ec9fdbd82ead"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/prompt-observatory/releases/download/v0.3.0/prompt-observatory-v0.3.0-linux-x86_64.tar.gz"
      sha256 "16c12673ba0b2bb41be2a1900919387d9a10f39bb373593ae573c6e27fd00d70"
    end
  end

  def install
    bin.install "prompt-observatory"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prompt-observatory --version")
  end
end
