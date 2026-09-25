class Tokenviz < Formula
  desc "Rank the lines of a prompt by token cost, with a budget check for CI"
  homepage "https://github.com/Mattbusel/tokenviz"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/tokenviz/releases/download/v0.3.0/tokenviz-v0.3.0-macos-arm64.tar.gz"
      sha256 "c5cd7842b4bc891c59832ee5d606e4da06e288e94d6a1f6afcb707a7b253a71d"
    end
    on_intel do
      url "https://github.com/Mattbusel/tokenviz/releases/download/v0.3.0/tokenviz-v0.3.0-macos-x86_64.tar.gz"
      sha256 "5c371803c0a9f35b265c878ceb01a53d5030fb00a6b454c123cc94043dfdafa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/tokenviz/releases/download/v0.3.0/tokenviz-v0.3.0-linux-x86_64.tar.gz"
      sha256 "eb493917fc3f5af9acfea988e87781614866094abe0bc08e160f09fb112a370f"
    end
  end

  def install
    bin.install "tokenviz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tokenviz --version")
  end
end
