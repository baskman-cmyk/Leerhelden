#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f dist/index.html ]]; then
  sha256sum --check SHA256SUMS.txt
  cat site-part-* | tar -xzf -
fi

printf '%s  %s\n' e142b664e4d65d770b42cf91a97f8f5e7d56d40fa2321ed43a40a7b4d0e4c66a leerhelden-update.tar.gz | sha256sum --check -
tar -xzf leerhelden-update.tar.gz

for page in index.html taal/index.html taalhelden/index.html rekenhelden/index.html topohelden/index.html leerroute/index.html; do
  test -s "dist/$page"
done
