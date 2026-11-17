class TokioPromptOrchestrator < Formula
  desc "Queue, dedup and circuit breaker in front of LLM APIs (orchestrator server)"
  homepage "https://github.com/Mattbusel/tokio-prompt-orchestrator"
  version "2.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.2/orchestrator-v2.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "853248abb018593fdf63905803ba811fd5f040ed25f9f6f417bed77f380d7e3e"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.2/orchestrator-v2.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "05ab94725052851a8b55c6c0b771505424fdb4b1938fe05ff0b39ff38ace6d7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.2/orchestrator-v2.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d5c609b3df4dc736572da82c677a74801d074cae768d1a31c99931b601d2931"
    end
  end

  def install
    bin.install "orchestrator"
  end

  def caveats
    <<~EOS
      Try it with no API key:
        orchestrator --provider echo
      Then open http://127.0.0.1:8080/health or POST to /api/v1/infer.
    EOS
  end

  test do
    assert_match "orchestrator #{version}", shell_output("#{bin}/orchestrator --version")
  end
end
