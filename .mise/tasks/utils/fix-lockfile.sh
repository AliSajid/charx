#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Rebuild Cargo.lock after merge conflict resolution"

set -euo pipefail

log() { printf '[utils:fix-lockfile] %s\n' "$*"; }
die() { printf '[utils:fix-lockfile] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "$#" -ne 0 ]]; then
    die "this task does not accept positional arguments"
fi

require_cmd cargo

if [[ -f Cargo.lock ]]; then
    log "Removing existing Cargo.lock"
    rm -v Cargo.lock
    log "Regenerating lockfile via cargo update"
    cargo update
elif [[ -f Cargo.toml ]]; then
    log "No existing Cargo.lock found; generating one via cargo update"
    cargo update
else
    die "Cargo.toml not found; this task must run in a Rust project root"
fi

log "Lockfile refresh completed"
