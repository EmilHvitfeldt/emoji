library(testthat)

test_that("keycap works", {

  expect_equal(
    keycap(1),
    emoji("keycap_1")
  )

  expect_equal(
    keycap("#"),
    emoji("keycap_hash")
  )

  expect_equal(
    keycap("*"),
    emoji("keycap_star")
  )

  expect_equal(
    keycap(0:10),
    vapply(paste0("keycap_", 0:10), emoji,
           FUN.VALUE = character(1), USE.NAMES = FALSE)
  )

  expect_equal(
    keycap(c(1, 15)),
    c(emoji("keycap_1"), NA)
  )
})
