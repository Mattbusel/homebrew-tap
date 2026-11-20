class TokioPromptOrchestrator < Formula
  desc "Queue, dedup and circuit breaker in front of LLM APIs (orchestrator server)"
  homepage "https://github.com/Mattbusel/tokio-prompt-orchestrator"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v3.0.0/orchestrator-v3.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "983aaa847fc8d30b8a4f4b3cd90a7f2c339206a694bf5446a54bdb92fc1214de"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v3.0.0/orchestrator-v3.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "f24e6907f3480501657ee3aa1b365efd53aa6dd938bb11e81fb96a588a3c8823"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokio-prompt-orchestrator/releases/download/v3.0.0/orchestrator-v3.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df044f9fc941224080680bc465abf49aed2f54317e51022161bbbe8cacc3c11b"
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
