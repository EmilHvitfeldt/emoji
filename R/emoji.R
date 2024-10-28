#' Find a single emoji
#'
#' This function starts by looking for exact matches in `emoji_name`. If none is
#' found in `emoji_name` then it looks in `emoji_keyword`. `emoji_keyword` can
#' produce more then 1 matches, which will lead to one being returned at random.
#'
#' @param keyword Character, either name or keyword. If more than one emoji has
#'     the specified keyword, will pick one at random.
#'
#' @details
#' This function isn't vectorized and will thus only work with 1 keyword at a
#' time.
#'
#' @export
#' @examples
#' emoji("smile")
#' emoji("taco")
#'
#' set.seed(1234)
#' replicate(24, emoji("clock"))
#' replicate(10, emoji("flag"))
emoji <- function(keyword) {
  stopifnot(is.character(keyword), length(keyword) == 1)

  keyword <- tolower(keyword)
  keyword <- stringr::str_replace_all(keyword, "[ \\-_]+", "_")

  # First look in names
  if (keyword %in% names(emoji::emoji_name)) {
    return(emoji::emoji_name[[keyword]])
  }

  if (keyword %in% names(emoji::emoji_keyword)) {
    candidates <- emoji::emoji_keyword[[keyword]]
    name <- sample(candidates, 1)

    return(emoji::emoji_name[[name]])
  }

  stop("Couldn't find emoji '", keyword, "'")
}

#' List all emoji with a given keyword
#'
#' This function will look in `emoji_keyword` to report back the given emojis.
#'
#' @param keyword Character, Emoji keyword.
#' @export
#' @examples
#' emoji_find("happy")
#' emoji_find("cat")
#' emoji_find("family")
emoji_find <- function(keyword) {
  names <- emoji::emoji_keyword[[keyword]]
  if (length(names) == 0) {
    stop("Couldn't find any emoji with '", keyword, "'")
  }

  tibble::tibble(
    name = names,
    emoji = unname(emoji::emoji_name[names])
  )
}
