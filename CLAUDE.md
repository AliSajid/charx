<!--
SPDX-FileCopyrightText: 2026 Ali Sajid Imami

SPDX-License-Identifier: 0BSD
-->

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`charx` is a Rust crate that provides `char`-taking variants of the `is_ascii*` family of functions. The problem it solves: Rust's `char::is_ascii*` functions take `&self`, making them impossible to use as patterns in `trim_start_matches`, `trim_end_matches`, and similar methods. This crate provides ergonomic alternatives that take `self`.

**Core API example:**

```rust
"hello".trim_start_matches(charx::is_ascii_digit); // works!
// "hello".trim_start_matches(char::is_ascii_digit); // doesn't work (needs &self)
```

## Architecture

### Single-File Implementation

The entire library implementation lives in `src/lib.rs` (104 lines), using a macro `charx_fn!` to:

1. Generate all 12 functions from a single macro invocation
2. Automatically generate documentation
3. Embed test code that validates all functions against stdlib

### The 12 Functions

All functions wrap `char::$name(&ch)` from stdlib but take `char` instead of `&char`:

- `is_ascii_alphabetic`
- `is_ascii_alphanumeric`
- `is_ascii_control`
- `is_ascii_digit`
- `is_ascii_graphic`
- `is_ascii_hexdigit`
- `is_ascii_lowercase`
- `is_ascii_punctuation`
- `is_ascii_uppercase`
- `is_ascii_whitespace`
- `is_ascii` (deprecated, kept for compatibility)

### Build Configuration

**`Cargo.toml` profile settings:**

- Development profile: `opt-level = 0`, `debug = true`, `debug-assertions = true`, `overflow-checks = true`
- Release profile: `opt-level = 3`, `codegen-units = 1`, `lto = true`, `strip = true`

**Minimum supported Rust version (MSRV):** 1.59.0

### Tooling & Dependencies (via `mise.toml`)

The project uses `mise` for tool management. Key tools:

- `cargo:bacon` - test runner
- `cargo:cargo-audit` - dependency auditing
- `cargo:cargo-about` - project metadata
- `hk` - pre-commit hooks
- `cocogitto` - semantic versioning
- `aqua` - manages nextest and llvm-cov

## Common Development Tasks

### Running Tests

Run all tests with cargo:

```bash
cargo test
```

Run tests with nextest (faster):

```bash
cargo nextest run
```

Run a specific test:

```bash
cargo test test_charx_fns
```

### Building

Build the library:

```bash
cargo build
```

Build in release mode:

```bash
cargo build --release
```

Format check:

```bash
cargo fmt --check
```

Lint check:

```bash
cargo clippy -- -D warnings
```

### Code Coverage

Generate code coverage report:

```bash
cargo llvm-cov report
```

## CI Workflows

The CI workflow (`.github/workflows/ci.yaml`) orchestrates:

- **ci**: Matrix builds on ubuntu, windows, macos for stable, beta, nightly, and MSRV (1.59.0)
- **generate_code_coverage**: Code coverage generation using taiki-e/taiki-e
- **get_next_version**: Version bump preparation
- **semantic-release**: Automated release with changelog generation

**Trigger conditions:**

- Push to main/next
- PR merged to main/next
- Manual workflow dispatch

**Badge generation:**

- Uses `schneegans/dynamic-badges-action` to update GitHub badges
- Badge creation has random wait (3-10 seconds) to prevent rate limiting

## Governance & Style

### Commit Messages

Use Conventional Commits specification. The commit message should complete:
> If applied, this commit will _Your subject line here_

See `CHANGELOG.md` for examples of recent commits and their categorization.

### License

The project is licensed under Zero Clause BSD (0BSD).

### Code of Conduct

Uses Contributor Covenant Code of Conduct v2.0.

## Other Documentation

- `README.md` - Public project documentation with badges
- `CHANGELOG.md` - Changelog auto-generated from commits
- `CONTRIBUTING.md` - Contribution guidelines
- `GOVERNANCE.md` - Governance model
- `ROADMAP.md` - Project roadmap
- `SECURITY.md` - Security policy
- `CODE_OF_CONDUCT.md` - Community conduct guidelines

## Workflow Integration

When modifying source code:

1. Run `cargo test` to ensure tests pass
2. Run `cargo fmt --check` and `cargo clippy` to maintain code style
3. Verify coverage impact with `cargo llvm-cov report` if tests changed

When modifying `Cargo.toml`:

1. Consider MSRV compatibility (must remain >= 1.59.0)
2. The crate is intentionally minimal - no external dependencies
3. Profile settings in Cargo.toml affect build artifacts

When reviewing PRs:

1. Check that all CI matrix combinations pass
2. Verify the `test_charx_fns` test still validates all characters (#000-#10FFFF)
3. Ensure macro-based generation is preserved in `src/lib.rs`
