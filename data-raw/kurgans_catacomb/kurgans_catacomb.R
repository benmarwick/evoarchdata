library("tidyverse")

# Slightly modified version of data from Ślusarska 2006
kurgans_catacomb <- read_csv("data-raw/kurgans_catacomb/slusarska_2006_kurgans.csv",
                    col_types = cols(
                      ID = col_integer(),
                      GROUP = col_character(),
                      SITE = col_character(),
                      RAION = col_character(),
                      OBLAST = col_character(),
                      MOUND = col_character(),
                      GRAVE = col_character(),
                      NAME = col_character(),
                      INTERMENT = col_character(),
                      SEX = col_character(),
                      AGE = col_character(),
                      GRAVE_TYPE = col_integer(),
                      SHAFT = col_integer(),
                      GANGWAY = col_integer(),
                      STEPS = col_integer(),
                      DROMOS = col_integer(),
                      ENTRANCE_SCREEN = col_integer(),
                      BOARDS = col_integer(),
                      ORGANIC_LINING = col_integer(),
                      BODY_POSITION = col_integer(),
                      LEG_POSITION = col_integer(),
                      OCHRE = col_integer(),
                      CHARCOAL = col_integer(),
                      CHALK = col_integer(),
                      FIRE = col_integer(),
                      MASK = col_integer(),
                      TAR = col_integer(),
                      ANIMAL_BONES = col_integer(),
                      AXE_HAMMER = col_integer(),
                      MACEHEAD = col_integer(),
                      ARROWHEAD = col_integer(),
                      SPEARHEAD = col_integer(),
                      BOW = col_integer(),
                      BRONZE_KNIFE = col_integer(),
                      BOLA = col_integer(),
                      WOODEN_JAVELIN = col_integer(),
                      POLISHING_PLATE = col_integer(),
                      ARROW_STRAIGHTENER = col_integer(),
                      AWL = col_integer(),
                      GRINDSTONE = col_integer(),
                      SCRAPER = col_integer(),
                      PUNCH = col_integer(),
                      HAMMERSTONE = col_integer(),
                      PERFORATOR = col_integer(),
                      CASTING_MOULD = col_integer(),
                      TUYERE = col_integer(),
                      DIGGING_TOOL = col_integer(),
                      ADZE = col_integer(),
                      MELTING_POT = col_integer(),
                      FLINT_KNIFE = col_integer(),
                      WOODEN_CUP = col_integer(),
                      WOODEN_BOWL = col_integer(),
                      POTTERY = col_integer(),
                      BODY_ORNAMENT = col_integer()
                    ))

# Normalise column names for R
kurgans_catacomb <- rename_all(kurgans_catacomb, tolower)

# Expand coded values
kurgans_catacomb %<>%
  mutate_at(vars(gangway, steps, dromos, boards, ochre, charcoal, chalk, mask,
                 tar, animal_bones, axe_hammer, macehead, arrowhead, spearhead,
                 bow, bronze_knife, bola, wooden_javelin, polishing_plate,
                 arrow_straightener, awl, grindstone, scraper, punch,
                 hammerstone, perforator, casting_mould, tuyere, digging_tool,
                 adze, melting_pot, flint_knife, wooden_cup, wooden_bowl,
                 pottery, body_ornament),
            ~recode(., `0` = "absent", `1` = "present")) %>%
  mutate(grave_type = recode(grave_type,
                             `1` = "pit",
                             `2` = "pit with niche",
                             `3` = "catacomb"),
         shaft = recode(shaft,
                        `0` = "absent",
                        `1` = "circular",
                        `2` = "h elliptical",
                        `3` = "t elliptical",
                        `4` = "h rectangular",
                        `5` = "t rectangular"),
         entrance_screen = recode(entrance_screen,
                                  `0` = "absent",
                                  `1` = "present",
                                  `2` = "stelae",
                                  `3` = "wheel"),
         organic_lining = recode(organic_lining,
                                 `0` = "absent",
                                 `1` = "present",
                                 `2` = "feet only"),
         body_position = recode(body_position,
                                `0` = "supine",
                                `1` = "left side",
                                `2` = "right side",
                                `3` = "prone"),
         leg_position = recode(leg_position,
                               `0` = "extended",
                               `1` = "bent"),
         fire = recode(fire,
                       `0` = "absent",
                       `1` = "present",
                       `2` = "censer"))

# Add approximate site coordinates
read_csv("data-raw/kurgans_catacomb/kurgan_coordinates.csv",
                               col_types = cols(
                                 site = col_character(),
                                 group = col_character(),
                                 latitude = col_double(),
                                 longitude = col_double()
                               )) %>%
  select(-group) %>%
  right_join(kurgans_catacomb, by = "site") %>%
  relocate(raion, oblast, latitude, longitude, .after = name) %>%
  relocate(site, .after = group) ->
  kurgans_catacomb

# Export
write_csv(kurgans_catacomb, "data-raw/kurgans_catacomb/kurgans_catacomb.csv")
usethis::use_data(kurgans_catacomb, overwrite = TRUE)
