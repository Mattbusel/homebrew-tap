class EveryOtherToken < Formula
  desc "Watch an LLM answer token by token and see how sure it was about each word"
  homepage "https://github.com/Mattbusel/Every-Other-Token"
  version "5.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/Every-Other-Token/releases/download/v5.0.2/every-other-token-v5.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "e22e7286150d2157777fbb5547ab1bafa69f02e26ed5771c44f85ecb30acf513"
    end
    on_intel do
      url "https://github.com/Mattbusel/Every-Other-Token/releases/download/v5.0.2/every-other-token-v5.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "1950d2ab57898c44e033d418537ca198105602982209840134bb81c96790769c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/Every-Other-Token/releases/download/v5.0.2/every-other-token-v5.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "097322cc7e1584018738cdbc4ab2c0986854352d8c7eb1d359bc99ce223b4ef2"
    end
  end

  def install
    bin.install "every-other-token"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/every-other-token --version")
  end
end
