#!/usr/bin/env bash

## http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# Fully resolve base directory: http://stackoverflow.com/a/246128
# shellcheck disable=SC2030
BASE_DIR="${BASE_DIR:-$(d() { (cd -P "$(dirname "$1")" && pwd); }; while [ -h "${S=${BASH_SOURCE[0]}}" ]; do D=$(d "$S"); S=$(readlink "$S"); [[ $S != /* ]] && S="$D/$S"; done; d "$S")}"

repos/dotbot/bin/dotbot \
  -d "$BASE_DIR" \
  -c "dotbot.yml" \
  --plugin-dir repos/dotbot-brewfile \
  "$@"
