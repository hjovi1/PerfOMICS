#'Function: geneInfo()
#'
#'Purpose: prints information on each gene that is being used in the
#'TGS calculation (name of gene, function of gene, variants and frequencies).
#'
#'Outputs the references used to gather information on the 23 gene polymorphisms.
#'
#'@export
#'@return Returns list of different genes and their descriptions.
#'@import readr
#'
geneInfo <- function(){
library(readr)
geneInfoReferences <- read_csv("geneInfoReferences.csv")
View(geneInfoReferences)

library(readr)
geneInfo <- read_csv("geneInfo.csv")
View(geneInfo)

return(invisible(NULL))
}

#[END] Written by Helena Jovic

