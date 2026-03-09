#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Build the crate in debug mode"
# [MISE] alias="b"
# [MISE] depends=["clean"]

set -euo pipefail

log() { printf '[build] %s\n' "$*"; }
die() { printf '[build] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "$#" -ne 0 ]]; then
	die "this task does not accept positional arguments"
fi

require_cmd cargo
[[ -f "Cargo.toml" ]] || die "Cargo.toml not found; run this task from the project root"

log "Building debug artifacts"
cargo build --verbose
log "Build completed"
