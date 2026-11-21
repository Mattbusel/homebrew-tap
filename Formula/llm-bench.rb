class LlmBench < Formula
  desc "Compare LLM models on p50/p99 latency, tokens per second and cost in one table"
  homepage "https://github.com/Mattbusel/llm-bench"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.2/llm-bench-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "8a0bc1e57651f90794a827f0331b2588d1fd250314cbc6a1ddcfd8d4b9d5bc94"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.2/llm-bench-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "06e8ce1d06a11a230aa345cc57a99275656301c02c6ba902355846aa98ad3d6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.4.2/llm-bench-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50b27c94b46d1e2fe7f82aafbe68eb19f2cf37cde763291b76ebfbc9bb410d2c"
    end
  end

  def install
    bin.install "llm-bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-bench --version")
  end
end
