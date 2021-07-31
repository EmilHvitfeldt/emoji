library(testthat)
library(emoji)

test_that("Both aliases work with emoji()", {
  aliases <- emojis$aliases[[1]]

  expect_identical(
    emoji(aliases[1]),
    emoji(aliases[2])
  )
})
