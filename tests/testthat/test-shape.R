library(testthat)

test_that("shape works", {

  expect_equal(
    shape("green", "heart"),
    emoji_name[["green_heart"]]
  )

  expect_equal(
    shape("green", c("heart", "square", "heart")),
    unname(emoji_name[c("green_heart", "green_square", "green_heart")])
  )

  expect_equal(
    shape(c("yellow", "red", "orange"), c("heart", "square", "heart")),
    unname(emoji_name[c("yellow_heart", "red_square", "orange_heart")])
  )

  expect_equal(
    shape(c("white", "black"), "square"),
    unname(emoji_name[c("white_large_square", "black_large_square")])
  )

  expect_equal(
    shape("green", c("heart", "square", "nothing")),
    c(unname(emoji_name[c("green_heart", "green_square")]), NA)
  )
})
