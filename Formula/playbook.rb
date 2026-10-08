class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.18.0/playbook-0.18.0-aarch64-apple-darwin"
      sha256 "9445d04429fd0864f3ee91451abdb4d63a40be34c17e4718206b72c9772acfdf"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.18.0/playbook-0.18.0-x86_64-apple-darwin"
      sha256 "c6d3f7265ba3c4c9e10150511cfae855a43ccd498edeba8467926c75d6b04fce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.18.0/playbook-0.18.0-aarch64-unknown-linux-musl"
      sha256 "74242e4642b6f0a5538bf6e7bcf56520d588fc096b7ffa5ead130d2d87e86150"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.18.0/playbook-0.18.0-x86_64-unknown-linux-musl"
      sha256 "e53705f173838b63421d5707004f14204939dc8d14e174838964f704400f4c7f"
    end
  end

  def install
    bin.install Dir["playbook-*"].first => "playbook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playbook --version")
  end
end
