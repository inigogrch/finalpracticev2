#' Prepare Penguin Data for Modeling
#'
#' This function selects relevant numeric features and the target variable (species) from 
#' a cleaned penguin dataset and ensures the species column is a factor.
#'
#' @param data A cleaned data frame of penguin data, typically the output of `load_penguin_data()`.
#'
#' @return A data frame ready for modeling, with selected features and factor-encoded species.
#' @export
#'
#' @examples
#' cleaned_penguins <- load_penguin_data()
#' modeling_data <- prepare_penguin_data(cleaned_penguins)
prepare_penguin_data <- function(data) {
  
  data <- data %>%
    select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
    mutate(species = as.factor(species))
  
  return(data)
}