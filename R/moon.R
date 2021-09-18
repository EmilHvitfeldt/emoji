#' Insert Moon Phase Emoji
#'
#' @param date a date
#' @param day number of days since new moon
#'
#' @details
#' This function is vectorized.
#' If not supplied, `day` is calculated using the
#' approximation of [day_in_synodic_cycle], i.e the number of
#' days since a known new moon modulo `29.530588853` days.
#'
#'
#' @rdname moon
#' @return a moon emoji
#' @export
#'
#' @examples
#' moon(Sys.Date())
#'
#' january <- as.Date("2021-01-01") + 0:30
#' moon(january)
moon <- function(date, day = day_in_synodic_cycle(date)){
  idx <- 1 + (day / synodic_month * 8) %% 8

  moons <- emoji::emojis[grepl("moon$", emoji::emojis$name) &
                         emoji::emojis$name != "crescent moon", ]

  moons$emoji[idx]
}

# see https://en.wikipedia.org/wiki/Lunar_phase
synodic_month <- 29.530588853

#' Calculate the number of days in the synodic month
#'
#' This uses the approximation described in the
#' [lunar phase wikipedia page](https://en.wikipedia.org/wiki/Lunar_phase), i.e.
#' the number of days since `1900/01/01` modulo the length of
#' a synodic month (`29.530588853` days)
#'
#' @param date a date
#'
#' @examples
#' day_in_synodic_cycle(Sys.Date())
#' @export
#' @keywords internal
day_in_synodic_cycle <- function(date){
  ref_date <- structure(-25567, class = "Date") # 1900/01/01
  days <- as.numeric(difftime( date , ref_date, units = "days"))
  days %% synodic_month
}
