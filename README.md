# tafyR: A Toolkit for Taphonomic Analysis in R

## Overview

**tafyR** is an R package designed for taphonomic data analysis, providing tools to load, process, and visualize taphonomic datasets. Additionally, **tafyR** includes an interactive Shiny application that allows users to perform analyses and visualize results without writing any code.

Access the interactive Shiny app here: [tafyr_app on shinyapps.io](https://zojobx-jonas-grabbe.shinyapps.io/tafyr_app/)

![tafyR Shiny App Screenshot](https://github.com/JonasGrabbe/tafyR/blob/main/shiny_app_screenshot.png)

### Features

- **Load Taphonomic Datasets:** Import your taphonomic data from Excel files.
- **Process and Analyze Data:** Utilize functions to compute key taphonomic metrics.
- **Visualize Results:** Generate interactive plots to compare datasets using Plotly.
- **Interactive GUI:** Use the Shiny app for a user-friendly interface without the need for coding.


### 1. Installation

Install the package directly from GitHub:

```R
# Install devtools if not already installed
install.packages("devtools")

# Install tafyR from GitHub
devtools::install_github("JonasGrabbe/tafyR")
```

### 2. Loading the Package

After installation, load the package using:

```R
library(tafyR)
```

### 3. Loading Example Data

**tafyR** comes with built-in datasets the hominin part abundance hpa-dataset. To load the sample dataset `hpa`, use:

```R
data("hpa") #HomininPartAbundance-dataset
```

This dataset contains example taphonomic data for analysis.

### 4. Loading Your Own Data

To analyze your own dataset, you can load an Excel file into R using the `load.thaph.data` function. Replace `"path/to/yourfile.xlsx"` with the actual path to your Excel file:

```R
NewSite <- load.tapho.data("path/to/yourfile.xlsx")
```

### 5. Plotting Derived Values

You can compare the **MNE**, **MNAU**, **%MNAU** & **AcReMNAU**-values between your dataset (`NewSite`) and the example dataset (`HomininPartAbundance`). Use the `plot.abundance.function`:

```R
plot.abundance.function(NewSite,hpa)
```

This will generate a plot visualizing the derived values for the datasets.

### Example Workflow

Here’s the complete workflow:

```R
# Install the package
install.packages("devtools")
devtools::install_github("JonasGrabbe/tafyR")

# Load the library
library(TaphonomyR)

# Load example data
data("hpa")

# Load your own dataset
NewSite <- load.tapho.data("path/to/yourfile.xlsx")

# Plot the derived values
plot.abundance.function(NewSite,hpa)
```

## Interactive Shiny Application
For an interactive experience, use the tafyR Shiny app hosted on shinyapps.io. The app allows you to upload your data and visualize the results through a user-friendly GUI.

Access the Shiny app here:  [tafyr_app on shinyapps.io](https://zojobx-jonas-grabbe.shinyapps.io/tafyr_app/)

### Using the Shiny App

1. **Upload Your Excel File:**
   - Click on the "Upload Excel File" button.
   - Select your `.xlsx` or `.xls` file containing your taphonomic data.
2. **View Data:**
   - Once uploaded, the data table will appear in the sidebar for verification.
3. **Visualize Abundance Function:**
   - The main panel will display an interactive Plotly plot comparing your dataset with the example `hpa` dataset.
