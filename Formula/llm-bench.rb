class LlmBench < Formula
  desc "Compare LLM models on p50/p99 latency, tokens per second and cost in one table"
  homepage "https://github.com/Mattbusel/llm-bench"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.2/llm-bench-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "9830cf512c5a615f67da3ad336bb393ea5c49557308e36405de1227516d21148"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.2/llm-bench-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "b438e5bd70e22605863f5e1c3312ea9dc765136a66f3b70154f78c5cfaa5f7ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-bench/releases/download/v0.2.2/llm-bench-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8efc60729bec0bb65c23cddb1ca365f91e7d19cdb0b79991c09aaa915c083923"
    end
  end

  def install
    bin.install "llm-bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-bench --version")
  end
end
