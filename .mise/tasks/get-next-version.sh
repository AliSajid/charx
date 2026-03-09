#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Dry-run semantic-release and emit release flags for CI"
# [USAGE] arg "<calling-branch>" help="base branch being evaluated (usually main or next)"

set -euo pipefail

log() { printf '[get-next-version] %s\n' "$*"; }
die() { printf '[get-next-version] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "$#" -ne 1 ]]; then
    die "exactly one argument is required: <calling-branch>"
fi

require_cmd cog

CALLING_BRANCH=$1
NEXT_VERSION=$(cog bump --auto --dry-run --skip-untracked)
GITHUB_OUTPUT=${GITHUB_OUTPUT:-/dev/stdout}

emit() {
    printf '%s\n' "$1" >>"$GITHUB_OUTPUT"
}

set_release_state() {
    local prerelease_flag="$1"
    emit "prerelease=$prerelease_flag"
    if [[ -n "$NEXT_VERSION" ]]; then
        log "Bump-able commits found; a new release will be created"
        emit "new_release=true"
    else
        log "No bump-able commits found; no release will be created"
        emit "new_release=false"
    fi
}

case "$CALLING_BRANCH" in
next)
    log "Branch is 'next'; prerelease mode enabled"
    set_release_state true
    ;;
main)
    log "Branch is 'main'; stable release mode enabled"
    set_release_state false
    ;;
*)
    log "Branch '$CALLING_BRANCH' does not trigger releases"
    emit "new_release=false"
    emit "prerelease=false"
    ;;
esac
