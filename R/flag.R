#' Insert Flag Emojis
#'
#' @param name Character denoting the place of the flag. Set `return_key = TRUE`
#'     to get full list of allowed names.
#' @param return_key Logical, set to TRUE to get full list of allowed names.
#'
#' @details
#' This function is vectorized. The input is being normalized before matching
#' which will hopefully lead to lower friction and easier matching. Punctuation
#' is being removed and case is not taken into consideration when matching.
#' You can run `flag(return_key = TRUE)` to get full list of allowed names.
#'
#' @return Character vector of emojis.
#' @export
#'
#' @examples
#' flag(c("Vietnam", "Greenland", "Estonia", "Denmark", "united states"))
#'
#' flag(c("US Virgin Islands", "U.S. Virgin Islands", "u.s. virgin islands"))
flag <- function(name, return_key = FALSE) {
  flag_emojis <- emoji::emojis[emoji::emojis$subgroup == "country-flag", ]
  flag_names <- gsub("^flag: ", "", flag_emojis$name)

  if (return_key) {
    return(sort(flag_names))
  }

  matches <- match(clean_string(name), clean_string(flag_names))

  if (all(is.na(matches))) {
    stop("Couldn't find emoji '", name, "'")
  }

  flag_emojis$emoji[matches]
}

clean_string <- function(x) {
  x <- gsub('[[:punct:]]','', x)
  x <- gsub(' +',' ', x)
  tolower(x)
}
