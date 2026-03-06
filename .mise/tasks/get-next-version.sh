#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2023 - 2024 Ali Sajid Imami
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

#MISE description="Dry-run semantic-release to see whether we are doing a release"

NEXT_VERSION=$(cog bump --auto --dry-run --skip-untracked)

if [ "$NEXT_VERSION" == "" ]; then
    echo "Bump-able commits found."
    echo "There will be a next version."
    echo "new_release=true" >>"$GITHUB_OUTPUT"
    echo "new_release_version=${NEXT_VERSION}" >>"$GITHUB_OUTPUT"
else
    echo "No bump-able commits found"
    echo "There will be no next version."
    echo "new_release=false" >>"$GITHUB_OUTPUT"
    echo "new_release_version=''" >>"$GITHUB_OUTPUT"

fi
