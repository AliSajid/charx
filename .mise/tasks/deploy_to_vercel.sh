#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - 2024 Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

# [MISE] description="Build and deploy the docs site to Vercel"
# [MISE] alias="docs"

set -euo pipefail

log() { printf '[deploy_to_vercel] %s\n' "$*"; }
die() { printf '[deploy_to_vercel] ERROR: %s\n' "$*" >&2; exit 1; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"; }

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat <<'EOF'
USAGE:
  PROJECT_ENVIRONMENT=preview|production VERCEL_TOKEN=<token> mise run deploy_to_vercel

Builds `guide/` with mdBook, then runs `vercel build` and `vercel deploy`.
EOF
    exit 0
fi

if [[ "$#" -ne 0 ]]; then
    die "this task does not accept positional arguments"
fi

require_cmd mdbook
require_cmd vercel

PROJECT_ENVIRONMENT=${PROJECT_ENVIRONMENT:-}
VERCEL_TOKEN=${VERCEL_TOKEN:-}
[[ -n "$PROJECT_ENVIRONMENT" ]] || die "PROJECT_ENVIRONMENT must be set to preview or production"
[[ -n "$VERCEL_TOKEN" ]] || die "VERCEL_TOKEN must be set"

case "$PROJECT_ENVIRONMENT" in
preview | production) ;;
*) die "PROJECT_ENVIRONMENT must be 'preview' or 'production' (got: $PROJECT_ENVIRONMENT)" ;;
esac

# Step 1: Populate Preview Variables
log "Pulling Vercel environment variables for $PROJECT_ENVIRONMENT"
vercel pull --yes --environment="$PROJECT_ENVIRONMENT" --token="$VERCEL_TOKEN"

# Step 2: Build the Book
log "Building mdBook content"
mdbook build guide

# Common options for Vercel build and deploy commands
BUILD_OPTIONS=(--cwd guide/book --token "$VERCEL_TOKEN" --yes --debug)
DEPLOY_OPTIONS=(--prebuilt --cwd guide/book --token "$VERCEL_TOKEN" --yes --debug)

if [[ "$PROJECT_ENVIRONMENT" == "preview" ]]; then
    log "Running preview deployment"
    vercel build "${BUILD_OPTIONS[@]}"
    vercel deploy "${DEPLOY_OPTIONS[@]}" >deployment_url
else
    log "Running production deployment"
    vercel build "${BUILD_OPTIONS[@]}"
    vercel deploy "${DEPLOY_OPTIONS[@]}" --prod >deployment_url
fi

# Output deployment URL
log "Deployment completed. URL:"
cat deployment_url
