library(testthat)
library(emoji)

test_that("Both aliases work with emoji()", {
  aliases <- emojis$aliases[[1]]

  expect_identical(
    emoji(aliases[1]),
    emoji(aliases[2])
  )
})

test_that("emoji() is lax with spaces, underscores, dashes and cases", {
  exp <- emoji("racing car")

  expect_identical(emoji("racing_car"), exp)
  expect_identical(emoji("racing-car"), exp)
  expect_identical(emoji("racing  car"), exp)
  expect_identical(emoji("racing--car"), exp)
  expect_identical(emoji("racing - car"), exp)
  expect_identical(emoji("racing  CAR"), exp)
})

