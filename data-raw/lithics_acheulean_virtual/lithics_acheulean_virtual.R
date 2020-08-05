library("tidyverse")

# Data from Kempe et al. 2012 <https://doi.org/10.1371/journal.pone.0048333>
lithics_acheulean_virtual <- read_csv("data-raw/lithics_acheulean_virtual/journal.pone.0048333.s002.CSV",
                                           col_types = cols(
                                             chain = col_integer(),
                                             place = col_integer(),
                                             scale = col_double(),
                                             condition = col_character()
                                           ))

write_csv(lithics_acheulean_virtual, "data-raw/lithics_acheulean_virtual/lithics_acheulean_virtual.csv")
usethis::use_data(lithics_acheulean_virtual, overwrite = TRUE)
