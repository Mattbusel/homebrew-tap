class LlmDash < Formula
  desc "See what your LLM API calls cost: live terminal dashboard for spend and budget"
  homepage "https://mattbusel.github.io/llm-cost-dashboard/"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.2/llm-cost-dashboard-v1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d8d5bb4fa4aa204923fd70e278a1c0f557120c01d272af8e3b86dfec5131425a"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.2/llm-cost-dashboard-v1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "1b680c06a2fc85a0a4ac95117322047e31ea1ba0d119e338f97317db5b13d9d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.2/llm-cost-dashboard-v1.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18c2dd8ccdaddec6eff492920c7bcdf51233de7de363cb509832a662d01d6332"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.2/llm-cost-dashboard-v1.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b513cdf590660c417deaf6d8e7bed6da3d189eb06c141cf26e321e9b0a2c813"
    end
  end

  def install
    bin.install "llm-dash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-dash --version")
  end
end
