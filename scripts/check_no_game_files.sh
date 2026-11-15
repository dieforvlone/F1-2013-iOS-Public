#!/usr/bin/env bash
# Fails if game files or generated game code are present in a checkout.
set -euo pipefail
root="${1:-.}"
found="$(find "$root" -path "$root/.git" -prune -o -type f \( \
  -iname '*.xex' -o -iname '*.iso' -o -iname '*.god' -o -iname '*.stfs' \
  -o -iname '*.big' -o -iname '*.pak' -o -iname '*_recomp.*.cpp' \) -print)"
if [ -n "$found" ]; then
  echo "Game files or generated game code found; they must not be committed here:" >&2
  echo "$found" >&2
  exit 1
fi
echo "No game files found."
