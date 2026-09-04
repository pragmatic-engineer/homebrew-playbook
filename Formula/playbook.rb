class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.13.0/playbook-0.13.0-aarch64-apple-darwin"
      sha256 "ae36ae28d4ea9408b9080881f88cb22c73b515f8cbabe9c6e09f068c3b61d1a6"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.13.0/playbook-0.13.0-x86_64-apple-darwin"
      sha256 "af85b850f3fc27968a2b1b149d5e8c0557cd601d9f32a135dab7fc6a7c807007"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.13.0/playbook-0.13.0-aarch64-unknown-linux-musl"
      sha256 "89bad0d808bec87177fa137aa6abccc24669681e348b82233819d7a6a4bd2ae7"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.13.0/playbook-0.13.0-x86_64-unknown-linux-musl"
      sha256 "2a48b8e836b88ff617ebd32d3b3271b98e9fb1fd331fec2a3097fa58dae98432"
    end
  end

  def install
    bin.install Dir["playbook-*"].first => "playbook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playbook --version")
  end
end
