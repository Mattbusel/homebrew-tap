class Reckoner < Formula
  desc "Group rows that name the same company, merging only on proof, never guesses"
  homepage "https://github.com/Mattbusel/reckoner"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/reckoner/releases/download/v0.2.2/reckoner-v0.2.2-macos-arm64.tar.gz"
      sha256 "e039a4420293139f9d6a13a7d3fa2cf4894645cd8d74cce8a374bb865e6f9e5a"
    end
    on_intel do
      url "https://github.com/Mattbusel/reckoner/releases/download/v0.2.2/reckoner-v0.2.2-macos-x86_64.tar.gz"
      sha256 "23f6132da411b2bafc4562425950420988ede42563377ce7d0290ac2a0952fb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/reckoner/releases/download/v0.2.2/reckoner-v0.2.2-linux-x86_64.tar.gz"
      sha256 "feba703d25d5b3502e9a19ec794d8c28de59155094bbf1dfbb88ef9be0bc3b23"
    end
  end

  def install
    bin.install "reckoner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reckoner --version")
  end
end
