#' Summarise your p-values with emoji
#'
#' @param x A vector of p-values.
#' @param names A character vector, for each of the p-value cutoff points.
#'   The names are being passed to `emoji()`.
#' @param cutpoints A numeric vector of cutpoints between emojis.
#' @param legend Logical, denotes if the result should be returned with a
#'   legend.
#'
#' @details
#' This function is vectorized. The input `cutpoints` must be 1 shorter than the
#' `names` input. The input `cutpoints` should not include 0 or 1 and be in
#' accending order.
#'
#' @export
#' @examples
#' set.seed(1234)
#' emoji_p(1)
#' emoji_p(0.1)
#' emoji_p(0.05)
#' emoji_p(0.01)
#' emoji_p(1e-6)
#'
#' emoji_p(0.01, legend = TRUE)
#'
#' emoji_p(rbeta(50, 2, 5))
#'
#' emoji_p(
#'   runif(100, 0, 0.1),
#'   names = c("flexed biceps", "hundred points", "thumbs down", "thumbs up"),
#'   cutpoints = c(0.001, 0.01, 0.05)
#' )
emoji_p <- function(x,
                    names = c("laughing", "joy", "grin",
                              "smile", "thinking", "poop"),
                    cutpoints = c(1e-5, 0.001, 0.01, 0.05, 0.1),
                    legend = FALSE) {
  stopifnot(is.numeric(x))

  if (length(names) != (length(cutpoints) + 1)) {
    stop("`names` and `cutpoints` must be the same length.")
  }

  cutpoints <- c(0, cutpoints, 1)

  symbols <- vapply(names, emoji, character(1), USE.NAMES = FALSE)

  if (legend) {
    res <- stats::symnum(
      x,
      corr = FALSE,
      na = FALSE,
      cutpoints = cutpoints,
      symbols = symbols
    )
  } else {
    res <- symbols[as.numeric(cut(x, cutpoints))]
  }
  res
}




