% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hello.R
\docType{data}
\name{kurgans_catacomb}
\alias{kurgans_catacomb}
\title{Kurgans of the Catacomb culture \insertCite{Slusarska2006-zc}{evoarchdata}}
\format{
A data frame with 703 rows and 56 variables:
\describe{
\item{id}{Arbitrary unique identifier of the burial.}
\item{group}{Regional grouping assigned by Ślusarska.}
\item{site}{Name of the site.}
\item{mound}{Identifier of the burial mound within the site.}
\item{grave}{Identifier of the individual burial within the mound/site.}
\item{name}{Unique name of the burial (\code{site} \code{mound} / \code{grave}).}
\item{latitude, longitude, raion, oblast}{Geographical location of the site.}
\item{interment}{Number of interments (single, twin, collective or cenotaph).}
\item{sex}{Biological sex of the remains, if known.}
\item{age}{Age of the remains, if known (juvenile or adult).}
\item{grave_type, shaft, gangway, steps, dromos, entrance_screen, boards, organic_lining}{Details of the construction of the grave and mound, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
\item{body_position, leg_position}{Details of the interment style, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
\item{ochre, charcoal, chalk, fire, mask, tar, animal_bones}{Presence or absence of traces of funerary ritual, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
\item{axe_hammer, macehead, arrowhead, spearhead, bow, bronze_knife, bola, wooden_javelin}{Presence or absence of different types of weapons in grave goods, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
\item{polishing_plate,arrow_straightener, awl, grindstone, scraper, punch, hammerstone, perforator, casting_mould, tuyere, digging_tool, adze, melting_pot, flint_knife}{Presence or absence of different types of tools in grave goods, see \insertCite{Slusarska2006-zc;textual}{evoarchdata} for details.}
\item{wooden_cup, wooden_bowl, pottery}{Presence or absence of different types of household goods in grave goods.}
\item{body_ornament}{Presence or absence of bodily ornamentation in grave goods.}
}
}
\source{
\insertCite{Roe2013-ls;textual}{evoarchdata}
}
\usage{
kurgans_catacomb
}
\description{
Data on the construction, interment style, and grave goods of 703 mound
burials (\emph{kurgans}) of the Bronze Age Catacomb culture of the West Eurasian
steppe. Each row represents one burial, from 207 mounds across 82 sites.
}
\details{
Originally compiled by \insertCite{Slusarska2006-zc;textual}{evoarchdata}.
Transcribed and recoded for phylogenetic analysis by
\insertCite{Roe2013-ls;textual}{evoarchdata}.

Coordinates were not included in the original dataset; those included are
approximate, based on the nearest identifiable place name to each site.
}
\references{
\insertAllCited{}
}
\keyword{datasets}
