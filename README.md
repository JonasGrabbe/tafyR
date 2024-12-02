# tafyR: A Toolkit for Taphonomic Analysis in R

## Overview

**tafyR** is an R package designed for taphonomic data analysis, providing tools to load, process, and visualize taphonomic datasets.

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

### 5. Plotting MNE Values

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
devtools::install_github("YourUsername/tafyR")

# Load the library
library(TaphonomyR)

# Load example data
data("hpa")

# Load your own dataset
NewSite <- load.tapho.data("path/to/yourfile.xlsx")

# Plot the derived values
plot.abundance.function(NewSite,hpa)
```
