library(testthat)

test_that("flag works", {

  expect_equal(
    flag("denmark"),
    emoji_name[["flag_Denmark"]]
  )

  expect_equal(
    flag(c("Denmark", "Vietnam")),
    unname(emoji_name[c("flag_Denmark", "flag_Vietnam")])
  )

  expect_equal(
    flag(c("Denmark", "nothing")),
    c(emoji_name[["flag_Denmark"]], NA)
  )

  expect_equal(
    flag("US Virgin Islands"),
    flag("U.S. Virgin Islands")
  )

  expect_equal(
    flag("US Virgin Islands"),
    flag("u.s. virgin islands")
  )

  expect_error(flag("nothing"))
})
