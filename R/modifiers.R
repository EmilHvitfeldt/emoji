#' Remove Modifiers from Emojis
#'
#' @param x Characters, vector of emojis.
#'
#' @details
#' This function is vectorized. See [emoji_modifiers] for full list of modified
#' emojis and their unmodified state.
#'
#' @return character vector, single emojis will be replaced with un-modified if
#'   possible.
#' @export
#'
#' @examples
#' waving_hands <- emojis$emoji[grepl("waving hand", emojis$name)]
#' waving_hands
#'
#' emoji_modifier_remove(waving_hands)
#'
#' set.seed(1234)
#' emoji_sample <- sample(emojis$emoji, 10)
#' emoji_sample
#'
#' emoji_modifier_remove(emoji_sample)
emoji_modifier_remove <- function(x) {
  matches <- match(x, emoji::emoji_modifiers$emoji_modifiers)
  matches <- emoji::emoji_modifiers$emoji[matches]

  res <- x
  res[!is.na(matches)] <- matches[!is.na(matches)]
  res
}

#' Extract Modifiers from Emojis
#'
#' @param x Characters, vector of emojis.
#'
#' @details
#' This function is vectorized. See [emoji_modifiers] for full list of modified
#' emojis and their unmodified state.
#'
#' @return list of character vectors.
#'
#' @export
#'
#' @examples
#' waving_hands <- emojis$emoji[grepl("waving hand", emojis$name)]
#' waving_hands
#'
#' emoji_modifier_extract(waving_hands)
#'
#' set.seed(1234)
#' emoji_sample <- sample(emojis$emoji, 10)
#' emoji_sample
#'
#' emoji_modifier_extract(emoji_sample)
emoji_modifier_extract <- function(x) {
  matches <- match(x, emoji::emoji_modifiers$emoji_modifiers)
  matches <- emoji::emoji_modifiers$modifiers[matches]

  res <- lapply(x, function(x) character())
  res[!is.na(matches)] <- matches[!is.na(matches)]
  res
}




