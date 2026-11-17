class Helixrouter < Formula
  desc "Adaptive job router for Tokio with a live web dashboard"
  homepage "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.4.1/helixrouter-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "b81d71a8475f1a9bc2cae263d6d4a2d50924947512a1ec67882a8d4ef64316b1"
    end
    on_intel do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.4.1/helixrouter-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "e7056247f8be0e54603e28b9ae2ac88f0afd94ce33c48069f26b478e6adf652f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.4.1/helixrouter-v1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7b013b6bcf0a07f15c469c9ce418216526690bd3d9b18db67c3dae1ca187f46"
    end
  end

  def install
    bin.install "helixrouter"
  end

  def caveats
    <<~EOS
      Start it and open the dashboard:
        helixrouter
        open http://127.0.0.1:8080
    EOS
  end

  test do
    assert_match "helixrouter #{version}", shell_output("#{bin}/helixrouter --version")
  end
end
