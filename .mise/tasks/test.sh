#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Run the test suite with nextest"
# [MISE] alias="ta"
# [MISE] sources=["Cargo.toml", "src/**/*.rs"]
# [MISE] outputs=["target/debug/libcharx*"]
# [MISE] depends=["clean", "build"]
# [USAGE] arg "[extra-args]" var=#true help="optional arguments passed to cargo nextest run"

set -euo pipefail

log() { printf '[test] %s\n' "$*"; }
die() {
    printf '[test] ERROR: %s\n' "$*" >&2
    exit 1
}
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

require_cmd cargo
require_cmd cargo-nextest
[[ -f "Cargo.toml" ]] || die "Cargo.toml not found; run this task from the project root"

log "Running tests via cargo nextest"
cargo nextest run "$@"
log "Test run completed"
