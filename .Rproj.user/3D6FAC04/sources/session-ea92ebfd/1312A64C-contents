library(tibble)

# Function to generate a random vector with scaled max_values
generate_random_vector <- function() {
  # Original max_values
  max_values <- c(1, 1, 1, 7, 12, 5, 1, 24, 2, 2, 2, 2, 2, 16, 10, 28, 1, 1, 2, 2, 2, 2, 2, 14, 10, 28)

  # Generate random scaling factors between 1 and 15
  nber_individuals <- sample(1:15, 1)

  random_vector <- sapply(max_values*nber_individuals, function(max_val) sample(0:max_val, 1))
  return(random_vector)
}

# Function to generate a dataset of size n
generate_newdata <- function(n) {
  feature_names <- c(
    "Skull", "Mandible", "Hyoid", "Cervical", "Thoracic", "Lumbar",
    "Sternum", "Ribs", "Clavicle", "Scapula", "Humerus", "Radius",
    "Ulna", "Hand Carpal", "Hand Metacarpal", "Hand Phalanx", "Sacrum",
    "Coccyx", "Os Coxae", "Femur", "Tibia", "Fibula", "Patella",
    "Foot Tarsal", "Foot Metatarsal", "Foot Phalanx"
  )

  # Generate n rows of random data
  data_list <- replicate(n, generate_random_vector(), simplify = FALSE)

  # Combine into a matrix and set column names
  data_matrix <- do.call(rbind, data_list)
  colnames(data_matrix) <- feature_names

  # Convert to a tibble
  dataset <- as_tibble(data_matrix)

  return(dataset)
}
