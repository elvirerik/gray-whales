## 02_clean_data.R ##
# Input:  data/raw/whales_raw.csv
# Output: data/clean/whales_clean.csv

library(tidyverse)
library(janitor)
library(here)

# Load the function from script 00_functions.R
source(here("scripts", "00_functions.R"))

# Read the raw data
whales_raw <- read_csv(here("data", "raw", "whales_raw.csv"))

# Lets get cleaning :) 
whales_clean <- whales_raw |>
  clean_names() |>
  mutate(sex = replace_na(sex, "Unknown")) |>

  drop_na(tl_pix, altitude_barometer) |>
  mutate(length_m = pixels_to_metres(
    length_pixels   = tl_pix,
    altitude_m      = altitude_barometer,
    sensor_width_mm = sensor_width,
    image_width_px  = image_width,
    focal_length_mm = focal_length
  ))

# Double check quickly
summary(whales_clean$length_m)

# Save the clean data
dir.create(here("data", "clean"), recursive = TRUE, showWarnings = FALSE)
write_csv(whales_clean, here("data", "clean", "whales_clean.csv"))
