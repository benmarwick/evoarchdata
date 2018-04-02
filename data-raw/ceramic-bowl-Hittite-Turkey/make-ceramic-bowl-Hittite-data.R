ceramics_hittite_turkey <- readr::read_csv("ceramic-bowl-Hittite-Turkey.csv")
ceramics_hittite_turkey$`Main bowl group` <- stringi::stri_enc_toutf8(ceramics_hittite_turkey$`Main bowl group`)
ceramics_hittite_turkey$`Main bowl group`  <-  stringr::str_sub(ceramics_hittite_turkey$`Main bowl group`, start = 2)
usethis::use_data(ceramics_hittite_turkey)

Boğazköy-Hattusa

