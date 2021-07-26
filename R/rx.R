#' A regular expression to catch all emojis
#'
#' This regex will capture all `fully-qualified` and `minimally-qualified`
#' emojis.
#'
#' @source \url{https://www.unicode.org/reports/tr51/#emoji_data}
#'
#' @format character vector
"emoji_rx"

#' Detect the presence or absence of emojis in a string
#'
#' Vectorised over `string`
#'
#' @param string Input vector. Either a character vector, or something coercible
#'     to one.
#' @inheritParams stringr::str_detect
#'
#' @return A logical vector
#' @seealso [stringr::str_detect()]
#'
#' @export
emoji_detect <- function(string, negate = FALSE) {
  str_detect(string, emoji::emoji_rx, negate)
}

#' Keep strings containing an emoji, or find positions
#'
#' @param string input vector
#' @inheritParams stringr::str_subset
#'
#' @return A character vector
#'
#' @seealso [stringr::str_subset()]
#' @export
emoji_subset <- function(string, negate = FALSE) {
  str_subset(string, emoji::emoji_rx, negate)
}

#' @rdname emoji_subset
#'
#' @export
emoji_which <- function(string, negate = FALSE) {
  str_which(string, emoji::emoji_rx, negate)
}

#' Count the number of emojis in a string
#'
#' Vectorised over `string`
#'
#' @param string Input vector
#' @return An integer vector
#' @seealso [stringr::str_count()]
#' @export
emoji_count <- function(string) str_count(string, emoji::emoji_rx)

#' Extract emojis from a string
#'
#' vectorised over `string`
#'
#' @param string Input vector.
#' @param simplify see [stringr::str_extract_all()]
#'
#' @seealso [stringr::str_extract()] and [stringr::str_extract_all()]
#' @return A character vector
#' @export
emoji_extract <- function(string) str_extract(string, emoji::emoji_rx)

#' @rdname emoji_extract
#' @export
emoji_extract_all <- function(string, simplify = FALSE) {
  str_extract_all(string, emoji::emoji_rx, simplify)
}

#' Extract emojis from a string
#'
#' Vectorized over `string`
#'
#' @param string Input vector
#' @return see [stringr::str_match()]
#'
#' @seealso [stringr::str_match]
#' @export
emoji_match <- function(string) str_match(string, emoji::emoji_rx)

#' @rdname emoji_match
#' @export
emoji_match_all <- function(string) str_match_all(string, emoji::emoji_rx)

#' Replace emojis in a string
#'
#' Vectorised over `string` and `replacement`
#'
#' @param string Input vector
#' @param replacement A character vector of replacements. Should either be
#'   of length 1 or the same length as `string`. See [stringr::str_replace()]
#'   for details
#'
#' @return A character vector
#' @export
emoji_replace <- function(string, replacement) {
  str_replace(string, emoji::emoji_rx, replacement)
}

#' @rdname emoji_replace
#' @export
emoji_replace_all <- function(string, replacement) {
  str_replace_all(string, emoji::emoji_rx, replacement)
}

#' Locate the position of emojis in a string
#'
#' Vectorised over `string`
#'
#' @param string Input vector
#' @return For `emoji_locate` an integer matrix, for `emoji_locate_all` a list
#'   of integer matrices
#' @export
emoji_locate <- function(string) str_locate(string, emoji::emoji_rx)

#' @rdname emoji_locate
#' @export
emoji_locate_all <- function(string) str_locate_all(string, emoji::emoji_rx)
