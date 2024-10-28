
<!-- README.md is generated from README.Rmd. Please edit that file -->

# emoji <a href='https://emilhvitfeldt.github.io/emoji/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/EmilHvitfeldt/emoji/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/EmilHvitfeldt/emoji/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/emoji)](https://CRAN.R-project.org/package=emoji)
[![Downloads](https://cranlogs.r-pkg.org/badges/emoji)](https://CRAN.R-project.org/package=emoji)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![Codecov test
coverage](https://codecov.io/gh/EmilHvitfeldt/emoji/branch/main/graph/badge.svg)](https://app.codecov.io/gh/EmilHvitfeldt/emoji?branch=main)
[![Codecov test
coverage](https://codecov.io/gh/EmilHvitfeldt/emoji/graph/badge.svg)](https://app.codecov.io/gh/EmilHvitfeldt/emoji)
<!-- badges: end -->

The goal of emoji is to provide up to date information inn the form of
data sets on emojis and their use.

## Installation

You can install the released version of emoji from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("emoji")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/emoji")
```

## Example

The main data set in this package is the `emojis` data set which
contains almost all the information contained in this package.

``` r
library(emoji)

emojis
#> # A tibble: 5,042 × 19
#>    emoji name  group subgroup version points nrunes runes qualified vendor_apple
#>    <chr> <chr> <chr> <chr>    <chr>   <list>  <int> <chr> <chr>     <lgl>       
#>  1 😀    grin… Smil… face-sm… 1.0     <int>       1 1F600 fully-qu… FALSE       
#>  2 😃    grin… Smil… face-sm… 0.6     <int>       1 1F603 fully-qu… FALSE       
#>  3 😄    grin… Smil… face-sm… 0.6     <int>       1 1F604 fully-qu… FALSE       
#>  4 😁    beam… Smil… face-sm… 0.6     <int>       1 1F601 fully-qu… FALSE       
#>  5 😆    grin… Smil… face-sm… 0.6     <int>       1 1F606 fully-qu… FALSE       
#>  6 😅    grin… Smil… face-sm… 0.6     <int>       1 1F605 fully-qu… FALSE       
#>  7 🤣    roll… Smil… face-sm… 3.0     <int>       1 1F923 fully-qu… FALSE       
#>  8 😂    face… Smil… face-sm… 0.6     <int>       1 1F602 fully-qu… FALSE       
#>  9 🙂    slig… Smil… face-sm… 1.0     <int>       1 1F642 fully-qu… FALSE       
#> 10 🙃    upsi… Smil… face-sm… 1.0     <int>       1 1F643 fully-qu… FALSE       
#> # ℹ 5,032 more rows
#> # ℹ 9 more variables: vendor_google <lgl>, vendor_twitter <lgl>,
#> #   vendor_one <lgl>, vendor_facebook <lgl>, vendor_messenger <lgl>,
#> #   vendor_samsung <lgl>, vendor_windows <lgl>, keywords <list>, aliases <list>
```

the `emoji_name` is a vector of emojis with descriptive names

``` r
emoji_name[1:10]
#>                        grinning                   grinning_face 
#>                            "😀"                            "😀" 
#>                          smiley     grinning_face_with_big_eyes 
#>                            "😃"                            "😃" 
#>                           smile grinning_face_with_smiling_eyes 
#>                            "😄"                            "😄" 
#>                            grin  beaming_face_with_smiling_eyes 
#>                            "😁"                            "😁" 
#>                        laughing                       satisfied 
#>                            "😆"                            "😆"
```

Each of the emojis have zero or more keywords associated with them.

``` r
emoji_keyword[c(150:155)]
#> $`TRUE`
#> [1] "100"
#> 
#> $Taurus
#> [1] "ox"     "taurus"
#> 
#> $Tegh
#> [1] "khanda"
#> 
#> $Titania
#> [1] "fairy_woman"
#> 
#> $Tokyo
#> [1] "tokyo_tower"
#> 
#> $Triton
#> [1] "merman"
```

when can use `emoji_keyword` together with `emoji_name` to show then
emojis for each keyword.

``` r
lapply(emoji_keyword[c(150:155)], function(x) unname(emoji_name[x]))
#> $`TRUE`
#> [1] "💯"
#> 
#> $Taurus
#> [1] "🐂" "♉"
#> 
#> $Tegh
#> [1] "\U{01faaf}"
#> 
#> $Titania
#> [1] "🧚‍♀️"
#> 
#> $Tokyo
#> [1] "🗼"
#> 
#> $Triton
#> [1] "🧜‍♂️"
```

## Code of Conduct

Please note that the emoji project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
