% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rx.R
\name{emoji_extract}
\alias{emoji_extract}
\alias{emoji_extract_all}
\title{Extract emojis from a string}
\usage{
emoji_extract(string)

emoji_extract_all(string, simplify = FALSE)
}
\arguments{
\item{string}{Input vector.}

\item{simplify}{see \code{\link[stringr:str_extract]{stringr::str_extract_all()}}}
}
\value{
A character vector
}
\description{
vectorised over \code{string}
}
\examples{
chars <- c(letters[1:4], emoji_name[1:6])

set.seed(1234)

strings <- lapply(1:10, function(x) paste(sample(chars, x), collapse = ""))

extracts <- emoji_extract(strings)

all_extracts <- emoji_extract_all(strings)
}
\seealso{
\code{\link[stringr:str_extract]{stringr::str_extract()}} and \code{\link[stringr:str_extract]{stringr::str_extract_all()}}
}
