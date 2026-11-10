#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -f dist/index.html ]]; then
  sha256sum --check SHA256SUMS.txt
  cat site-part-* | tar -xzf -
fi

printf '%s  %s\n' 6f2a431d6ef8e80d2d5fa8e9c83e917e82d8defda36e6676c523ccd7a711e16d leerhelden-update.tar.gz | sha256sum --check -
tar -xzf leerhelden-update.tar.gz

for page in index.html taal/index.html taalhelden/index.html rekenhelden/index.html topohelden/index.html leerroute/index.html; do
  test -s "dist/$page"
done
