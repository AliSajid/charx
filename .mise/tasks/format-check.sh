#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - 2024 Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Check Rust formatting with rustfmt"

set -euo pipefail

log() { printf '[format-check] %s\n' "$*"; }
die() { printf '[format-check] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "$#" -ne 0 ]]; then
	die "this task does not accept positional arguments"
fi

require_cmd cargo
[[ -f "Cargo.toml" ]] || die "Cargo.toml not found; run this task from the project root"

log "Checking formatting"
cargo fmt --all -- --check
log "Formatting check completed"
