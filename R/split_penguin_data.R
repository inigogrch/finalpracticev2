#' Split Penguin Data into Training and Testing Sets
#'
#' This function splits the penguin data into training and testing sets,
#' stratified by species to maintain class balance.
#'
#' @param data A data frame containing the cleaned and prepared penguin data.
#' @param prop Proportion of the data to include in the training set. Defaults to 0.75.
#' @param seed An optional random seed for reproducibility. Defaults to 123.
#'
#' @return A list with two elements: `train` (training data) and `test` (testing data).
#' @export
#'
#' @examples
#' modeling_data <- prepare_penguin_data(load_penguin_data())
#' splits <- split_penguin_data(modeling_data)
#' train_data <- splits$train
#' test_data <- splits$test
#' @importFrom rsample initial_split training testing
split_penguin_data <- function(data, prop = 0.75, seed = 123) {
  set.seed(seed)

  data_split <- rsample::initial_split(data, prop = prop, strata = species)

  train_data <- training(data_split)
  test_data <- testing(data_split)

  return(list(train = train_data, test = test_data))
}
