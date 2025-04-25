test_that("split_penguin_data creates stratified train/test split", {
  raw <- palmerpenguins::penguins %>% tidyr::drop_na() %>% prepare_penguin_data()
  split <- split_penguin_data(raw)

  expect_type(split, "list")
  expect_true(all(c("train", "test") %in% names(split)))
  expect_gt(nrow(split$train), 0)
  expect_gt(nrow(split$test), 0)
})
