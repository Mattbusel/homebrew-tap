class TokioPromptOrchestrator < Formula
  desc "Queue, dedup and circuit breaker in front of LLM APIs (orchestrator server)"
  homepage "https://github.com/Mattbusel/tokio-prompt-orchestrator"
  version "2.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.3/orchestrator-v2.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "567ec1fc22ca0c211f4ff7eed83112898ff441e953ac3075a11f2cbca21cbfb2"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.3/orchestrator-v2.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "89d5fdfae67805a1daefcd5cdbe41c452676978736810269069daffb8ee47945"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.4.3/orchestrator-v2.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d76aefbec7283cb5f8aa60a2fc393a73c7f2495510b2284023255c79cbc9d592"
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
