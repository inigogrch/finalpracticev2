test_that("prepare_penguin_data selects and transforms correctly", {
  raw <- palmerpenguins::penguins %>% tidyr::drop_na()
  df <- prepare_penguin_data(raw)

  expect_equal(names(df), c("species", "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"))
  expect_s3_class(df$species, "factor")
})
