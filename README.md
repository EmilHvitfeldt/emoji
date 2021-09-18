
<!-- README.md is generated from README.Rmd. Please edit that file -->

# emoji

<!-- badges: start -->

[![R-CMD-check](https://github.com/EmilHvitfeldt/emoji/workflows/R-CMD-check/badge.svg)](https://github.com/EmilHvitfeldt/emoji/actions)
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
#>    emoji name  group subgroup version points nrunes runes qualified vendor_apple
#>    <chr> <chr> <chr> <chr>    <chr>   <list>  <int> <chr> <chr>     <lgl>       
#>  1 😀    grin… Smil… face-sm… 1.0     <int …      1 1F600 fully-qu… TRUE        
#>  2 😃    grin… Smil… face-sm… 0.6     <int …      1 1F603 fully-qu… TRUE        
#>  3 😄    grin… Smil… face-sm… 0.6     <int …      1 1F604 fully-qu… TRUE        
#>  4 😁    beam… Smil… face-sm… 0.6     <int …      1 1F601 fully-qu… TRUE        
#>  5 😆    grin… Smil… face-sm… 0.6     <int …      1 1F606 fully-qu… TRUE        
#>  6 😅    grin… Smil… face-sm… 0.6     <int …      1 1F605 fully-qu… TRUE        
#>  7 🤣    roll… Smil… face-sm… 3.0     <int …      1 1F923 fully-qu… TRUE        
#>  8 😂    face… Smil… face-sm… 0.6     <int …      1 1F602 fully-qu… TRUE        
#>  9 🙂    slig… Smil… face-sm… 1.0     <int …      1 1F642 fully-qu… TRUE        
#> 10 🙃    upsi… Smil… face-sm… 1.0     <int …      1 1F643 fully-qu… TRUE        
#> # … with 4,692 more rows, and 9 more variables: vendor_google <lgl>,
#> #   vendor_twitter <lgl>, vendor_one <lgl>, vendor_facebook <lgl>,
#> #   vendor_messenger <lgl>, vendor_samsung <lgl>, vendor_windows <lgl>,
#> #   keywords <list>, aliases <list>
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
