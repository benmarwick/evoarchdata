ceramics_lbk_merzbach <- readr::read_csv("observedFrequencies.csv")
names(ceramics_lbk_merzbach)[1] <- "Phase"
usethis::use_data(ceramics_lbk_merzbach)



