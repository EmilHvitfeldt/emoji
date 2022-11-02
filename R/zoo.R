#' Random Animals
#'
#' This function returns random animals emojis.
#'
#' @param size a non-negative integer giving the number of items to choose.
#' @param replace should sampling be with replacement? Defaults to `FALSE`.
#'
#' @return Character vector of animal emojis.
#' @export
#'
#' @examples
#' set.seed(1234)
#'
#' zoo(1)
#'
#' zoo(10)
zoo <- function(size, replace = FALSE) {
  not_animals <- c("feather", "spider web", "pig nose", "paw prints")

  animals <- emoji::emojis[grep("animal", emoji::emojis$subgroup), ]
  animals <- animals[animals$qualified == "fully-qualified", ]
  animals <- animals[!animals$name %in% not_animals, ]
  animals <- animals[!grepl("face", animals$name), ]

  sample(animals$emoji, size = size, replace = replace)
}

