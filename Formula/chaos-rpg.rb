class ChaosRpg < Formula
  desc "Roguelike where every roll is a chain of real math (Lorenz, Mandelbrot, Collatz)"
  homepage "https://github.com/Mattbusel/chaos-rpg"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.3.0/chaos-rpg-v2.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bfebb5f3cf19b34cf7692607e3f142a2086def45a409ceb9c138a9f19a7a08e2"
    end
    on_intel do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.3.0/chaos-rpg-v2.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "afa407cee2d59c619b00b7f2d4cdd329c2cb1d9533fb12d9f1a40fb3fb5e470c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.3.0/chaos-rpg-v2.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "332098c07739b624e062eedf5b6a0e097927d692b97fa3d82583431968a56789"
    end
  end

  def install
    bin.install "chaos-rpg", "chaos-rpg-graphical", "chaos-rpg-proof"
    pkgshare.install "chaos_config.toml"
  end

  def caveats
    <<~EOS
      Three ways to play:
        chaos-rpg-graphical   the game in its own window (start here)
        chaos-rpg-proof       the Proof Engine version (preview)
        chaos-rpg             the terminal version

      An example settings file is in #{opt_pkgshare}/chaos_config.toml.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chaos-rpg --version")
    assert_match version.to_s, shell_output("#{bin}/chaos-rpg-graphical --version")
    assert_match version.to_s, shell_output("#{bin}/chaos-rpg-proof --version")
  end
end
