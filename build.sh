#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f dist/index.html ]]; then
  sha256sum --check SHA256SUMS.txt
  cat site-part-* | tar -xzf -
fi
for page in index.html taal/index.html taalhelden/index.html rekenhelden/index.html topohelden/index.html leerroute/index.html; do
  test -s "dist/$page"
done
