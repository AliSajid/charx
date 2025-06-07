<!--
SPDX-FileCopyrightText: 2022 - 2025 Ali Sajid Imami

SPDX-License-Identifier: 0BSD
-->

<!-- omit in toc -->

# Contributing to `charx`

First off, thanks for taking the time to contribute! ❤️

All types of contributions are encouraged and valued. See the [Table of Contents](#table-of-contents) for different ways to help and details about how this project handles them. Please make sure to read the relevant section before making Your contribution. It will make it a lot easier for us maintainers and smooth out the experience for all involved. The community looks forward to Your contributions. 🎉

And if You like the project, but just don't have time to contribute, that's fine. You can participate using these other easy ways to support the project and show Your appreciation, which we would also be very happy about:

- Star the project
- Tweet about it
- Cite the project in Your publications if You found it helpful
- Refer this project in Your project's [README](README.md)
- Mention the project at local meetups and tell Your friends/colleagues

<!-- omit in toc -->

## Table of Contents

- [I Have a Question](#i-have-a-question)
- [I Want To Contribute](#i-want-to-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Your First Code Contribution](#Your-first-code-contribution)
  - [Improving The Documentation](#improving-the-documentation)
- [Style Guides](#style-guides)
  - [Commit Messages](#commit-messages)
- [Join The Project Team](#join-the-project-team)

## I Have a Question

If You want to ask a question, we assume that You have read the available [Documentation](https://docs.rs/charx).

Before You ask a question, it is best to search for existing [Issues](https://github.com/AliSajid/charx/issues) that might help You. In case You have found a suitable issue and still need clarification, You can write Your question in this issue. It is also advisable to search the internet for answers first.

If You then still feel the need to ask a question and need clarification, we recommend the following:

- Open an [Issue](https://github.com/AliSajid/charx/issues/new).
- Provide as much context as You can about what You're running into.
- Provide project and platform versions, depending on what seems relevant.

We will then take care of the issue as soon as possible.

## I Want To Contribute

### Legal Notice <!-- omit in toc -->

When contributing to this project, You must agree that You have authored 100% of the content, that You have the necessary rights to the content and that the content You contribute may be provided under the project license.

This project is licensed under the [Zero Clause BSD (0BSD) License](LICENSE). When You submit changes, Your submissions are understood to be under the same [Zero Clause BSD (0BSD) License](LICENSE) that covers the project. Feel free to contact the maintainers if that's a concern.

### Reporting Bugs

<!-- omit in toc -->

#### Before Submitting a Bug Report

A good bug report shouldn't leave others needing to chase You up for more information. Therefore, we ask You to investigate carefully, collect information and describe the issue in detail in Your report. Please complete the following steps in advance to help us fix any potential bug as fast as possible.

- Make sure that You are using the latest version.
- Determine if Your bug is really a bug and not an error on Your side e.g. using incompatible environment components/versions (Make sure that You have read the [documentation](https://docs.rs/charx). If You are looking for support, You might want to check [this section](#i-have-a-question)).
- To see if other users have experienced (and potentially already solved) the same issue You are having, check if there is not already a bug report existing for Your bug or error in the [bug tracker](https://github.com/AliSajid/charx/issues?q=label%3Abug).
- Also make sure to search the internet (including Stack Overflow) to see if users outside the GitHub community have discussed the issue.
- Collect information about the bug:
  - Stack trace (Traceback). We use RUST_BACKTRACE=1 to get a full stack trace.
  - OS, Platform and Version (Windows, Linux, macos, x86, ARM)
  - Version of Rust, Cargo, and other environment components if applicable
  - Possibly Your input and the output
  - Can You reliably reproduce the issue? And can You also reproduce it with older versions?

<!-- omit in toc -->

#### How Do I Submit a Good Bug Report?

We use GitHub issues to track bugs and errors. If You run into an issue with the project:

- Open an [Issue](https://github.com/AliSajid/charx/issues/new). (Since we can't be sure at this point whether it is a bug or not, we ask You not to talk about a bug yet and not to label the issue.)
- Explain the behavior You would expect and the actual behavior.
- Please provide as much context as possible and describe the _reproduction steps_ that someone else can follow to recreate the issue on their own. This usually includes Your code. For good bug reports You should isolate the problem and create a reduced test case.
- Provide the information You collected in the previous section.

Once it's filed:

- The project team will label the issue accordingly.
- A team member will try to reproduce the issue with Your provided steps. If there are no reproduction steps or no obvious way to reproduce the issue, the team will ask You for those steps and mark the issue as `needs-repro`. Bugs with the `needs-repro` tag will not be addressed until they are reproduced.
- If the team is able to reproduce the issue, it will be marked `needs-fix`, as well as possibly other tags (such as `critical`), and the issue will be left to be [implemented by someone](#Your-first-code-contribution).

### Suggesting Enhancements

This section guides You through submitting an enhancement suggestion for `charx`, **including completely new features and minor improvements to existing functionality**. Following these guidelines will help maintainers and the community to understand Your suggestion and find related suggestions.

<!-- omit in toc -->

#### Before Submitting an Enhancement

- Make sure that You are using the latest version.
- Read the [documentation](https://docs.rs/charx) carefully and find out if the functionality is already covered, maybe by an individual configuration.
- Perform a [search](https://github.com/AliSajid/charx/issues) to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.
- Find out whether Your idea fits with the scope and aims of the project. It's up to You to make a strong case to convince the project's developers of the merits of this feature. Keep in mind that we want features that will be useful to the majority of our users and not just a small subset. If You're just targeting a minority of users, consider writing an add-on/plugin library.

<!-- omit in toc -->

#### How Do I Submit a Good Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://github.com/AliSajid/charx/issues).

- Use a **clear and descriptive title** for the issue to identify the suggestion.
- Provide a **step-by-step description of the suggested enhancement** in as many details as possible.
- **Describe the current behavior** and **explain which behavior You expected to see instead** and why. At this point You can also tell which alternatives do not work for You.
- You may want to **include screenshots and animated GIFs** which help You demonstrate the steps or point out the part which the suggestion is related to. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macos and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux. <!-- this should only be included if the project has a GUI -->
- **Explain why this enhancement would be useful** to most `charx` users. You may also want to point out the other projects that solved it better and which could serve as inspiration.

### Your First Code Contribution

<!-- TODO
include Setup of env, IDE and typical getting started instructions?

-->

You can use [`rustup`](https://rustup.rs/) to install the latest stable version of Rust. You can also use [`rustup`](https://rustup.rs/) to install the latest Nightly version of Rust.
You can then use `cargo` to build and test the project.

### Improving The Documentation

<!-- TODO
Updating, improving and correcting the documentation

-->

We are always happy to accept any clarifications or additions to the documentation. Please use the same process outlined above for code contributions and submit a pull request.

## Style Guides

We use `rustfmt`, `clippy` and `cargo check` to ensure a consistent code style. We also use `cargo test` to ensure that all tests pass. Please do not allow specific `clippy` lints without discussion with the team first.

### Commit Messages

We use the Conventional Commits specification for commit messages. This leads to **more readable messages** that are easy to follow when looking through the **project history**. But also, the commit messages are used to **generate the `charx` change log**.

For the commit message itself, think of what will complete the following sentence and use that:

> If applied, this commit will _Your subject line here_

## Join The Project Team

We are always open to people joining our team. Please [open an issue](https://github.com/AliSajid/charx/issues) to alert the team that You are interested in joining. We will then discuss the details in the issue.

<!-- omit in toc -->

## Attribution

This guide is based on the **contributing-gen**. [Make Your own](https://github.com/bttger/contributing-gen)!
