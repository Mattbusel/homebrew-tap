class LlmBench < Formula
  desc "Compare LLM models on p50/p99 latency, tokens per second and cost in one table"
  homepage "https://github.com/Mattbusel/llm-bench"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.0/llm-bench-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "3b63d2fcc4b07fadd79be27fc6fe525ad4545d47546d5473a19b16047d2e5ed6"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.0/llm-bench-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "dffb91daaf82571d5ffabda684434475fb845a96eac3ccb3da4ff2575bb8d46e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.0/llm-bench-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a466479f8cf55254b06ed4ef06513afa9f043c8385174dc2bdc74dbbdaa24c06"
    end
  end

  def install
    bin.install "llm-bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-bench --version")
  end
end
