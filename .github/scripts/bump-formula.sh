#!/usr/bin/env bash
# Update Formula/playbook.rb to a playbook release.
# Usage: bump-formula.sh <version-without-v> [formula-path]
# URLs and checksums come from the release's own SHA256SUMS. Nothing is hand-edited.
set -euo pipefail

version="${1:?usage: bump-formula.sh <version> [formula-path]}"
formula="${2:-Formula/playbook.rb}"
base="https://github.com/pragmatic-engineer/playbook/releases/download/v${version}"
targets=(aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-musl x86_64-unknown-linux-musl)

if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error::refusing unexpected version '${version}'" >&2
  exit 1
fi

sums="$(curl -fsSL "${base}/SHA256SUMS")"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
cp "$formula" "$tmp"

for target in "${targets[@]}"; do
  sha="$(awk -v f="playbook-${version}-${target}" '$2 == f { print $1 }' <<<"$sums")"
  if [[ ! "$sha" =~ ^[0-9a-f]{64}$ ]]; then
    echo "::error::missing or malformed checksum for ${target} in v${version} SHA256SUMS. Refusing to write a partial formula." >&2
    exit 1
  fi
  # Rewrite the url line for this target, and the sha256 line that follows it.
  awk -v target="$target" -v url="      url \"${base}/playbook-${version}-${target}\"" -v sha="      sha256 \"${sha}\"" '
    $1 == "url" && index($0, "-" target "\"") { print url; fix = 1; next }
    fix && $1 == "sha256" { print sha; fix = 0; next }
    { print }
  ' "$tmp" >"${tmp}.new"
  mv "${tmp}.new" "$tmp"
done

rewritten="$(grep -c "/download/v${version}/playbook-${version}-" "$tmp" || true)"
if [[ "$rewritten" -ne ${#targets[@]} ]]; then
  echo "::error::expected ${#targets[@]} url lines for v${version} after the rewrite, found ${rewritten}. The formula layout changed. Refusing to write." >&2
  exit 1
fi

cp "$tmp" "$formula"
