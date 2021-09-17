#' Insert Arrow emojis
#'
#' @param direction Character denoting the direction of the arrow. Should be one
#'   of “up”, “up-right”, “right”, “down-right”, “down”, “down-left”, “left”,
#'   “up-left”, “up-down”, or “left-right”.
#'
#' @details
#' This function is vectorized. Wrong input of `direction` will result in `NA`s.
#'
#'#@return Character vector of emojis.
#' @export
#' @examples
#' arrow("up-down")
#'
#' arrow(c("up", "up", "down", "down", "left", "right", "left", "right"))
arrow <- function(direction) {
  directions <- c("up", "up-right", "right", "down-right", "down", "down-left",
                  "left", "up-left", "up-down", "left-right")
  direction <- directions[match(direction, directions)]
  direction_name <- match(paste(direction, "arrow", sep = " "),
                          emoji::emojis$name)
  emoji::emojis$emoji[direction_name]
}
