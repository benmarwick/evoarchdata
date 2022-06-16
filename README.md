
<!-- README.md is generated from README.Rmd. Please edit that file -->

evoarchdata
===========

The goal of evoarchdata is to make easily available some important
artefact datasets from archaeological studies of cultural evolution. The
motivation for this package is to make it easier to teach and study
cultural evolution in the archaeological record.

Installation
------------

You can install the development version of evoarchdata from GitHub with:

    if (!require(devtools)) install.packages("devtools")
    install_github("benmarwick/evoarchdata")

Datasets
--------

Here’s a summary of the datasets currently in this package:

    tbl_of_data <- vcdExtra::datasets("evoarchdata")
    #> Loading package: evoarchdata
    knitr::kable(tbl_of_data)

| Item                            | class      | dim    | Title                                                                                    |
|:--------------------------------|:-----------|:-------|:-----------------------------------------------------------------------------------------|
| armature\_types\_france         | data.frame | 9x20   | Arrowheads from Neolithic France (Crema et al. 2014; Saintot 1998)                       |
| ceramics\_hittite\_turkey       | data.frame | 18x7   | Ceramic bowls from Boğazköy-Hattusa (Steele et al. 2010; Brantingham and Perreault 2010) |
| ceramics\_lbk\_merzbach         | data.frame | 8x37   | Decorative motifs in the Merzbach assemblage, Neolithic Germany (Crema et al. 2016)      |
| ceramics\_woodland\_illinois    | data.frame | 160x15 | Illinois Woodland Ceramics (Braun 1977, 1985; Neiman 1995)                               |
| kurgans\_catacomb               | data.frame | 703x56 | Kurgans of the Catacomb culture (Ślusarska 2006)                                         |
| lithics\_acheulean\_virtual     | data.frame | 200x4  | Copying error in virtual Acheulean handaxes (Kempe et al. 2012)                          |
| lithics\_lpalaeolithic\_neurope | data.frame | 632x6  | Late Palaeolithic Projectile Points from Northern Europe (Riede 2009)                    |
| textiles\_ikat\_seasia          | data.frame | 36x111 | Southeast Asian Warp Ikat Weaving (Buckley 2012)                                         |

Use
===

To use a dataset in your R session, you can load it like this:

    library(evoarchdata)
    data(ceramics_lbk_merzbach)

    # and then take a look at the data
    ceramics_lbk_merzbach
    #>   Phase BT14 BT25 BT60 BT21 BT36 BT44 BT20 BT22 BT19 BT27 BT29 BT24 BT26 BT6
    #> 1   VII    0    0    0    0    0    0    1    0    2    0    1    9    0   0
    #> 2  VIII    0    0    0    0    0    0    0    0    5    0    1    8    0   0
    #> 3    IX    0    0    0    0    0    0    1    0    7    0    0   10    4   1
    #> 4     X    0    0    0    2    0    0    7   11   13    4    1   19    8   2
    #> 5    XI    7    1    0    4    2    1   39    3   49   12    0   46    7   5
    #> 6   XII   19    5    0    8    3    2   71   12  134   14    1   82   28   1
    #> 7  XIII   17    4    1    3    1    1   74    9  139   15    2   92   19   0
    #> 8   XIV   41    9    1    9    3    3   48    4   84   11    3   45    8   1
    #>   BT3 BT17 BT13 BT16 BT5 BT2 BT11 BT99 BT49 BT12 BT4 BT15 BT9 BT39 BT10 BT8 BT1
    #> 1   7    0   28    2  10  73   16    0    0   14  15    5  23    1  108 337 510
    #> 2   8    0   35    1  13  59    8    0    0   16   7    2   8    0   43 120 157
    #> 3  21    0   79    3   9  47   20    0    0   18   7    6   2    0   34  72  68
    #> 4  41    1   99    5  14  60   23    0    0   12   1    3   4    1   35  43  59
    #> 5 104    3  204    8  37 128   32    0    0   14   3    2  11    0   25  49  66
    #> 6 156    3  284   12  36 135   22    0    0   11   3    0   5    0    3  23  45
    #> 7 137    1  205    7  19  54    6    0    0    2   4    0   1    0    2   8  14
    #> 8  67    0   60    2   8  11    1    0    0    2   3    1   0    0    1   3   3
    #>   BT30 BT18 BT47 BT38 BT23
    #> 1    3    6    3    4    5
    #> 2    0    2    0    0    0
    #> 3    0    1    0    0    0
    #> 4    1    0    0    0    0
    #> 5    0    0    0    0    0
    #> 6    0    0    0    0    0
    #> 7    0    0    0    0    0
    #> 8    0    0    0    0    0

If you use any of these datasets, you must cite the original
publication, listed below.

The datasets are made available here for fair use in teaching and
research. All datasets are copyright of the original author or
publisher, except `ceramics_lbk_merzbach` which is distributed by Crema
et al (2016) under the terms of the [Creative Commons CC BY
license](https://creativecommons.org/licenses/), which permits
unrestricted use, distribution, and reproduction in any medium, provided
the original work is properly cited.

Contributing
============

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

Bibliography
============

<div id="refs" class="references hanging-indent">

<div id="ref-Brantingham2010-yd">

Brantingham, P Jeffrey, and Charles Perreault. 2010. “Detecting the
Effects of Selection and Stochastic Forces in Archaeological
Assemblages.” *Journal of Archaeological Science* 37 (12): 3211–25.
<https://doi.org/10.1016/j.jas.2010.07.021>.

</div>

<div id="ref-Braun1977-hy">

Braun, David P. 1977. “Middle Woodland—(Early) Late Woodland Social
Change in the Prehistoric Central Midwestern US.” PhD thesis, University
of Michigan.

</div>

<div id="ref-Braun1985-wv">

———. 1985. “Ceramic Decorative Diversity and Illinois Woodland Regional
Integration.” In *Decoding Prehistoric Ceramics*, edited by Ben A
Nelson, 128–53. Carbondale, IL: Southern Illinois University Press.

</div>

<div id="ref-Buckley2012-ye">

Buckley, Christopher D. 2012. “Investigating Cultural Evolution Using
Phylogenetic Analysis: The Origins and Descent of the Southeast Asian
Tradition of Warp Ikat Weaving.” *PLoS ONE* 7 (12): e52064.
<https://doi.org/10.1371/journal.pone.0052064>.

</div>

<div id="ref-Crema2016-cv">

Crema, Enrico R, Anne Kandler, and Stephen Shennan. 2016. “Revealing
Patterns of Cultural Transmission from Frequency Data: Equilibrium and
Non-Equilibrium Assumptions.” *Scientific Reports* 6 (December): 39122.
<https://doi.org/10.1038/srep39122>.

</div>

<div id="ref-Crema2014-jj">

Crema, E R, K Edinborough, T Kerig, and S J Shennan. 2014. “An
Approximate Bayesian Computation Approach for Inferring Patterns of
Cultural Evolutionary Change.” *Journal of Archaeological Science* 50
(October): 160–70. <https://doi.org/10.1016/j.jas.2014.07.014>.

</div>

<div id="ref-Kempe2012-ns">

Kempe, Marius, Stephen Lycett, and Alex Mesoudi. 2012. “An Experimental
Test of the Accumulated Copying Error Model of Cultural Mutation for
Acheulean Handaxe Size.” Edited by Carles Lalueza-Fox. *PloS ONE* 7
(11): e48333. <https://doi.org/10.1371/journal.pone.0048333>.

</div>

<div id="ref-Neiman1995-ar">

Neiman, Fraser D. 1995. “Stylistic Variation in Evolutionary
Perspective: Inferences from Decorative Diversity and Interassemblage
Distance in Illinois Woodland Ceramic Assemblages.” *American Antiquity*
60 (1): 7–36. <https://doi.org/10.2307/282074>.

</div>

<div id="ref-Riede2009-he">

Riede, Felix. 2009. “The Loss and Re-Introduction of Bow-and-Arrow
Technology: A Case Study from the Northern European Late Paleolithic.”
*Lithic Technology* 34 (1): 27–45.
<https://doi.org/10.1080/01977261.2009.11721072>.

</div>

<div id="ref-Roe2013-ls">

Roe, Joe. 2013. “Cultural Phylogeny of Kurgan Burial Mounds in the West
Eurasian Steppe.” Master’s thesis, University College London.

</div>

<div id="ref-Saintot1998-de">

Saintot, Sylvie. 1998. “III. Les Armatures de Flèches En Silex de
Chalain et de Clairvaux.” *Gallia Préhistoire* 40 (1): 204–41.

</div>

<div id="ref-Slusarska2006-zc">

Ślusarska, Katarzyna. 2006. *Funeral Rites of the Catacomb Community:
2800–1900 BC: Ritual, Thanatology and Geographical Origins*. Adam
Mickiewicz University. Institute of Eastern Studies. Institute of
Prehistory.

</div>

<div id="ref-Steele2010-bq">

Steele, James, Claudia Glatz, and Anne Kandler. 2010. “Ceramic
Diversity, Random Copying, and Tests for Selectivity in Ceramic
Production.” *Journal of Archaeological Science* 37 (6): 1348–58.
<https://doi.org/10.1016/j.jas.2009.12.039>.

</div>

</div>
