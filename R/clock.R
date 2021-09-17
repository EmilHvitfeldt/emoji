#' emoji version of time
#'
#' @param time a `POSIXct` object
#'
#' @details
#' This function is vectorized.
#'
#' @return Character vector of emojis showing the closest time.
#' @export
#'
#' @examples
#' times <- as.POSIXct("2021-09-17 14:33:21 PDT") + seq(1:30) * 3500
#' clock(times)
clock <- function(time){
  hour   <- as.numeric(format(time, "%I"))
  minute <- as.numeric(format(time, "%M"))

  x <- round(1 + 2 * hour %% 12 + minute / 30) %% 24

  idx <- which(
    emoji::emojis$subgroup == "time" &
    grepl("(o.clock|thirty)", emoji::emojis$name)
  )

  emoji::emojis[idx[x], ]$emoji
}
