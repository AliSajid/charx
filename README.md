<!--
SPDX-FileCopyrightText: 2022 - 2024 Ali Sajid Imami
SPDX-FileCopyrightText: 2022 - 2024 Soni L.

SPDX-License-Identifier: 0BSD
-->

# A replacement for char

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![OSS Lifecycle](https://img.shields.io/osslifecycle?file_url=https%3A%2F%2Fgithub.com%2FAliSajid%2Fcharx%2Fblob%2Fmain%2FOSSMETADATA)](https://github.com/AliSajid/charx/blob/main/OSSMETADATA)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/release/AliSajid/charx)](https://github.com/AliSajid/charx/releases/latest)
[![crates.io package](https://img.shields.io/crates/v/charx.svg)](https://crates.io/crates/charx)
[![Crates.io](https://img.shields.io/crates/l/charx)](https://choosealicense.com/licenses/0bsd/)

[![docs.rs](https://img.shields.io/docsrs/charx)](https://docs.rs/charx)
[![Continuous integration](https://github.com/AliSajid/charx/actions/workflows/ci.yaml/badge.svg)](https://github.com/AliSajid/charx/actions/workflows/ci.yaml)
[![GitHub Created At](https://img.shields.io/github/created-at/AliSajid/charx)](https://github.com/AliSajid/charx/commit/b420dd99b0554b0e8d71a41bf17a1814fcf98dcc)
![GitHub commits since latest release](https://img.shields.io/github/commits-since/alisajid/charx/latest)

![Crates.io MSRV](https://img.shields.io/crates/msrv/charx)
[![REUSE status](https://api.reuse.software/badge/github.com/AliSajid/charx)](https://api.reuse.software/info/github.com/AliSajid/charx)
[![Codecov](https://img.shields.io/codecov/c/github/AliSajid/charx)](https://app.codecov.io/gh/AliSajid/charx)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/293d6f6e3e5e4fadb1b88db426462f87)](https://app.codacy.com/gh/AliSajid/charx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/AliSajid/charx)](https://www.codefactor.io/repository/github/alisajid/charx)

[![Libraries.io SourceRank](https://img.shields.io/librariesio/sourcerank/cargo/charx)](https://libraries.io/cargo/charx)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/9684/badge)](https://www.bestpractices.dev/projects/9684)
[![OSSF-Scorecard Score](https://img.shields.io/ossf-scorecard/github.com/AliSajid/charx)](https://scorecard.dev/viewer/?uri=github.com/AliSajid/charx)

[![Code of Conduct: Contributor Covenant](https://img.shields.io/badge/code_of_conduct-contributor_covenant-14cc21)](https://github.com/EthicalSource/contributor_covenant)

This crate provides a replacement for the `char` type that is more ergonomic to use.

Because Rust's `char::is_ascii*` family of functions takes `&self`, it's impossible to use them as patterns. This is inconsistent with the rest of `char::is_*`, which takes `self`.

This crate provides `char`-taking variants of the `is_ascii*` family of functions.

## Builds

|         | Stable                                                                                                                                                             | Beta                                                                                                                                                           | Nightly                                                                                                                                                              | MSRV (1.59.0)                                                                                                                                                  |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Linux   | ![Ubuntu x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-stable.json)   | ![Ubuntu x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-beta.json)   | ![Ubuntu x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-nightly.json)   | ![Ubuntu x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-msrv.json)   |
| Windows | ![Windows x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-stable.json) | ![Windows x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-beta.json) | ![Windows x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-nightly.json) | ![Windows x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-msrv.json) |
| macos   | ![macos x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-stable.json)     | ![macos x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-beta.json)     | ![macos x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-nightly.json)     | ![macos x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-msrv.json)     |

## License

`charx` is distributed under the Zero Clause BSD license. See [LICENSE](LICENSE) for details of the license.

## Contributing

While this is a single crate with a single focus, We're happy to accept contributions. Pull Requests are welcome. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.
