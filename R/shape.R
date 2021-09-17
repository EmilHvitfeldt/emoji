#' Insert Arrow emojis
#'
#' @param color Character, denoting the color of the shape. Must be one of "red",
#'   "orange", "yellow", "green", "blue", "purple", "brown", "black", "white".
#' @param type Character, denoting the type of shape. Must be one of "heart",
#'   "circle", or "square.
#'
#' @details
#' This function is vectorized.
#'
#'#@return Character vector of emojis.
#' @export
#' @examples
#' shape("yellow", "heart")
#'
#' shape("yellow", c("heart", "circle", "square"))
#'
#' shape(color = c("red", "orange", "yellow", "green", "blue",
#'                 "purple", "brown", "black", "white"),
#'       type = "circle")
#'
#' outer(
#'   c("red", "orange", "yellow", "green", "blue",
#'     "purple", "brown", "black", "white"),
#'   c("heart", "circle", "square"),
#'   shape
#' )
shape <- function(color, type) {
  types <- c("heart", "circle", "square")
  colors <- c("red", "orange", "yellow", "green", "blue",
              "purple", "brown", "black", "white")

  type <- types[match(type, types)]
  color <- colors[match(color, colors)]

  if (length(type) > length(color)) {
    color <- rep(color, length.out = length(type))
  }
  if (length(color) > length(type)) {
    type <- rep(type, length.out = length(color))
  }

  color[color == "white" & type  == "square"] <- "white large"
  color[color == "black" & type  == "square"] <- "black large"

  name <- paste(color, type, sep = " ")
  emoji::emojis$emoji[match(name, emoji::emojis$name)]
}
