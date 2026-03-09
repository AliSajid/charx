#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2022 - Ali Sajid Imami
#
# SPDX-License-Identifier: 0BSD

# [MISE] description="Generate licenses_report.json using cargo-about"
# [USAGE] arg "[output-file]" help="path for generated JSON output" default="licenses_report.json" required=#false

set -euo pipefail

log() { printf '[utils:generate-about-json] %s\n' "$*"; }
die() { printf '[utils:generate-about-json] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat <<'EOF'
USAGE:
  mise run utils:generate-about-json [output-file]

Generates a machine-readable license report from cargo-about.
EOF
    exit 0
fi

if [[ "$#" -gt 1 ]]; then
    die "expected at most one argument: [output-file]"
fi

require_cmd rustc
require_cmd cargo
require_cmd cargo-about
require_cmd jq

OUTPUT_FILE=${1:-licenses_report.json}

log "Generating JSON report at $OUTPUT_FILE"
cargo about generate --format json | jq --sort-keys --indent 4 -r >"$OUTPUT_FILE"
log "JSON report generated"
