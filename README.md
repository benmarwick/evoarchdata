
<!-- README.md is generated from README.Rmd. Please edit that file -->
evoarchdata
===========

The goal of evoarchdata is to make easily available some important artefact datasets from archaeological studies of cultural evolution. The motivation for this package is to make it easier to teach and study cultural evolution in the archaeological record.

Installation
------------

You can install the development version of evoarchdata from GitHub with:

``` r
if (!require(devtools)) install.packages("devtools")
install_github("benmarwick/evoarchdata")
```

Datasets
--------

Here's a summary of the datasets currently in this package:

``` r
tbl_of_data <- vcdExtra::datasets("evoarchdata")
#> Loading package: evoarchdata
knitr::kable(tbl_of_data)
```

| Item                         | class      | dim    | Title                                                                                                                    |
|:-----------------------------|:-----------|:-------|:-------------------------------------------------------------------------------------------------------------------------|
| armature\_types\_france      | data.frame | 9x20   | Counts of arrowheads from two sites in Neotlithic France (Crema et al. 2014)                                             |
| ceramics\_hittite\_turkey    | data.frame | 18x7   | Counts of ceramic bowl types from Bogazköy-Hattusa, a Hittite site in Turkey (Steele et al. 2010)                        |
| ceramics\_lbk\_merzbach      | data.frame | 8x37   | Frequencies of different decorative motifs in the Merzbach assemblage, Neolithic Germany (Crema et al. 2016)             |
| ceramics\_woodland\_illinois | data.frame | 160x15 | Stylistic element frequencies for lip exterior decoration for five regions in Illinois, by thickness class (Braun 1977). |

Here's a preview of each dataset:

``` r
# get an object referring to the datasets
d <- data(package = "evoarchdata")

# get names of the datasets
nm <- d$results[, "Item"]

## call the promised data into the environment
data(list = nm, package = "evoarchdata")

## print the first few rows of each dataset
lapply(mget(nm), head)
#> $armature_types_france
#>          Period LE01 TR03 TA01 KNTR01 TR01 OB01 TALE01 TASQ01 TABA01
#> 1 3700-3600(p1)    0    0    0      0    0    0      0      0      0
#> 2      3450(p2)    0    1    0      0    0    0      0      0      0
#> 3      3200(p3)    2    5    0      0    3    1      1      0      0
#> 4      3100(p4)    0    3    1      0    5    1      3      0      0
#> 5 3050-3010(p5)    1    4    2      2   26    2     11      0      0
#> 6 3010-2930(p6)    2    7    3      4   27    1      1      0      0
#>   TATR01 TATP03 TR02 LESQ01 TALESQ01 TP01 TA03 TALETRSQ01 BA01 LETP01
#> 1      0      0    0      0        0    1    0          0    0      1
#> 2      0      0    2      0        0    0    0          0    0      0
#> 3      0      0    0      0        0    6    0          0    3      0
#> 4      0      0    0      0        0    6    0          0    2      0
#> 5      0      0    0      0        0    0    4          1    3      0
#> 6      0      0    2      1        5    1    0          0    0      0
#> 
#> $ceramics_hittite_turkey
#>    Phase                            Main bowl group Ware A (plain coarse)
#> 1 O.St.3   Type I1 (bowls with simple rounded rims)                    80
#> 2 O.St.3 Type I2 (bowls with simple thickened rims)                    22
#> 3 O.St.3         Type I3 (bowls with inverted rims)                   171
#> 4 O.St.3          Type I4 (bowls with everted rims)                    22
#> 5 O.St.3          Type I5 (bowls with everted rims)                    40
#> 6 O.St.3          Type I6 (bowls with everted rims)                     7
#>   Ware C (red slip) Ware D (white slip) Ware E (plain finer) Total
#> 1               111                  28                  141   360
#> 2                12                   8                   36    78
#> 3               276                  53                  214   714
#> 4                19                   5                   19    65
#> 5                16                   5                   37    98
#> 6                 2                   1                    6    16
#> 
#> $ceramics_lbk_merzbach
#>   Phase BT14 BT25 BT60 BT21 BT36 BT44 BT20 BT22 BT19 BT27 BT29 BT24 BT26
#> 1   VII    0    0    0    0    0    0    1    0    2    0    1    9    0
#> 2  VIII    0    0    0    0    0    0    0    0    5    0    1    8    0
#> 3    IX    0    0    0    0    0    0    1    0    7    0    0   10    4
#> 4     X    0    0    0    2    0    0    7   11   13    4    1   19    8
#> 5    XI    7    1    0    4    2    1   39    3   49   12    0   46    7
#> 6   XII   19    5    0    8    3    2   71   12  134   14    1   82   28
#>   BT6 BT3 BT17 BT13 BT16 BT5 BT2 BT11 BT99 BT49 BT12 BT4 BT15 BT9 BT39
#> 1   0   7    0   28    2  10  73   16    0    0   14  15    5  23    1
#> 2   0   8    0   35    1  13  59    8    0    0   16   7    2   8    0
#> 3   1  21    0   79    3   9  47   20    0    0   18   7    6   2    0
#> 4   2  41    1   99    5  14  60   23    0    0   12   1    3   4    1
#> 5   5 104    3  204    8  37 128   32    0    0   14   3    2  11    0
#> 6   1 156    3  284   12  36 135   22    0    0   11   3    0   5    0
#>   BT10 BT8 BT1 BT30 BT18 BT47 BT38 BT23
#> 1  108 337 510    3    6    3    4    5
#> 2   43 120 157    0    2    0    0    0
#> 3   34  72  68    0    1    0    0    0
#> 4   35  43  59    1    0    0    0    0
#> 5   25  49  66    0    0    0    0    0
#> 6    3  23  45    0    0    0    0    0
#> 
#> $ceramics_woodland_illinois
#>   Group Motif Total mm02_3 mm04 mm05 mm06 mm07 mm08 mm09 mm10 mm11 mm12
#> 1   CIV     1    32      0    2    3    7    8    5    4    3    0    0
#> 2   CIV     2     3     NA   NA    1   NA    1   NA   NA   NA    1   NA
#> 3   CIV     3     1     NA   NA   NA   NA   NA    1   NA   NA   NA   NA
#> 4   CIV     4     0     NA   NA   NA   NA   NA   NA   NA   NA   NA   NA
#> 5   CIV     5     0     NA   NA   NA   NA   NA   NA   NA   NA   NA   NA
#> 6   CIV     6    39     NA   NA    1    5    6    8    8    6    3    1
#>   mm13 mm14
#> 1    0    0
#> 2   NA   NA
#> 3   NA   NA
#> 4   NA   NA
#> 5   NA   NA
#> 6   NA    1
```

Use
===

If you use any of these datasets, you much cite the original publication, listed below.

The datasets are made available here for fair use in teaching and research. All datasets are copyright of the original author or publisher, except `ceramics_lbk_merzbach` which is distributed by Crema et al (2016) under the terms of the [Creative Commons CC BY license](https://creativecommons.org/licenses/), which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.

References
==========

Braun, D. 1977. *Middle Woodland-Early Late Woodland Social Change in the Prehistoric Central Midwestern U.S.* Ph.D. dissertation, University of Michigan, University Microfilms, Ann Arbor.

Braun, D. 1985. Ceramic decorative diversity and Illinois Woodland regional integration. In *Decoding Prehistoric Ceramics*, edited by Ben A. Nelson, pp.128-153. Southern Illinois University Press Carbondale.

Crema, E.R., Edinborough, K., Kerig, T., Shennan, S.J., 2014. An Approximate Bayesian Computation approach for inferring patterns of cultural evolutionary change. *Journal of Archaeological Science* 50, 160–170. <https://doi.org/10.1016/j.jas.2014.07.014>

Crema, E.R, Kandler, A., Shennan, S.J. 2016. "Revealing patterns of cultural transmission from frequency data: equilibrium and non-equilibrium assumptions." *Scientific Reports* 6, 39122; <https://doi.org/10.1038/srep39122>

Neiman, F.D., 1995. Stylistic Variation in Evolutionary Perspective: Inferences from Decorative Diversity and Interassemblage Distance in Illinois Woodland Ceramic Assemblages. *American Antiqity* 60, 7–36. <https://doi.org/10.2307/282074>

Steele, J., Glatz, C., Kandler, A., 2010. Ceramic diversity, random copying, and tests for selectivity in ceramic production. *Journal of Archaeological Science* 37, 1348–1358. <https://doi.org/10.1016/j.jas.2009.12.039>

Contributing
============

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
