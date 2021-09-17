library(testthat)

test_that("medal works", {

  midnight <- as.POSIXct("2021-09-17 00:00:00 PDT")

  expect_equal(
    clock(midnight),
    emoji_name[["clock12"]]
  )

  expect_equal(
    clock(midnight + 60 * 60 * c(1, 13)),
    unname(emoji_name[c("clock1", "clock1")])
  )

  # Round is done right
  expect_equal(
    clock(midnight + 60 * 15 - 1),
    emoji_name[["clock12"]]
  )

  expect_equal(
    clock(midnight + 60 * 15),
    emoji_name[["clock1230"]]
  )

  expect_error(
    clock("nothing")
  )
})
