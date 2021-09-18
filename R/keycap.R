#' Keycap emoji sequence
#'
#' @param x character, must be a number between 0 and 10, "#", or "*".
#'
#' @export
#' @return a keycap version of `x`
#'
#' @details
#' This function is vectorized.
#'
#' @examples
#' keycap(6)
#' keycap('#')
#'
#' keycap(1:10)
keycap <- function(x) {
  choices <- c("#", "*", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
  x <- as.character(x)

  keycaps <- emoji::emojis$emoji[emoji::emojis$subgroup == "keycap" &
                                 emoji::emojis$qualified == "fully-qualified"]

  keycaps[match(x, choices)]
}
