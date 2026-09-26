class LlmDash < Formula
  desc "See what your LLM API calls cost: live terminal dashboard for spend and budget"
  homepage "https://github.com/Mattbusel/llm-cost-dashboard"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.1/llm-cost-dashboard-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "9855fd710ee4b3d6d9b6dc3b974a2dd92667f4e9e55ad57d06ec4903bb4fd78a"
    end
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.1/llm-cost-dashboard-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "3f2afa0788c363d2289ee062ce230b3288291ddafef1ed79a3353f5f855c7359"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/llm-cost-dashboard/releases/download/v1.2.1/llm-cost-dashboard-v1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5286455614e41013045ba9d9afba1271988bea4d459b3812c8b7580f68d82c3"
    end
  end

  def install
    bin.install "llm-dash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-dash --version")
  end
end
