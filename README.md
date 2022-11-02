
<!-- README.md is generated from README.Rmd. Please edit that file -->

# emoji <a href='https://emilhvitfeldt.github.io/emoji'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/EmilHvitfeldt/emoji/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/EmilHvitfeldt/emoji/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/EmilHvitfeldt/emoji/branch/main/graph/badge.svg)](https://app.codecov.io/gh/EmilHvitfeldt/emoji?branch=main)
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
#> # A tibble: 4,702 × 19
#>    emoji name  group subgr…¹ version points nrunes runes quali…² vendo…³ vendo…⁴
#>    <chr> <chr> <chr> <chr>   <chr>   <list>  <int> <chr> <chr>   <lgl>   <lgl>  
#>  1 😀    grin… Smil… face-s… 1.0     <int>       1 1F600 fully-… TRUE    TRUE   
#>  2 😃    grin… Smil… face-s… 0.6     <int>       1 1F603 fully-… TRUE    TRUE   
#>  3 😄    grin… Smil… face-s… 0.6     <int>       1 1F604 fully-… TRUE    TRUE   
#>  4 😁    beam… Smil… face-s… 0.6     <int>       1 1F601 fully-… TRUE    TRUE   
#>  5 😆    grin… Smil… face-s… 0.6     <int>       1 1F606 fully-… TRUE    TRUE   
#>  6 😅    grin… Smil… face-s… 0.6     <int>       1 1F605 fully-… TRUE    TRUE   
#>  7 🤣    roll… Smil… face-s… 3.0     <int>       1 1F923 fully-… TRUE    TRUE   
#>  8 😂    face… Smil… face-s… 0.6     <int>       1 1F602 fully-… TRUE    TRUE   
#>  9 🙂    slig… Smil… face-s… 1.0     <int>       1 1F642 fully-… TRUE    TRUE   
#> 10 🙃    upsi… Smil… face-s… 1.0     <int>       1 1F643 fully-… TRUE    TRUE   
#> # … with 4,692 more rows, 8 more variables: vendor_twitter <lgl>,
#> #   vendor_one <lgl>, vendor_facebook <lgl>, vendor_messenger <lgl>,
#> #   vendor_samsung <lgl>, vendor_windows <lgl>, keywords <list>,
#> #   aliases <list>, and abbreviated variable names ¹​subgroup, ²​qualified,
#> #   ³​vendor_apple, ⁴​vendor_google
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
#> $Aries
#> [1] "ram"   "aries"
#> 
#> $army
#> [1] "military_helmet"
#> 
#> $arrivals
#> [1] "flight_arrival"
#> 
#> $arriving
#> [1] "flight_arrival"
#> 
#> $arrow
#>  [1] "cupid"                     "calling"                  
#>  [3] "envelope_with_arrow"       "bow_and_arrow"            
#>  [5] "up_arrow"                  "up_right_arrow"           
#>  [7] "right_arrow"               "down_right_arrow"         
#>  [9] "down_arrow"                "down_left_arrow"          
#> [11] "left_arrow"                "up_left_arrow"            
#> [13] "up_down_arrow"             "right_arrow_curving_left" 
#> [15] "left_arrow_curving_right"  "right_arrow_curving_up"   
#> [17] "right_arrow_curving_down"  "arrows_clockwise"         
#> [19] "arrows_counterclockwise"   "back"                     
#> [21] "end"                       "on"                       
#> [23] "soon"                      "top"                      
#> [25] "twisted_rightwards_arrows" "repeat"                   
#> [27] "repeat_one"                "play_button"              
#> [29] "fast_forward"              "reverse_button"           
#> [31] "rewind"                    "last_track_button"        
#> [33] "arrow_up_small"            "arrow_double_up"          
#> [35] "arrow_down_small"          "arrow_double_down"        
#> 
#> $art
#> [1] "performing_arts" "art"
```

when can use `emoji_keyword` together with `emoji_name` to show then
emojis for each keyword.

``` r
lapply(emoji_keyword[c(150:155)], function(x) unname(emoji_name[x]))
#> $Aries
#> [1] "🐏" "♈"
#> 
#> $army
#> [1] "🪖"
#> 
#> $arrivals
#> [1] "🛬"
#> 
#> $arriving
#> [1] "🛬"
#> 
#> $arrow
#>  [1] "💘" "📲" "📩" "🏹" "⬆️"  "↗️"  "➡️"  "↘️"  "⬇️"  "↙️"  "⬅️"  "↖️"  "↕️"  "↩️"  "↪️" 
#> [16] "⤴️"  "⤵️"  "🔃" "🔄" "🔙" "🔚" "🔛" "🔜" "🔝" "🔀" "🔁" "🔂" "▶️"  "⏩" "◀️" 
#> [31] "⏪" "⏮️"  "🔼" "⏫" "🔽" "⏬"
#> 
#> $art
#> [1] "🎭" "🎨"
```

## Code of Conduct

Please note that the emoji project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
