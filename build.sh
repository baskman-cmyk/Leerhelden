#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
sha256sum --check <<'CHECKSUMS'
1b679444d38206a5e4ef6d5698132bbd75e9f23ac1d1c01f0606ec5b2b421cc1  site-20261126-publicatie24-part-00
d8804e7f3682e0103771613d8aed366738ee96005b5d9426920693070684b479  site-20261126-publicatie24-part-01
284f8aceec4a22fece31d4a3c810e34f7ecfd253d17d96646e78130514382767  site-20261126-publicatie24-part-02
CHECKSUMS
stage_dir="$(mktemp -d .leerhelden-build.XXXXXX)"
trap 'rm -rf "$stage_dir"' EXIT
cat site-20261126-publicatie24-part-00 site-20261126-publicatie24-part-01 site-20261126-publicatie24-part-02 | tar -xzf - -C "$stage_dir"
test -f "$stage_dir/dist/index.html"
test -f "$stage_dir/dist/ouders/index.html"
test -f "$stage_dir/dist/wereld/data/wereld-bank.json"
test -f "$stage_dir/dist/wereld/data/verhalen.json"
test -f "$stage_dir/dist/wereld/canon/index.html"
test -f "$stage_dir/dist/taalhelden/data/startchecks.json"
test -f "$stage_dir/dist/shared/family.js"
rm -rf dist
mv "$stage_dir/dist" dist
