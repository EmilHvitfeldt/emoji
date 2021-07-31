test_that("No duplicated in names of `emoji_name`", {
  expect_equal(sum(duplicated(names(emoji_name))), 0)
})
