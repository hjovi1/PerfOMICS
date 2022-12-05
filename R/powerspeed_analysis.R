#' This function is used to provide user's a power speed analysis on their genetic
#' profile.
#'
#' The function checks for matches between a user's genetic profile and the optimal
#' variants for genes associated with power and speed ability.
#'
#' This function returns the associated genotypes, their effect on sports performance
#' and recommended training.
#'
#' @param file containing individual data set
#' @return scatter plot with regression
#' @export
#'
powerSpeed <- function(file){
  library(readr)
  # read excel file with user provided genetic profile
  data <- readxl::read_excel(file)
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
  cat("You have ", length(powerspeedGenes),
      "genes out of 4 that associate with power and speed. Review each associated genotype's effect on athletic performance and recommended training.")
  # Show user each genotype's effect on training and training recommendations
  powerspeed <- read_csv("powerspeed.csv")
  View(powerspeed)
  return(invisible(NULL))
}

#[END] Written by Helena Jovic
