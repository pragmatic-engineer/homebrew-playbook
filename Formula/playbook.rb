class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.22.0/playbook-0.22.0-aarch64-apple-darwin"
      sha256 "c725749543a8aa1389fa3e35b126599592b94c51b6ad6e972e8e89b5dda5d466"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.22.0/playbook-0.22.0-x86_64-apple-darwin"
      sha256 "9beca070b0bf7c026d9df5ee4759aea02258ab8382490fef55b6dfc09b1bc208"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.22.0/playbook-0.22.0-aarch64-unknown-linux-musl"
      sha256 "c9947408868c095d058211370a6bf4d05592f1bd68578b28304970f82cbeb1d9"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.22.0/playbook-0.22.0-x86_64-unknown-linux-musl"
      sha256 "a1079f29dac586f865a37076b1ebe46bedbdfbbd40e1374abc552fc0abfafe94"
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
