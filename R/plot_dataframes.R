

# Function to plot dataframes with switchable buttons
plot_dataframes <- function(results) {

  library(plotly)
  # Initialize plot
  fig <- plot_ly()

  # Get elements (assuming same for all rows)
  elements <- colnames(results[[1]])

  # Ensure elements are factors with levels in the desired order
  elements_factor <- factor(elements, levels = elements)

  # Metrics to plot
  metrics <- names(results)

  # Total number of traces
  num_metrics <- length(metrics)
  num_rows <- nrow(results[[1]])
  total_traces <- num_metrics * num_rows

  # Initialize visibility matrix
  visibility_matrix <- matrix(FALSE, nrow = num_metrics, ncol = total_traces)

  # Initialize trace counter
  trace_counter <- 1

  for (metric_index in seq_along(metrics)) {
    metric <- metrics[metric_index]

    for (row_index in 1:num_rows) {
      # Access the current metric dataframe and row
      y_values <- as.numeric(results[[metric]][row_index, ])
      x_values <- elements

      # Ensure x_values have the same order as 'elements'
      x_values_factor <- factor(x_values, levels = elements)

      # Add trace with mode = 'lines+markers'
      fig <- fig %>%
        add_trace(
          x = x_values_factor,
          y = y_values,
          mode = 'lines+markers',
          type = 'scatter',
          name = paste(metric, "Row", row_index),
          visible = ifelse(metric == "MNE", TRUE, FALSE)
        )

      # Update visibility matrix
      visibility_matrix[metric_index, trace_counter] <- TRUE

      trace_counter <- trace_counter + 1
    }
  }

  # Create buttons for each metric
  buttons_list <- list()
  for (metric_index in seq_along(metrics)) {
    metric <- metrics[metric_index]

    # Create visibility vector
    visibility <- as.vector(visibility_matrix[metric_index, ])

    button <- list(
      method = "update",
      args = list(list(visible = visibility)),
      label = metric
    )

    buttons_list[[metric_index]] <- button
  }

  # Place buttons at the bottom
  updatemenus <- list(
    list(
      type = "buttons",
      direction = "left",
      xanchor = 'center',
      yanchor = 'bottom',
      x = 0.5,
      y = -0.2,
      showactive = TRUE,
      buttons = buttons_list
    )
  )

  # Final layout
  fig <- fig %>%
    layout(
      title = "Metrics Comparison",
      xaxis = list(
        title = "Element",
        type = 'category',
        categoryorder = "array",
        categoryarray = elements
      ),
      yaxis = list(title = "Value"),
      updatemenus = updatemenus
    )

  # Display the plot
  return(fig)
}
plot_dataframes(results)
