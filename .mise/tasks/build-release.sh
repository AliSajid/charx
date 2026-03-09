#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - 2024 Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Build release artifacts and checksums for one or more binaries"
# [MISE] alias="br"
# [USAGE] arg "<binary>" var=#true help="one or more binary names to package"

set -euo pipefail

log() { printf '[build-release] %s\n' "$*"; }
die() { printf '[build-release] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat <<'EOF'
USAGE:
  TARGET=<target-triple> [CROSS=true|false] mise run build-release <binary> [binary...]

Examples:
  TARGET=x86_64-unknown-linux-gnu mise run build-release charx
  TARGET=aarch64-apple-darwin CROSS=true mise run build-release charx
EOF
    exit 0
fi

[[ "$#" -gt 0 ]] || die "at least one binary name is required"
[[ -n "${TARGET:-}" ]] || die "TARGET must be set"

BINARIES=("$@")
CROSS=${CROSS:-false}
DIST_DIR=dist

require_cmd cargo

# Setup cargo command
CARGO="cargo"
if [[ "$CROSS" == "true" ]]; then
    require_cmd cross
    CARGO="cross"
fi

CHECKSUM_CMD=""
if command -v shasum >/dev/null 2>&1; then
    CHECKSUM_CMD="shasum --algorithm 256"
elif command -v sha256sum >/dev/null 2>&1; then
    CHECKSUM_CMD="sha256sum"
else
    die "missing checksum command: install shasum or sha256sum"
fi

# Create the dist directory
mkdir -p "$DIST_DIR"
log "Building ${#BINARIES[@]} binary artifact(s) for $TARGET using $CARGO"

# Build and package binaries
for BIN in "${BINARIES[@]}"; do
    log "Building $BIN for $TARGET"
    $CARGO build --bin "$BIN" --release --target "$TARGET" --verbose

    ARTIFACT_PATH="$DIST_DIR/$BIN-$TARGET"
    if [[ "$TARGET" == *windows-gnu ]]; then
        cp "target/$TARGET/release/$BIN.exe" "$ARTIFACT_PATH.exe"
        ARTIFACT_PATH="$ARTIFACT_PATH.exe"
    else
        cp "target/$TARGET/release/$BIN" "$ARTIFACT_PATH"
    fi

    log "Generating checksum for $ARTIFACT_PATH"
    $CHECKSUM_CMD "$ARTIFACT_PATH" >"$DIST_DIR/$BIN-$TARGET-SHA256SUM.txt"
done

log "Release artifacts generated in $DIST_DIR"
