# homebrew-tap

Homebrew tap for [pragmatic-engineer/playbook](https://github.com/pragmatic-engineer/playbook), a Claude Code plugin toolkit.

## Install

```bash
brew install pragmatic-engineer/tap/playbook
```

The tap is `pragmatic-engineer/tap`, so `brew tap pragmatic-engineer/tap` works too. Upgrade with `brew upgrade playbook`.

## Moving from the old tap

This repo used to be named `homebrew-playbook`, and the install command was `brew install pragmatic-engineer/playbook/playbook`. If you installed that way, switch taps once:

```bash
brew untap pragmatic-engineer/playbook
brew tap pragmatic-engineer/tap
```

GitHub redirects the old repo URL, so existing links keep working. If `brew untap` refuses because `playbook` is installed from the old tap, uninstall it first and install it again from the new tap.

## What this does

The formula downloads the prebuilt binary which `pragmatic-engineer/playbook`'s own release workflow builds, attests and checksums for each tagged release. It doesn't build from source and doesn't run a separate release pipeline. It wraps the same `SHA256SUMS` verified binary `install.sh` fetches.

Covers macOS (Apple Silicon and Intel) and Linux (x86_64 and arm64, static musl builds). Windows isn't a Homebrew target. Windows users should use `install.sh` directly, or WSL with the Linux binary.

## Keeping the formula current

Nothing in this repo updates the formula. The `publish-channels` job in the playbook release workflow renders `Formula/playbook.rb` from the release's own `SHA256SUMS` and pushes it here when a tag is published. It skips the push if the tag isn't the latest release. Don't edit the formula's URLs or checksums by hand.

If the formula is behind the latest release, check the `publish-channels` run for that tag in `pragmatic-engineer/playbook`.
