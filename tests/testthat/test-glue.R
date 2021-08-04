library(testthat)
library(glue)

test_that("emoji_glue works", {
  expect_equal(
    emoji_glue("I love :taco:s"),
    glue("I love {emoji('taco')}s")
  )

  expect_error(emoji_glue(":nothing:"))
})
