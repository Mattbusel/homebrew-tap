class LlmDash < Formula
  desc "See what your LLM API calls cost: live terminal dashboard for spend and budget"
  homepage "https://mattbusel.github.io/llm-cost-dashboard/"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.0/llm-cost-dashboard-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "31379b5c4d0e9a4697ebd79d65f02a1555355a21f36b7909f6a781046561f5fa"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.0/llm-cost-dashboard-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "92d4191568b1537812d5549a888a16a873887bc61232553144db86977794eeb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.0/llm-cost-dashboard-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be849e4b606a3d7d9b0ce86c3f8157f702a0174d25fcf0a7cd90b418342c78a9"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.4.0/llm-cost-dashboard-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fc29511c205ba8abb228ecd86f1eca1adfffe31c416262887e1b997f714f104"
    end
  end

  def install
    bin.install "llm-dash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-dash --version")
  end
end
