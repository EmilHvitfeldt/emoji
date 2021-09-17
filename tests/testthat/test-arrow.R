library(testthat)

test_that("arrow works", {

  expect_equal(
    arrow("up"),
    emoji_name[["arrow_up"]]
  )

  expect_equal(
    arrow(c("down-right", "down")),
    unname(emoji_name[c("down_right_arrow", "arrow_down")])
  )

  expect_equal(
    arrow(c("up", "nothing")),
    c(emoji_name[["arrow_up"]], NA)
  )
})
