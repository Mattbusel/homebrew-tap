class ChaosRpg < Formula
  desc "Roguelike where every roll is a chain of real math (Lorenz, Mandelbrot, Collatz)"
  homepage "https://github.com/Mattbusel/chaos-rpg"
  version "2.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.2.1/chaos-rpg-v2.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "b9de5a3fb9b636430639aaf3d1505f1e43b1ade465aaf447ea737824c40b7b39"
    end
    on_intel do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.2.1/chaos-rpg-v2.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "0d922022c28a549e89683a62e9f037abed2f1c030a1cee611d619100315538c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mattbusel/chaos-rpg/releases/download/v2.2.1/chaos-rpg-v2.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1eeff40b717044a84b766b9c6841f45f26a29e28c4392f69d813ca829c53af4c"
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
