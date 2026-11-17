class LlmDash < Formula
  desc "See what your LLM API calls cost: live terminal dashboard for spend and budget"
  homepage "https://mattbusel.github.io/llm-cost-dashboard/"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.1/llm-cost-dashboard-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "2ecd49a8c53cff783fb452c1b1561690e1e78a7d046fd6bfeb5bd00eb08b4e91"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.1/llm-cost-dashboard-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "1e85a975bd6cf230e370c1d16edfa6343f8d0e8820f41d4ca69ad7d9cfc3b8ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.1/llm-cost-dashboard-v1.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30edb40bc42df87a5f91338ad486cb36c23c07cbe50c995e0707444ff0e6e1f5"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.1/llm-cost-dashboard-v1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b7806d03ae717e86f432a899e7b9a62638e6bfef3f63ef5dbbcb730ab095fc3"
    end
  end

  def install
    bin.install "llm-dash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-dash --version")
  end
end
