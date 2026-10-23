# Gray whale body length

This exercise cleans drone measurements of gray whales and shows how body length changes with age.

## Data
`whales` dataset from the R package
[Xcertainty](https://cran.r-project.org/package=Xcertainty)
(Bierlich et al. 2024, https://doi.org/10.1111/gcb.17366).

## How to reproduce
1. Clone this repository and open `Final_exercise_OS_course_whales.Rproj` in RStudio.
2. Install the exact package versions: `renv::restore()`
3. Run the scripts in `scripts/` in order: `01_`, `02_`, `03_`
   (`00_functions.R` is loaded automatically by script 02).
4. Open `report.qmd` and click Render.

## Files
- `scripts/00_functions.R`: function to convert pixels to metres
- `scripts/01_load_data.R`: load data, save raw copy
- `scripts/02_clean_data.R`: minimal cleaning
- `scripts/03_make_figure.R`: make the figure
- `renv.lock`: package versions
