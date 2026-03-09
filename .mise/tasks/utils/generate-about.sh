#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Generate machine-readable and markdown license reports"
# [MISE] depends=["utils:generate-about-json", "utils:generate-about-md"]

set -euo pipefail

log() { printf '[utils:generate-about] %s\n' "$*"; }
die() { printf '[utils:generate-about] ERROR: %s\n' "$*" >&2; exit 1; }

if [[ "$#" -ne 0 ]]; then
	die "this task does not accept positional arguments"
fi

log "License reports generated"
