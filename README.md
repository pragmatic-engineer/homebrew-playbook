# homebrew-playbook

Homebrew tap for [pragmatic-engineer/playbook](https://github.com/pragmatic-engineer/playbook), a Claude Code plugin toolkit.

## Install

```bash
brew install pragmatic-engineer/playbook/playbook
```

## What this does

The formula downloads the prebuilt binary that `pragmatic-engineer/playbook`'s own release workflow already builds, signs, and checksums for each tagged release. It doesn't build from source and doesn't run a separate release pipeline: it wraps the same `SHA256SUMS`-verified binary `install.sh` fetches.

Covers macOS (Apple Silicon and Intel) and Linux (x86_64 and arm64, static musl builds). Windows isn't a Homebrew target; Windows users should use `install.sh` directly, or WSL with the Linux binary.

## Keeping the formula current

`.github/workflows/update-formula.yml` runs daily (and on manual dispatch): it checks `pragmatic-engineer/playbook`'s latest GitHub release, and if the formula is behind, regenerates `Formula/playbook.rb` from that release's own `SHA256SUMS` and opens a PR. The formula's URLs and checksums are never hand-edited outside that regeneration.
