library(testthat)

test_that("emoji_rx captures all emojis", {
  mini_q_emojis <- emoji::emojis$emoji[emoji::emojis$qualified == "minimally-qualified"]
  fully_q_emojis <- emoji::emojis$emoji[emoji::emojis$qualified == "fully-qualified"]
  component_emojis <- emoji::emojis$emoji[emoji::emojis$qualified == "component"]
  unqualified_emojis <- emoji::emojis$emoji[emoji::emojis$qualified == "unqualified"]

  expect_true(all(emoji_detect(mini_q_emojis)))
  expect_true(all(emoji_detect(fully_q_emojis)))
  expect_true(all(emoji_detect(component_emojis)))
  expect_false(all(emoji_detect(unqualified_emojis)))
  expect_false(any(emoji_detect(letters)))
})
