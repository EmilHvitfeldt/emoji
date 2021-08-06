#' Insert medal emojis
#'
#' @param place Character denoting the place of the medal. See details for
#'     allowed names.
#'
#' @details
#' This function is vectorized. There are a 1st, 2nd and 3rd place medals and
#' allowed names are listed below. Note that matches are made without case.
#'
#' \itemize{
##'  \item{1st place medal}{"1", "1st", or "gold"}
##'  \item{2nd place medal}{"2", "2nd", or "silver"}
##'  \item{3rd place medal}{"3", "3rd", or "bronze"}
##' }
#'
#'#@return Character vector of emojis.
#' @export
#' @examples
#' medal(1:3)
#'
#' medal("gold")
#' medal("Gold")
medal <- function(place) {
  places <- c(
    "1" = "1st place medal",
    "2" = "2nd place medal",
    "3" = "3rd place medal",
    "1st" = "1st place medal",
    "2nd" = "2nd place medal",
    "3rd" = "3rd place medal",
    "gold" = "1st place medal",
    "silver" = "2nd place medal",
    "bronze" = "3rd place medal"
  )

  place <- places[tolower(as.character(place))]

  emoji::emojis[match(place, emoji::emojis$name), ]$emoji
}


