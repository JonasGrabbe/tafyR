#' Add Last Row to MNE
#'
#' Combines two datasets into one MNE dataset.
#'
#' @param hpa The hpa dataset.
#' @param NewSite The new site data.
#' @return A combined MNE dataset.
#' @export
add_last_row_to_MNE <- function(MNE, new_site_data) {
  # Extract the numeric values to add as the new row
  new_row <- as.numeric(new_site_data[-c(1:8), ]$count)

  # Ensure the length of new_row matches the number of columns in MNE
  if (length(new_row) != ncol(MNE)) {
    stop("Length of new_row does not match the number of columns in MNE")
  }

  # Add the new row to MNE
  MNE <- rbind(MNE, new_row)

  # Return the updated MNE tibble
  return(MNE)
}
