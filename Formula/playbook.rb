class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.20.1/playbook-0.20.1-aarch64-apple-darwin"
      sha256 "a25e83f089fc557acf8f017515c67c5941e9b8e59b0f9b6dc6d612677be639f3"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.20.1/playbook-0.20.1-x86_64-apple-darwin"
      sha256 "708abea09a8784fb9c8bc264162a2a67fb1c42956bc9a797965af08eb3332d8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.20.1/playbook-0.20.1-aarch64-unknown-linux-musl"
      sha256 "209664a7d46729074c63dee001487e95f8fb18ee7857d15e70ec8e9a35c63676"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.20.1/playbook-0.20.1-x86_64-unknown-linux-musl"
      sha256 "7ced73274ebaf5d18f5f946c5a21570d24768cd3abde59962d5b2d188f902672"
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
