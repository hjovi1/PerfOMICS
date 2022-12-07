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
        append(powerspeedGenes, gene)
      }
    }
    else if (gene == 'HIF1A'){
      if (data$Variant[row] == 'DD'){
        append(powerspeedGenes, gene)
        }
    }
    else if (gene == 'ACTN3'){
      if (data$Variant[row] == 'XX'){
        append(powerspeedGenes, gene)
      }
    }
    else if (gene == 'AMPD1'){
      if (data$Variant[row] == 'GG'){
        append(powerspeedGenes, gene)
      }
    }
    else{
      # if there is no match we continue to next iteration
      next
    }
  }
  # Let user know which power speed associations match with their profile
  paste("You have ", length(powerspeedGenes),
      "genes out of 4 that optimally associate with power and speed. Review each associated genotype's effect on athletic performance and recommended training.")
  # Show user each genotype's effect on training and training recommendations

  ps <- system.file("extdata", "powerspeed.csv", package = "PerfOMICS")
  powerspeed <- readr::read_csv(ps)
  return(invisible(NULL))
}

#[END] Written by Helena Jovic
