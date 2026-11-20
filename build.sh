#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
sha256sum --check <<'CHECKSUMS'
17faa11f672418d776f2659547c3e6f04d2a9d05aaab200d63851eae6b08b95f  site-20261120-ontdek-part-00
1e9e78e5d71a5d93ad7aa9bdb5bd3127bb399590f23211a5d01e807183f7d684  site-20261120-ontdek-part-01
389989e27a19d50cd302b16ed0e09e433bfbb1fbade4dcf80014a69e324a16b9  site-20261120-ontdek-part-02
CHECKSUMS
stage_dir="$(mktemp -d .leerhelden-build.XXXXXX)"
trap 'rm -rf "$stage_dir"' EXIT
cat site-20261120-ontdek-part-00 site-20261120-ontdek-part-01 site-20261120-ontdek-part-02 | tar -xzf - -C "$stage_dir"
test -f "$stage_dir/dist/index.html"
test -f "$stage_dir/dist/ouders/index.html"
test -f "$stage_dir/dist/wereld/data/wereld-bank.json"
test -f "$stage_dir/dist/shared/family.js"
rm -rf dist
mv "$stage_dir/dist" dist
