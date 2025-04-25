#' Load and Clean Penguin Data
#'
#' This function loads the penguin dataset, performs initial cleaning by removing
#' missing values, and saves the cleaned data to a CSV file.
#'
#' @param output_file The path where the cleaned CSV data should be saved. Defaults to "data/penguins.csv".
#'
#' @return A data frame of cleaned penguin data.
#' @export
#'
#' @examples
#' cleaned_penguins <- load_penguin_data()
#' tmp <- tempfile(fileext = ".csv")
#' cleaned_penguins <- load_penguin_data(tmp)
#' @importFrom dplyr %>% select mutate
#' @importFrom tidyr drop_na
load_penguin_data <- function(output_file = NULL) {
  data <- palmerpenguins::penguins %>% tidyr::drop_na()

  if (!is.null(output_file)) {
    readr::write_csv(data, output_file)
  }

  return(data)
}
