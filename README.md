<!--
SPDX-FileCopyrightText: 2022 - 2024 Ali Sajid Imami

SPDX-License-Identifier: CC0-1.0
-->

# A replacement for char

[![Continuous integration](https://github.com/AliSajid/charx/actions/workflows/ci.yaml/badge.svg)](https://github.com/AliSajid/charx/actions/workflows/ci.yaml)
![crates.io package](https://img.shields.io/crates/v/charx.svg)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/release/AliSajid/charx)
![Crates.io](https://img.shields.io/crates/l/charx)

[![Contribute with Gitpod](https://img.shields.io/badge/Contribute%20with-Gitpod-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/AliSajid/charx)
[![Code of Conduct: Contributor Covenant](https://img.shields.io/badge/code_of_conduct-contributor_covenant-14cc21)](https://github.com/EthicalSource/contributor_covenant)



This crate provides a replacement for the `char` type that is more ergonomic to use.

Because Rust's `char::is_ascii*` family of functions takes `&self`, it's impossible to use them as patterns. This is inconsistent with the rest of `char::is_*`, which takes `self`.

This crate provides `char`-taking variants of the `is_ascii*` family of functions.

## Builds

| Platform | Rust Version |Status |
| -------- | ------ | ------ |
| Linux    | stable <br/> beta <br/> nightly <br/> MSRV (1.59.0) | ![Ubuntu x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-stable.json) <br/> ![Ubuntu x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-beta.json) <br/> ![Ubuntu x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-nightly.json) <br/> ![Ubuntu x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/ubuntu-msrv.json) |
| Windows  | stable <br/> beta <br/> nightly <br/> MSRV (1.59.0) | ![macos x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-stable.json) <br/> ![macos x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-beta.json) <br/> ![macos x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-nightly.json) <br/> ![macos x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/windows-msrv.json) |
| macos    | stable <br/> beta <br/> nightly <br/> MSRV (1.59.0) | ![Windows x Stable Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-stable.json) <br/> ![Windows x Beta Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-beta.json) <br/> ![Windows x Nightly Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-nightly.json) <br/> ![Windows x MSRV Rust](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/AliSajid/d52f912107d7609656370db9d741596c/raw/macos-msrv.json) |


## License

`charx` is distributed under the Zero Clause BSD license. See [LICENSE](LICENSE) for details of the license.

## Contributing

While this is a single crate with a single focus, We're happy to accept contributions. Pull Requests are welcome. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.
You can also use the link below to open an IDE in the cloud to contribute to this project.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/AliSajid/charx)
