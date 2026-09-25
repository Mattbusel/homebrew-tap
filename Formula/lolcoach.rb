class Lolcoach < Formula
  desc "Review your League of Legends games locally: waves, deaths, gold swings"
  homepage "https://github.com/Mattbusel/lolcoach"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/lolcoach/releases/download/v1.1.1/lolcoach-review-v1.1.1-macos-arm64.tar.gz"
      sha256 "999b9a7270c49cba668e0035a2a910833cc477f8fb3fb7aaff0a970599bfa1da"
    end
    on_intel do
      url "https://github.com/Mattbusel/lolcoach/releases/download/v1.1.1/lolcoach-review-v1.1.1-macos-x86_64.tar.gz"
      sha256 "bba73a85fcba32df35aa5a3679f9f61ef8370b8164b75a7e647a4e664d19ef35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/lolcoach/releases/download/v1.1.1/lolcoach-review-v1.1.1-linux-x86_64.tar.gz"
      sha256 "ee32dd22cac70bb4571d530b26125d87cc8c82a5779b878124173392c8969f9a"
    end
  end

  def install
    bin.install "LoLCoach" => "lolcoach"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lolcoach --version")
  end
end
