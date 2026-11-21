class LlmDash < Formula
  desc "See what your LLM API calls cost: live terminal dashboard for spend and budget"
  homepage "https://mattbusel.github.io/llm-cost-dashboard/"
  version "1.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.2/llm-cost-dashboard-v1.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "ed0bcbabce768191818376cbb44af17672468e89d39c74c60abfe52a087c14c6"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.2/llm-cost-dashboard-v1.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "34bbc7957c1633c4348a7e651e76ee3dedae826ada9ac4d4fb4597b9e46f52ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.2/llm-cost-dashboard-v1.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fa2a89f75d858342dfeac66a6bb46bfa36deab3e4fbb6b7526cd58a48d9ac49"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.2/llm-cost-dashboard-v1.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d40c300558b8dcd0cff0fb6cff3fde57710112cd307ff7f619ede9dbaed55187"
    end
  end

  def install
    bin.install "llm-dash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-dash --version")
  end
end
