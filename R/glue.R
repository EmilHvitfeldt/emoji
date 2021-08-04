#' Glue Interpolation for Emojis
#'
#' Combine the power of `glue::glue` and `emoji()`.
#'
#' @inheritParams glue::glue
#'
#' @details
#' `emoji_glue()` behaves in much the same way a lot of messaging apps work.
#' Anything inside a pair of `:` will be interpolated into an emoji.
#' You can think of `emoji_glue()` as being a shorthand for
#' `glue("I love {emoji('taco')}s")`.
#'
#' Block ending with `*` will be collapsed.
#'
#' @return a `glue::glue()` string.
#' @export
#'
#' @examples
#' emoji_glue("I love :taco:s")
#'
#' emoji_glue("one :heart:")
#' emoji_glue("many :heart*:")
emoji_glue <- function(..., .envir = parent.frame()) {
  glue::glue(..., .open = ":", .close = ":", .envir = .envir,
             .transformer = emoji_transformer)
}

emoji_transformer <- function(text, envir) {
  if (grepl("[*]$", text)) {
    text <- sub("[*]$", "", text)
    glue::glue_collapse(emoji_find(text)$emoji)
  } else {
    emoji(text)
  }
}
