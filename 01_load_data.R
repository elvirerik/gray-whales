## 01_load_data.R ##
# Data: 'whales' from the Xcertainty package (Bierlich et al. 2024),
#       drone measurements of gray whales. https://doi.org/10.1111/gcb.17366

library(Xcertainty)
library(tidyverse)
library(here) # to build the file path from the project folder (should work on every laptop)

# Load the dataset that comes with the package
data(whales, package = "Xcertainty")

# Look at the data
glimpse(whales)

# Save a copy as a csv file.
dir.create(here("data", "raw"), recursive = TRUE, showWarnings = FALSE)
write_csv(whales, here("data", "raw", "whales_raw.csv"))
