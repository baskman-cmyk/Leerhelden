#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
sha256sum --check <<'CHECKSUMS'
262f4f10f6379eaeac3eb2de1b31ed57f2c5575cda9f73a5df0c0530f32bdce6  site-20261123-startchecks-informatie-part-00
2f7d95fa64494496b4cb2574d462177f3c0e917247f78a52fe3421031c2ebccf  site-20261123-startchecks-informatie-part-01
638be56469178bd0575233c90f175212fd1dd33f69acc4737e11807cfc9478dc  site-20261123-startchecks-informatie-part-02
CHECKSUMS
stage_dir="$(mktemp -d .leerhelden-build.XXXXXX)"
trap 'rm -rf "$stage_dir"' EXIT
cat site-20261123-startchecks-informatie-part-00 site-20261123-startchecks-informatie-part-01 site-20261123-startchecks-informatie-part-02 | tar -xzf - -C "$stage_dir"
test -f "$stage_dir/dist/index.html"
test -f "$stage_dir/dist/ouders/index.html"
test -f "$stage_dir/dist/wereld/data/wereld-bank.json"
test -f "$stage_dir/dist/wereld/data/verhalen.json"
test -f "$stage_dir/dist/wereld/canon/index.html"
test -f "$stage_dir/dist/taalhelden/data/startchecks.json"
test -f "$stage_dir/dist/shared/family.js"
rm -rf dist
mv "$stage_dir/dist" dist
