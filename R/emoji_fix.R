#' Turn emojis into qualified emojis
#'
#' Some emojis can be written in multiple different ways either as
#' `fully-qualified`, `minimally-qualified`, or `unqualified`. `emoji_fix()`
#' will take any emoji and return the `fully-qualified` version of that emoji.
#'
#' @param x Characters, vector of emojis.
#'
#' @details
#' This function is vectorized.
#'
#' @return vector of fully-qualified emojis
#' @export
#'
#' @examples
#' unqualified_ind <- which(emojis$qualified == "unqualified")[1:10]
#' unqualified <- emojis$emoji[unqualified_ind]
#'
#' unqualified
#' emoji_fix(unqualified)
emoji_fix <- function(x) {
  ind <- match(x, emoji::emojis$emoji)
  name <- emoji::emojis$name[ind]
  fq_emojis <- emoji::emojis[emoji::emojis$qualified == "fully-qualified", ]
  fq_emojis$emoji[match(name, fq_emojis$name)]
}
