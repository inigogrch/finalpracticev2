library(tidyverse)
source("R/prepare_penguin_data.R")

data <- read_csv("data/penguins.csv")
# Summary statistics
glimpse(data)
summarise(data, mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))

# Visualizations
ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal()

# Prepare data for modeling
model_data <- prepare_penguin_data(data)
saveRDS(model_data, file.path("results", "model-data.rds"))