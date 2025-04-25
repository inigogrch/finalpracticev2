source("R/split_penguin_data.R")
library(tidyverse)
library(tidymodels)

# Split data
model_data <- split_penguin_data(readRDS("results/model-data.rds"))
train_data <- model_data$train
test_data <- model_data$test

# Define model
penguin_model <- nearest_neighbor(mode = "classification", neighbors = 5) %>%
  set_engine("kknn")

# Create workflow
penguin_workflow <- workflow() %>%
  add_model(penguin_model) %>%
  add_formula(species ~ .)

# Fit model
penguin_fit <- penguin_workflow %>%
  fit(data = train_data)
saveRDS(penguin_fit, "results/penguin_model.rds")