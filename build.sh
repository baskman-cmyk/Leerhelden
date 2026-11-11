#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f dist/index.html ]]; then
  sha256sum --check SHA256SUMS.txt
  cat site-part-* | tar -xzf -
fi

printf '%s  %s\n' e3e7e8664f2dc8143827cbc0aea01b76cc2078e63f4214ae95fdd196829ca009 leerhelden-update.tar.gz | sha256sum --check -
tar -xzf leerhelden-update.tar.gz

for page in index.html taal/index.html taalhelden/index.html rekenhelden/index.html topohelden/index.html leerroute/index.html; do
  test -s "dist/$page"
done
