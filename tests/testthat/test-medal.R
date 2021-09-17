library(testthat)

test_that("medal works", {

  expect_equal(
    medal(1),
    emoji_name[["1st_place_medal"]]
  )

  expect_equal(
    medal(1:3),
    unname(emoji_name[c("1st_place_medal", "2nd_place_medal", "3rd_place_medal")])
  )

  expect_equal(
    medal(c("1st", "2nd", "3rd")),
    unname(emoji_name[c("1st_place_medal", "2nd_place_medal", "3rd_place_medal")])
  )

  expect_equal(
    medal(c("gold", "silver", "bronze")),
    unname(emoji_name[c("1st_place_medal", "2nd_place_medal", "3rd_place_medal")])
  )

  expect_equal(
    medal(c("gold", "nothing")),
    c(emoji_name[["1st_place_medal"]], NA)
  )
})
