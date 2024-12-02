#' Convert MNE to Variables
#'
#' Converts MNE data into MAU, PMAU, and AcReMAU variables.
#'
#' @param MNE The MNE dataset.
#' @return A list containing data frames of MNE, MAU, PMAU, and AcReMAU.
#' @export
convertMNEtoVariables <- function(MNE,  individuals = NULL) {
  # Max values
  max_values <- c(1, 1, 1, 7, 12, 5, 1, 24, 2, 2, 2, 2, 2, 16, 10, 28, 1, 1, 2, 2, 2, 2, 2, 14, 10, 28)
  # Ensure MNE is a data frame
  if (!is.data.frame(MNE)) {
    MNE <- as.data.frame(MNE)
  }


  # Calculate MNI if individuals are not provided
  if (is.null(individuals)) {
    MNI <- ceiling(MNE / matrix(max_values, nrow = nrow(MNE), ncol = length(max_values), byrow = TRUE))
    individuals <- apply(MNI, 1, max)
  }

  # Expand max_values to match the dimensions of MNE
  max_matrix <- matrix(max_values, nrow = nrow(MNE), ncol = length(max_values), byrow = TRUE)

  # Expand individuals to match the dimensions of MNE
  individuals_matrix <- matrix(individuals, nrow = nrow(MNE), ncol = length(max_values), byrow = FALSE)

  # Compute Abundance for each part
  abundance <- MNE / (max_matrix * individuals_matrix)

  # Compute Mean Abundance (MA)
  ma <- rowSums(MNE, na.rm = TRUE) / (sum(max_values) * individuals)

  # Compute Mean Part Abundance (MPA)
  mpa <- rowSums(abundance, na.rm = TRUE) / ncol(abundance)

  # Compute metrics
  MAU <- abundance
  PMAU <- MAU / apply(MAU, 1, max, na.rm = TRUE)
  ReMAU <- MAU / rowSums(MAU, na.rm = TRUE)
  AcReMAU <- t(apply(ReMAU, 1, cumsum)) # Cumulative ReMAU

  # Combine results into a list of tibbles
  results <- list(
    MNE = as.data.frame(MNE),
    MAU = as.data.frame(MAU),
    PMAU = as.data.frame(PMAU),
    AcReMAU = as.data.frame(AcReMAU)
  )

  return(results)
}
