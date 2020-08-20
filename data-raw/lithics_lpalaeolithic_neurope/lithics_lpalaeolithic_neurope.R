library("tidyverse")

# Read data
lithics_lpalaeolithic_neurope <- readxl::read_xls(
  "data-raw/lithics_lpalaeolithic_neurope/Riede_SI.xls",
  sheet = "Riede_LT",
  range = "B1:G633",
  col_types = c(rep("numeric", 5), "text"),
  na = "."
)

# Normalise column names for R
colnames(lithics_lpalaeolithic_neurope) <- c("n", "length", "length_total",
                                             "width", "thickness", "type")

# Export
write_csv(lithics_lpalaeolithic_neurope,
          "data-raw/lithics_lpalaeolithic_neurope/lithics_lpalaeolithic_neurope.csv")
usethis::use_data(lithics_lpalaeolithic_neurope, overwrite = TRUE)
