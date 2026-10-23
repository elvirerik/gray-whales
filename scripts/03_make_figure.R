## 03_make_figure.R ##
# Input:  data/clean/whales_clean.csv
# Output: output/figure_length_vs_age.png

library(tidyverse)
library(here)

whales_clean <- read_csv(here("data", "clean", "whales_clean.csv"))

# Calculate one value per whale per year.

# Taking the mean per whale and year gives each whale the same weight.
whales_summary <- whales_clean |>
  group_by(whale_id, sex, age, year) |>
  summarise(mean_length_m = mean(length_m), .groups = "drop")

# Make the figure
fig_length_age <- ggplot(whales_summary,
                         aes(x = age, y = mean_length_m, colour = sex)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(x = "Age (years)",
       y = "Mean body length (m)",
       colour = "Sex",
       title = "Gray whale body length against age") +
  theme_minimal()

plot(fig_length_age)

# Save the figure as a file
dir.create(here("output"), showWarnings = FALSE)
ggsave(here("output", "figure_length_vs_age.png"),
       fig_length_age, width = 7, height = 5, dpi = 300)
