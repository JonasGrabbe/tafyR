#' Load Taphonomy Data from Excel
#'
#' This function loads taphonomy data from an Excel file and returns it as a tibble.
#'
#' @param file_path The path to the Excel file.
#' @return A tibble containing the taphonomy data.
#' @export
#' @examples
#' \dontrun{
#' NewSite <- load.tapho.data("path/to/yourfile.xlsx")
#' }
load.tapho.data <- function(file_path) {

  # Load necessary libraries
  library(tibble)
  library(readxl)

  # Check file extension
  file_extension <- tools::file_ext(file_path)

  # Read the data based on file extension
  if (file_extension == "csv") {
    data <- read.csv(file_path, stringsAsFactors = FALSE)
  } else if (file_extension %in% c("xls", "xlsx")) {
    data <- read_excel(file_path)
  } else {
    stop("Unsupported file type. Please provide a CSV or Excel file.")
  }

  # Convert the data to a tibble
  data_tibble <- as_tibble(data)

  # Rename the first two columns to "element" and "count"
  colnames(data_tibble)[1:2] <- c("element", "count")

  # Print the tibble
  #print(data_tibble)

  # Return the tibble (optional)
  return(data_tibble)
}
