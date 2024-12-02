#' Plot Abundance Function
#'
#' A wrapper function to process data and generate plots.
#'
#' @param NewSite The new site data.
#' @param hpa The hpa dataset.
#' @return A plotly figure.
#' @export
plot.abundance.function <- function(NewSite, hpa) {
  MNE <- add_last_row_to_MNE(hpa, NewSite)
  results <- convertMNEtoVariables(MNE)
  fig <- plot_dataframes(results)
  return(fig)
}
