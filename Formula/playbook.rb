class Playbook < Formula
  desc "Claude Code plugin toolkit: hooks, launcher, and installer in one binary"
  homepage "https://github.com/pragmatic-engineer/playbook"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.14.0/playbook-0.14.0-aarch64-apple-darwin"
      sha256 "8dd714b73f1e0d14e1aee573bad5571e8c5a54e8f519f203e202b5b11b0b9f51"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.14.0/playbook-0.14.0-x86_64-apple-darwin"
      sha256 "f9449977c8b495ea6ac97282fa93ef3739e0c94ca44bcc1570bcca10c07c3557"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.14.0/playbook-0.14.0-aarch64-unknown-linux-musl"
      sha256 "0401dd46ece7d1e4ccdbe85b87f6e4ba310f09be57c3277a5f9fa801f9933b5e"
    else
      url "https://github.com/pragmatic-engineer/playbook/releases/download/v0.14.0/playbook-0.14.0-x86_64-unknown-linux-musl"
      sha256 "18308e572dcec55ca62fcfc0732e0b2537b30aa8f597d9593ade3adaff2e3a48"
    end
  end

  def install
    bin.install Dir["playbook-*"].first => "playbook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playbook --version")
  end
end
