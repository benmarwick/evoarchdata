#' @importFrom Rdpack reprompt
NULL

#-------------------------------------------------------------------------
#' Counts of arrowheads from two sites in Neotlithic France (Crema et al. 2014; Saintot 1998)
#'
#' Counts of armature types from the Clairvaux and Chalain sites (Pétrequin, 1986, 1989,1997; Pétrequin and Bailly, 2004) in the Jura region of southeast France. The dataset comprises a total of 280 arrowheads subdivided into nine chronologically distinct phases (I: 3700–3600 B C; II: 3450 BC; III: 3200 IV: 3100 BC; V: 3050–3010 BC; VI: 3010–2930 BC; VII: 2850–2750 BC; VIII: 2750–2600 BC; IX: 2600–1650 BC) defined by Saintot (1998).
#'
#' References:
#'
#' Crema, E.R., Edinborough, K., Kerig, T., Shennan, S.J., 2014. An Approximate Bayesian Computation approach for inferring patterns of cultural evolutionary change. Journal of Archaeological Science 50, 160–170. https://doi.org/10.1016/j.jas.2014.07.014
#'
#' Saintot, S. 1998 Les Armatures de Flèches en Silex de Chalain et de Clairvaux In Gallia préhistoire. Tome 40 (1998), pp. 204-241
#'
#' @format A data frame with 9 rows and 20 variables:
#' \describe{
#'   \item{Period}{chronologically distinct phases}
#'   \item{...}{the various armature types. See the PDF in data-raw/ for the paradigmatic classification scheme for the armatures data}
#'   ...
#' }
#' @source <https://doi.org/10.1016/j.jas.2014.07.014>
"armature_types_france"

#-------------------------------------------------------------------------
#' Counts of ceramic bowl types from Boğazköy-Hattusa, a Hittite site in Turkey (Steele et al. 2010; Brantingham and Perreault 2010)
#'
#'Frequencies of rim sherds of the main bowl groups in each of the four wares, by phase, from  Boğazköy-Hattusa, a Hittite site in Turke
#'
#' Data from Table 1 of
#'
#' Steele, J., Glatz, C., Kandler, A., 2010. Ceramic diversity, random copying, and tests for selectivity in ceramic production. Journal of Archaeological Science 37, 1348–1358. https://doi.org/10.1016/j.jas.2009.12.039
#'
#' Also Table 2 of
#'
#' Brantingham, P. J., & Perreault, C. (2010). Detecting the effects of selection and stochastic forces in archaeological assemblages. Journal of Archaeological Science, 37(12), 3211-3225.
#'
#' @format A data frame with 18 rows and 7 variables:
#' \describe{
#'   \item{Phase}{chronological phases}
#'   \item{Main bowl group}{Main bowl type groups}
#'   \item{Ware A, etc.}{Ceramic fabric types}
#'   ...
#' }
#' @source <https://doi.org/10.1016/j.jas.2009.12.039>
"ceramics_hittite_turkey"

#-------------------------------------------------------------------------
#' Stylistic element frequencies for lip exterior decoration for five regions in Illinois, by thickness class (Braun 1977; 1985; Neiman 1995).
#'
#' Pottery data from the Middle Woodland-Early Late Woodland periods in  Central Midwestern U.S. (Illinois)
#'
#' References:
#'
#'Braun, David  1977 Middle Woodland-Early Late Woodland Social Change in the Prehistoric Central Midwestern U.S. Ph.D. dissertation, University of Michigan, University Microfilms, Ann Arbor.
#'
#' 1985 Ceramic decorative diversity and Illinois Woodland regional integration. In Decoding Prehistoric Ceramics, edited by Ben A. Nelson, pp.128-153. Southern Illinois University Press Carbondale.
#'
#' Neiman, F.D., 1995. Stylistic Variation in Evolutionary Perspective: Inferences from Decorative Diversity and Interassemblage Distance in Illinois Woodland Ceramic Assemblages. _American Antiqity_ 60, 7–36. https://doi.org/10.2307/282074
#'
#' @format A data frame with 106 rows and 15 variables:
#' \describe{
#'   \item{Group}{Group}
#'   \item{Motif}{Motif}
#'   \item{Total}{Total}
#'   \item{mm02_3, etc.}{Total}
#'   ...
#' }
#' @source <http://www.people.virginia.edu/~fn9r/anth588/WoodlandIllinoisData.html>
"ceramics_woodland_illinois"


#-------------------------------------------------------------------------
#' Frequencies of different decorative motifs in the Merzbach assemblage, Neolithic Germany (Crema et al. 2016; many other papers)
#'
#'
#'   Thirty-six types of pottery motifs, grouped into 8 phases on the basis of a seriation of the pottery assemblages based on motif frequencies.
#'
#'   These data have been used in numerous publications. I only mention Crema et al. (2016) here because they are the only ones that make the raw data available.
#'
#'   From Crema et al. (2016):
#'
#' "Over 5800 pottery vessels recovered from a small group of settlements of the first farmers in Central Europe in the valley of the Merzbach stream in western Germany. The settlements belong to the so-called Linearbandkeramik culture. The number of houses in occupation varied through time, but altogether the settlement and ceramic sequence covers nearly five centuries, from ca. 5300 to 4850 cal B.C. The sites were almost completely excavated prior to their destruction by lignite mining, so the archaeological record of what has survived is largely complete. The ceramic vessels take the form of deep bowls whose decoration is highly distinctive and stylised, comprising a variety of distinct but clearly related band-types that were defined by the original excavation team.
#'
#' References:
#'
#' Crema, E.R, Kandler, A., Shennan, S.J. "Revealing patterns of cultural transmission from frequency data: equilibrium and non-equilibrium assumptions." Sci. Rep. 6, 39122; doi: 10.1038/srep39122 (2016).
#'
#' @format A data frame with 8 rows and 37 variables:
#' \describe{
#'   \item{Phase}{Phase}
#'   \item{BT14, etc}{Counts of a motif}
#'   ...
#' }
#' @source <https://doi.org/10.1038/srep39122>
"ceramics_lbk_merzbach"

#-------------------------------------------------------------------------
#' Kurgans of the Catacomb culture \insertCite{Slusarska2006-zc}{evoarchdata}
#'
#' @description
#' Data on the construction, interment style, and grave goods of 703 mound
#'   burials (*kurgans*) of the Bronze Age Catacomb culture of the West Eurasian
#'   steppe. Each row represents one burial, from 207 mounds across 82 sites.
#'
#' @format A data frame with 703 rows and 56 variables:
#' \describe{
#'   \item{id}{Arbitrary unique identifier of the burial.}
#'   \item{group}{Regional grouping assigned by Ślusarska.}
#'   \item{site}{Name of the site.}
#'   \item{mound}{Identifier of the burial mound within the site.}
#'   \item{grave}{Identifier of the individual burial within the mound/site.}
#'   \item{name}{Unique name of the burial (`site` `mound` / `grave`).}
#'   \item{latitude, longitude, raion, oblast}{Geographical location of the site.}
#'   \item{interment}{Number of interments (single, twin, collective or cenotaph).}
#'   \item{sex}{Biological sex of the remains, if known.}
#'   \item{age}{Age of the remains, if known (juvenile or adult).}
#'   \item{grave_type, shaft, gangway, steps, dromos, entrance_screen, boards, organic_lining}{Details of the construction of the grave and mound, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
#'   \item{body_position, leg_position}{Details of the interment style, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
#'   \item{ochre, charcoal, chalk, fire, mask, tar, animal_bones}{Presence or absence of traces of funerary ritual, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
#'   \item{axe_hammer, macehead, arrowhead, spearhead, bow, bronze_knife, bola, wooden_javelin}{Presence or absence of different types of weapons in grave goods, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
#'   \item{polishing_plate,arrow_straightener, awl, grindstone, scraper, punch, hammerstone, perforator, casting_mould, tuyere, digging_tool, adze, melting_pot, flint_knife}{Presence or absence of different types of tools in grave goods, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
#'   \item{wooden_cup, wooden_bowl, pottery}{Presence or absence of different types of household goods in grave goods.}
#'   \item{body_ornament}{Presence or absence of bodily ornamentation in grave goods.}
#' }
#'
#' @details
#' Originally compiled by \insertCite{Slusarska2006-zc;textual}{evoarchdata}. Transcribed and recoded for
#'   phylogenetic analysis by \insertCite{Roe2013-ls;textual}{evoarchdata}.
#'
#' Coordinates were not included in the original dataset; those included are
#'   approximate, based on the nearest identifiable place name to each site.
#'
#' @references
#'
#' * \insertRef{Roe2013-ls}{evoarchdata}
#' * \insertRef{Slusarska2006-zc}{evoarchdata}
#'
#' @source \insertCite{Roe2013-ls;textual}{evoarchdata}
"kurgans_catacomb"

#-------------------------------------------------------------------------
#' Copying error in virtual Acheulean handaxes
#'
#' @description
#' Experimental data on unintential copying error in cultural transmission. In
#'   \insertCite{Kempe2012-ns;textual}{evoarchdata}'s experiment, participants
#'   were split into 20 transmission chains and asked to copy the size of a
#'   virtual Acheulean handaxe.
#'
#' @format A data frame with 200 rows and 4 variables:
#' \describe{
#'   \item{chain}{Number of the transmission chain.}
#'   \item{place}{Place of the handaxe in the chain.}
#'   \item{scale}{Size of the handaxe on an arbitrary scale.}
#'   \item{condition}{Whether the handaxe is larger or smaller than the previous handaxe in the chain.}
#' }
#'
#' @references
#'
#' * \insertRef{Kempe2012-ns}{evoarchdata}
#'
#' @source <https://doi.org/10.1371/journal.pone.0048333.s002>
"lithics_acheulean_virtual"

#-------------------------------------------------------------------------
#' Late Palaeolithic Projectile Points from Northern Europe \insertCite{Riede2009-he}{evoarchdata}
#'
#' @description
#' Data on the shape and size of lithic projectile points from the Late
#'   Palaeolithic of Northern Europe.
#'
#' @format A data frame with 632 rows and 6 variables:
#' \describe{
#'   \item{number}{Unique identifier of the specimen.}
#'   \item{length}{Measured length of the specimen in mm.}
#'   \item{length_total}{Estimated total length of the point in mm, if it is broken. If not broken, equal to `length`.}
#'   \item{width}{Width of the specimen in mm.}
#'   \item{thickness}{Thickness of the specimen in mm.}
#'   \item{type}{Typological classification according to literature or the museum creator.}
#' }
#'
#' @references
#'
#' * \insertRef{Riede2009-he}{evoarchdata}
#'
#' @source <http://www.cecd.ucl.ac.uk/ceacb_files/datasets/Riede_SI.xls>
"lithics_lpalaeolithic_neurope"


#-------------------------------------------------------------------------
#' Southeast Asian Warp Ikat Weaving \insertCite{Buckley2012-ye}{evoarchdata}
#'
#' @description
#' Data on decorative motifs used in warp ikat weaving, a method of textile
#'   manufactured widely used in Southeast Asia. Includes 36 weaving traditions,
#'   which according to Buckley "correspond to broadly recognized cultural
#'   groups with distinct languages or dialects".
#'
#' @format A data frame with 36 rows and 111 variables:
#' \describe{
#'   \item{tradition}{Name of the weaving tradition.}
#'   \item{...}{`logical`. Presence/absence of coded characters. See details for the coding system.}
#' }
#'
#' @details
#' See the supplementary information (`Motif_S1.pdf` and `TaxaChars_S1.pdf`)
#'   in \insertCite{Buckley2012-ye;textual}{evoarchdata} for an explanation of
#'   the coding system used.
#'
#' @references
#'
#' * \insertRef{Buckley2012-ye}{evoarchdata}
#'
#' @source <https://figshare.com/articles/dataset/Investigating_Cultural_Evolution_Using_Phylogenetic_Analysis_The_Origins_and_Descent_of_the_Southeast_Asian_Tradition_of_Warp_Ikat_Weaving__/115810>
"textiles_ikat_seasia"