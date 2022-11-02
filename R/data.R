#' Full List of Emojis
#'
#' This data set is the heart of the emoji package. It contains various
#' information regarding all the avaiable emojis as of v15.0.
#'
#' @source [Unicode® Full Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/full-emoji-list.html)
#' @source [Unicode® Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/emoji-list.html)
#' @source [Unicode® Emoji Ordering, v15.0](https://www.unicode.org/emoji/charts/emoji-ordering.txt)
#' @source \url{https://github.com/github/gemoji}
#' @source \url{https://github.com/muan/emojilib}
#'
#' @details
#' The levels of `qualified` have the following meaining
#' - **component**: an Emoji_Component, excluding Regional_Indicators, ASCII, and
#'   non-Emoji.
#' - **fully-qualified**: a fully-qualified emoji (see ED-18 in UTS #51), excluding
#'   Emoji_Component
#' - **minimally-qualified**: a minimally-qualified emoji (see ED-18a in UTS #51)
#' - **unqualified**: a unqualified emoji (See ED-19 in UTS #51)
#'
#' @format tibble with `r ncol(emojis)` columns and `nrow(emojis)` rows
#' \describe{
#'   \item{emoji}{character representation of the emoji}
#'   \item{name}{name}
#'   \item{group}{group, e.g. "Smileys & People"}
#'   \item{subgroup}{sub group, e.g. "face-positive"}
#'   \item{version}{version where the emoji was introduced}
#'   \item{points}{Decimal Code Point(s)}
#'   \item{nrunes}{number of runes the emoji uses}
#'   \item{runes}{vector of unicode runes, i.e. hexadecimal representations
#'                prefixed with "U+"}
#'   \item{qualified}{Status of the emoji, can be one of 4 types; "component",
#'                    "fully-qualified", "minimally-qualified", and
#'                    "unqualified". See details for more.}
#'   \item{vendor_* for apple ... windows}{logical indicating if the given
#'                                         vendor supports the emoji}
#'   \item{keywords}{vector of keywords}
#'   \item{keywords}{vector of aliases}
#' }
#'
#' @seealso emoji_name emoji_keyword
"emojis"

#' Emoji Names
#'
#' This vector is a named vector of emojis, where then names are unique
#' descriptive identifiers for the emojis. This vector is well suited to be used
#' as a tool to replace emojis with natural language descriptions.
#'
#' Some emojis will appear multiple times since they have multiple names
#' associated with them. Such as "grinning" and "grinning_face" leading to the
#' same emoji.
#'
#' @source [Unicode® Full Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/full-emoji-list.html)
#' @source [Unicode® Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/emoji-list.html)
#' @source [Unicode® Emoji Ordering, v15.0](https://www.unicode.org/emoji/charts/emoji-ordering.txt)
#' @source \url{https://github.com/github/gemoji}
#' @source \url{https://github.com/muan/emojilib}
#'
#' @format named character vector with `r length(emoji_name)` elements
#'
#' @seealso emojis emoji_keyword
"emoji_name"

#' Emoji Keywords
#'
#' This list contains information about which emojis are contained in which
#' keywords.
#'
#' @source [Unicode® Full Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/full-emoji-list.html)
#' @source [Unicode® Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/emoji-list.html)
#' @source [Unicode® Emoji Ordering, v15.0](https://www.unicode.org/emoji/charts/emoji-ordering.txt)
#' @source \url{https://github.com/github/gemoji}
#' @source \url{https://github.com/muan/emojilib}
#'
#' @format named list of characters with `r length(emoji_keyword)` elements
#'
#' @seealso emojis emoji_name
"emoji_keyword"

#' Emoji Modifiers
#'
#' This data set contains all the emojis with modifiers, their unmodified
#' version as well as a list of the the modifiers.
#'
#' @source [Unicode® Full Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/full-emoji-list.html)
#' @source [Unicode® Emoji Charts v15.0](https://www.unicode.org/emoji/charts-15.0/emoji-list.html)
#' @source [Unicode® Emoji Ordering, v15.0](https://www.unicode.org/emoji/charts/emoji-ordering.txt)
#' @source \url{https://github.com/github/gemoji}
#' @source \url{https://github.com/muan/emojilib}
#'
#' @format tibble with `r ncol(emoji_modifiers)` columns and
#' `nrow(emoji_modifiers)` rows
#' \describe{
#'   \item{emoji_modifiers}{character representation of the emoji with modifiers}
#'   \item{emoji}{character representation of the emoji without modifiers}
#'   \item{modifiers}{list of modifiers}
#' }
#'
#' @seealso emojis emoji_name
"emoji_modifiers"
