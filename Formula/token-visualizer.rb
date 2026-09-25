class TokenVisualizer < Formula
  desc "See how a tokenizer splits your prompt and what to cut, with measured savings"
  homepage "https://github.com/Mattbusel/Token-Visualizer"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.0/token-visualizer-v0.3.0-macos-arm64.tar.gz"
      sha256 "56bdaf2e13da733b190e79164eaf191f295d98e323c7be6a5264988c0a81121a"
    end
    on_intel do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.0/token-visualizer-v0.3.0-macos-x86_64.tar.gz"
      sha256 "1415fb2cd13d69e10e514231650019eb71593bdd1cf208a156c36e8df622d46c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.0/token-visualizer-v0.3.0-linux-x86_64.tar.gz"
      sha256 "8a203606632b9fe30f9ab97e8eea57e5088a6efd3538f3132686b2494d370e2a"
    end
  end

  def install
    bin.install "token-visualizer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/token-visualizer --version")
  end
end
