// SPDX-FileCopyrightText: 2022 - 2024 Soni L.
// SPDX-FileCopyrightText: 2022 - 2025 Ali Sajid Imami
//
// SPDX-License-Identifier: 0BSD

//! A replacement for char
//! ======================
//!
//! Because Rust's `char::is_ascii*` family of functions takes `&self`, it's
//! impossible to use them as patterns. This is inconsistent with the rest of
//! `char::is_*`, which takes `self`.
//!
//! This crate provides `char`-taking variants of the `is_ascii*` family of
//! functions.
//!
//! # Examples
//!
//! This works:
//!
//! ```rust
//! "hello".trim_start_matches(char::is_numeric);
//! ```
//!
//! This doesn't:
//!
//! ```rust compile_fail
//! "hello".trim_start_matches(char::is_ascii_digit);
//! ```
//!
//! This crate provides an alternative:
//!
//! ```rust
//! "hello".trim_start_matches(charx::is_ascii_digit);
//! ```

macro_rules! charx_fn {
    ($name:ident) => {
        #[doc=concat!("Same as [`char::", stringify!($name), "`] but takes `char` instead of `&char`. Returns true if the character satisfies the condition.")]
        ///
        /// # Examples
        ///
        /// This doesn't compile:
        ///
        /// ```rust compile_fail
        #[doc=concat!("\"hello\".trim_start_matches(char::", stringify!($name), ");")]
        /// ```
        ///
        /// But this does:
        ///
        /// ```rust
        #[doc=concat!("\"hello\".trim_start_matches(charx::", stringify!($name), ");")]
        /// ```
        ///
        /// # Example Output
        ///
        #[doc=concat!("assert!(charx::", stringify!($name), "('A')); // returns true")]
        #[doc=concat!("assert!(!charx::", stringify!($name), "('z')); // returns false")]
        #[inline(always)]
        #[must_use]
        pub const fn $name(ch: char) -> bool {
            char::$name(&ch)
        }
    };
    ($($name:ident)*) => {
        $(charx_fn!($name);)*

        #[cfg(test)]
        mod tests {
            use super::*;

            fn check_charx_fn(ch: char, name: &str, func: fn(char) -> bool, std_func: fn(&char) -> bool) {
                assert_eq!(func(ch), std_func(&ch), "Function `{}` failed for character: {:?}", name, ch);
            }

            #[test]
            fn test_charx_fns() {
                let fns: &[(&str, fn(char) -> bool, fn(&char) -> bool)] = &[
                    $((stringify!($name), $name, char::$name)),*
                ];

                (0..=0x10FFFF)
                    .filter_map(std::char::from_u32)  // filter out invalid code points
                    .for_each(|ch| {
                        for &(name, func, std_func) in fns {
                            check_charx_fn(ch, name, func, std_func);
                        }
                    });
            }
        }
    };
}

charx_fn!(is_ascii
is_ascii_alphabetic
is_ascii_alphanumeric
is_ascii_control
is_ascii_digit
is_ascii_graphic
is_ascii_hexdigit
is_ascii_lowercase
is_ascii_punctuation
is_ascii_uppercase
is_ascii_whitespace);
