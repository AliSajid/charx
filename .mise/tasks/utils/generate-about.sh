#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Generate machine-readable and markdown license reports"

set -euo pipefail

log() { printf '[utils:generate-about] %s\n' "$*"; }
die() { printf '[utils:generate-about] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "$#" -ne 0 ]]; then
	die "this task does not accept positional arguments"
fi

require_cmd mise

log "Generating JSON license report via utils:generate-about-json"
mise run utils:generate-about-json

log "Generating markdown license report via utils:generate-about-md"
mise run utils:generate-about-md

[[ -s "licenses_report.json" ]] || die "expected output was not produced: licenses_report.json"
[[ -s "licenses_report.md" ]] || die "expected output was not produced: licenses_report.md"

log "License reports generated"
