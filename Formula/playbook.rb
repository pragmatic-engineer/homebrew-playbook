class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.19.0/playbook-0.19.0-aarch64-apple-darwin"
      sha256 "271aa993cd4bbb7f6ce01aa0b600322ee8fdb3fb804d6104356e79b3ef982d40"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.19.0/playbook-0.19.0-x86_64-apple-darwin"
      sha256 "771332010afe6ed91429638aef09a5471664a47cdc95804d1b8d5c0dea8a7264"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.19.0/playbook-0.19.0-aarch64-unknown-linux-musl"
      sha256 "5309137ecaae097ee6a4e2e4384bf8d17ecc3baa624c2a6739229d33dd73093c"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.19.0/playbook-0.19.0-x86_64-unknown-linux-musl"
      sha256 "b78be4b31cf3fd93c0228595c7dee2c955a561bc57f0fa1c7dbb2e2dd92b2104"
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
