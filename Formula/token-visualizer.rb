class TokenVisualizer < Formula
  desc "See how a tokenizer splits your prompt and what to cut, with measured savings"
  homepage "https://github.com/Mattbusel/Token-Visualizer"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.1/token-visualizer-v0.3.1-macos-arm64.tar.gz"
      sha256 "655fc23f80879bc8c2f2be51b733d9b80f78f26a7a985a0a93c657416ae34823"
    end
    on_intel do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.1/token-visualizer-v0.3.1-macos-x86_64.tar.gz"
      sha256 "13ee6376207d22e503ca8d63a6c54fb1d0846900367eb3bc4c5fb9a0a0e1bd3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/Token-Visualizer/releases/download/v0.3.1/token-visualizer-v0.3.1-linux-x86_64.tar.gz"
      sha256 "dc6842bceff4060674853740375c7a0de83c2c071ce944d1c30e66739b96bfd7"
    end
  end

  def install
    bin.install "token-visualizer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/token-visualizer --version")
  end
end
