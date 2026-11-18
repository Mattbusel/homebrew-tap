class TokioPromptOrchestrator < Formula
  desc "Queue, dedup and circuit breaker in front of LLM APIs (orchestrator server)"
  homepage "https://github.com/Mattbusel/tokio-prompt-orchestrator"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.5.1/orchestrator-v2.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "18067a051b5989613111ada0a96e91877e2375d7256c74502638baa22f15727a"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.5.1/orchestrator-v2.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "774313ac8b497a5d87c8eb2ce989196f6ee94e799f9c6db20b924430fcfbc632"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v2.5.1/orchestrator-v2.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1b9157a63babc2b5b6ecf7b2ab5d7f4542c0b1a06926f39fd09b25b4135fd11"
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
