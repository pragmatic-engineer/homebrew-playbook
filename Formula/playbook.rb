class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.21.0/playbook-0.21.0-aarch64-apple-darwin"
      sha256 "0ba46f80bf49d28e7b427edb02b92a67a307ad2eb9e9153511743249b354d589"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.21.0/playbook-0.21.0-x86_64-apple-darwin"
      sha256 "55c4d3b937b7e6f1a51941f7d18a4655930836f0d0045f29903bd71fd70277d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.21.0/playbook-0.21.0-aarch64-unknown-linux-musl"
      sha256 "04e8129386406797957390168adf25ea62265aed39e0d335985df0f2a38325f0"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.21.0/playbook-0.21.0-x86_64-unknown-linux-musl"
      sha256 "93fc48f65b62d9e804e91628db2564cc09cb5c200c75382c180d958796434a41"
    end
  end

  def install
    bin.install Dir["playbook-*"].first => "playbook"
  end

  def caveats
    <<~EOS
      Run `playbook init` once to wire the safety hooks and put playbook on PATH
      for every shell, including the ones Claude Code starts for hooks.
      Until then the Claude Code plugin works, without the ccc and ccd launcher.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playbook --version")
  end
end
