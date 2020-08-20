library("tidyverse")

# Read data (transcribed from the original Data_S1.pdf)
textiles_ikat_seasia <- read_csv("data-raw/textiles_ikat_seasia/Data_S1.csv",
                                 col_types = cols(
                                   tradition = col_character(),
                                   .default = col_logical()
                                 ),
                                 na = "?")

# Export
write_csv(textiles_ikat_seasia, "data-raw/textiles_ikat_seasia/textiles_ikat_seasia.csv")
usethis::use_data(textiles_ikat_seasia, overwrite = TRUE)
