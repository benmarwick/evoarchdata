armature_types_france <- readr::read_csv("yjasc_4134_data.csv")
names(armature_types_france)[1] <- 'Period'
usethis::use_data(armature_types_france, overwrite = TRUE)
