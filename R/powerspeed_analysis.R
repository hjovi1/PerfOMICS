#' @title powerSpeed
#'
#' @description This function is used to provide user's a power speed analysis
#' on their genetic profile by checking for matches between a user's genetic
#' profile and the optimal variants for genes associated with power and speed
#' ability.
#'
#' @param data containing individual data set
#'
#' @return the associated genotypes in an individual profile, each genotype's
#' effect on sports performance and the corresponding recommended training.
#'
#' @examples
#' # Example:
#'
#' # First load the individual dataset included in the package
#' ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Power speed analysis
#' powerSpeed(data)
#'
#' # View(powerspeed)
#'
#' @import readr
#'
#' @export
#'
powerSpeed <- function(data){
  powerspeedGenes <- list()
  row <- 0

  for (gene in data$Gene) {
    row <- row + 1
    # check genotypes of genes that are associated with power and speed
    if (gene == 'ACE'){
      if (data$Variant[row] == 'DD'){
        print('ACE')
        powerspeedGenes <- append(powerspeedGenes, gene)
      }
    }
    else if (gene == 'HIF1A'){
      if (data$Variant[row] == 'TT'){
        print('HIF1A')
        powerspeedGenes <- append(powerspeedGenes, gene)
        }
    }
    else if (gene == 'ACTN3'){
      if (data$Variant[row] == 'XX'){
        print('ACTN3')
        powerspeedGenes <- append(powerspeedGenes, gene)
      }
    }
    else if (gene == 'AMPD1'){
      if (data$Variant[row] == 'CC'){
        print('AMPD1')
        powerspeedGenes <- append(powerspeedGenes, gene)
      }
    }
  }
  # Show user each genotype's effect on training and training recommendations
  ps <- system.file("extdata", "powerspeed.csv", package = "PerfOMICS")
  overview <- readr::read_csv(ps)
  print("Please type View(overview) in your R console. The following genes in the genetic profile are optimal for speed and power:")
  # Let user know which power speed associations match with their profile
  return(powerspeedGenes)
}

#[END] Written by Helena Jovic
