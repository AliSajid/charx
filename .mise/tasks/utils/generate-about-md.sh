#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2022 - 2025 Ali Sajid Imami
#
# SPDX-License-Identifier: 0BSD

# [MISE] description="Generate licenses_report.md using cargo-about"
# [USAGE] arg "[template-file]" help="handlebars template path" default="meta/licenses.hbs" required=#false
# [USAGE] arg "[output-file]" help="path for generated markdown output" default="licenses_report.md" required=#false

set -euo pipefail

log() { printf '[utils:generate-about-md] %s\n' "$*"; }
die() { printf '[utils:generate-about-md] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat <<'EOF'
USAGE:
  mise run utils:generate-about-md [template-file] [output-file]

Generates a markdown license report from cargo-about.
EOF
    exit 0
fi

if [[ "$#" -gt 2 ]]; then
    die "expected at most two arguments: [template-file] [output-file]"
fi

require_cmd rustc
require_cmd cargo
require_cmd cargo-about

if command -v gexpand >/dev/null 2>&1; then
    EXPAND_CMD=(gexpand -t 4)
elif command -v expand >/dev/null 2>&1; then
    EXPAND_CMD=(expand -t 4)
else
    die "missing required command: gexpand or expand"
fi

TEMPLATE_FILE=${1:-meta/licenses.hbs}
OUTPUT_FILE=${2:-licenses_report.md}

[[ -f "$TEMPLATE_FILE" ]] || die "template file not found: $TEMPLATE_FILE"

log "Generating markdown report at $OUTPUT_FILE from $TEMPLATE_FILE"
cargo about generate --format handlebars "$TEMPLATE_FILE" | "${EXPAND_CMD[@]}" | tr -d '\r' >"$OUTPUT_FILE"
log "Markdown report generated"
