class LlmBench < Formula
  desc "Compare LLM models on p50/p99 latency, tokens per second and cost in one table"
  homepage "https://github.com/Mattbusel/llm-bench"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.1/llm-bench-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "ad6751790c1050696c0ff3d5e892bf7b21079bf9dd20b596420c8c6bf1d5237f"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.1/llm-bench-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "c78fe2ecfb19178aa3c250c8703ca586c69f05d3a182f99d2c1d8d2b96541e91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.1/llm-bench-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ee9e7afec059c165ceabe02f4c30e75c67589bb3688bdb828398bb4e4953c41"
    end
  end

  def install
    bin.install "llm-bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-bench --version")
  end
end
