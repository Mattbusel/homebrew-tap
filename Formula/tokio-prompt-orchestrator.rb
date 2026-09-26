class TokioPromptOrchestrator < Formula
  desc "Queue, dedup and circuit breaker in front of LLM APIs (orchestrator server)"
  homepage "https://github.com/Mattbusel/tokio-prompt-orchestrator"
  version "1.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v1.4.2/orchestrator-v1.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "15451ccdaa8331e333425f26a4feccdab19df8a7b7f1b7aae18081bce581f65e"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v1.4.2/orchestrator-v1.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "2221604255718bf9519fd2421d9e9bf2cf4e64217799b4ee59bf5e004fab377f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v1.4.2/orchestrator-v1.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f5bd08c022068f899ef569e60557192f1235918b85422350b8b656108ac7d4f"
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
