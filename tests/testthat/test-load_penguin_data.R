test_that("load_penguin_data loads and cleans data", {
  tmp <- tempfile(fileext = ".csv")
  df <- load_penguin_data(tmp)

  expect_s3_class(df, "data.frame")
  expect_true(all(c("species", "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g") %in% names(df)))
  expect_false(any(is.na(df)))
  expect_true(file.exists(tmp))
})
