#'Function: geneInfo()
#'
#'Purpose: prints information on each gene that is being used in the
#'TGS calculation (name of gene, function of gene, variants and frequencies).
#'
#'Outputs the references used to gather information on the 23 gene polymorphisms.
#'
#'# 'data.frame':    96 obs. of  8 variables:
##  $ treat    : chr  "tip" "tip" "tip" "tip" ...
##  $ nitrogen : chr  "medium" "medium" "medium" "medium" ...
##  $ block    : int  1 1 1 1 1 1 1 1 2 2 ...
##  $ height   : num  7.5 10.7 11.2 10.4 10.4 9.8 6.9 9.4 10.4 12.3 ...
##  $ weight   : num  7.62 12.14 12.76 8.78 13.58 ...
##  $ leafarea : num  11.7 14.1 7.1 11.9 14.5 12.2 13.2 14 10.5 16.1 ...
##  $ shootarea: num  31.9 46 66.7 20.3 26.9 72.7 43.1 28.5 57.8 36.9 ...
##  $ flowers  : int  1 10 10 1 4 9 7 6 5 8 ...
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

