class Helixrouter < Formula
  desc "Adaptive job router for Tokio with a live web dashboard"
  homepage "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.2.1/helixrouter-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f53ac8217bb483eb2977d8d8fe67b1ffd8583704b7f610222ec2404e21637487"
    end
    on_intel do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.2.1/helixrouter-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "f6a4cdd358f4ed7756c90234432d254dadf92cd119cf0e8b141599d2c245ad51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/HelixRouter-adaptive-async-compute-router-/releases/download/v1.2.1/helixrouter-v1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33a176724cc97d9a7d38d75c3412dde8e588c092f7885c0b186847ddb089c67b"
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
