% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rx.R
\name{emoji_subset}
\alias{emoji_subset}
\alias{emoji_which}
\title{Keep strings containing an emoji, or find positions}
\usage{
emoji_subset(string, negate = FALSE)

emoji_which(string, negate = FALSE)
}
\arguments{
\item{string}{input vector}

\item{negate}{If \code{TRUE}, return non-matching elements.}
}
\value{
A character vector
}
\description{
Keep strings containing an emoji, or find positions
}
\examples{
string <- c(letters[1:4], emoji_name[1:6])

emoji_subset(string) == emoji_name[1:6]
emoji_subset(string, negate = TRUE)

emoji_which(string)
emoji_which(string, negate = TRUE)
}
\seealso{
\code{\link[stringr:str_subset]{stringr::str_subset()}}
}
