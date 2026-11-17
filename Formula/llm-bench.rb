class LlmBench < Formula
  desc "Compare LLM models on p50/p99 latency, tokens per second and cost in one table"
  homepage "https://github.com/Mattbusel/llm-bench"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.1/llm-bench-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "4bb40e27c72d8304b813c6b10b9450930fc5dee74d258224893cb718118c0bdd"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.1/llm-bench-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "d508a874be916017a32fcd51a9dea434a29afab17076e8c4fdf31f645195fa06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.1/llm-bench-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5003d5f7e8b19e2e321630963f611053e5ed5f9d907d0082419b0ef07755e505"
    end
  end

  def install
    bin.install "llm-bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-bench --version")
  end
end
