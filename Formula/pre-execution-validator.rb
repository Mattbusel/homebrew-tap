class PreExecutionValidator < Formula
  desc "Parody enterprise tool that checks if a script ran before it ran (it did not)"
  homepage "https://github.com/Mattbusel/pre_execution_validator"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/pre_execution_validator/releases/download/v1.1.1/pre_execution_validator-v1.1.1-macos-arm64.tar.gz"
      sha256 "0eb6d4f2a50704a3a79d39ffca23b9801d165ba820a3a7e0c2d683e6baf9ce28"
    end
    on_intel do
      url "https://github.com/Mattbusel/pre_execution_validator/releases/download/v1.1.1/pre_execution_validator-v1.1.1-macos-x86_64.tar.gz"
      sha256 "fd8e71e7f3879f6d2f5c1620eaaa6c1b924a6400a6d954feb5a7a4ee6f884ef7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/pre_execution_validator/releases/download/v1.1.1/pre_execution_validator-v1.1.1-linux-x86_64.tar.gz"
      sha256 "149df28b33907b8f1b35fdc6bbffde3b0720d3008fba8e15a5946ae24dc4dcee"
    end
  end

  def install
    bin.install "pre_execution_validator" => "pesvf"
    bin.install_symlink "pesvf" => "pre_execution_validator"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pesvf --version")
  end
end
