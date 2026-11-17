#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
rm -rf dist
cat site-part-* | tar -xzf -
for page in index.html taal/index.html taalhelden/index.html rekenhelden/index.html topohelden/index.html leerroute/index.html; do
  test -s "dist/$page" || { echo "Missing: dist/$page" >&2; exit 1; }
done
