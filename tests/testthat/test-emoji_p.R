library(testthat)

test_that("emoji_p works", {

  expect_equal(
    emoji_p(1),
    emoji("poop")
  )

  expect_equal(
    emoji_p(c(2e-6, 2e-5, 0.002, 0.02, 0.06, 0.2)),
    vapply(c("laughing", "joy", "grin", "smile", "thinking", "poop"), emoji,
           FUN.VALUE = character(1), USE.NAMES = FALSE)
  )

  expect_error(
    emoji_p("nothing")
  )
})
