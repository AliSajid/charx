#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - 2024 Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Audit the crate's dependencies for security issues"
# [MISE] alias="a"
# [MISE] sources=["Cargo.toml", "Cargo.lock"]
# [USAGE] arg "[extra-args]" var=#true help="optional arguments passed to cargo audit"

set -euo pipefail

log() { printf '[audit] %s\n' "$*"; }
die() { printf '[audit] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

require_cmd cargo-audit
[[ -f "Cargo.toml" ]] || die "Cargo.toml not found; run this task from the project root"

log "Running dependency audit"
cargo audit "$@"
log "Dependency audit completed"
