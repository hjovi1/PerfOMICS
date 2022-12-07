#' @title generateDataset
#'
#' @description This function is used to generate and save a dataset of entries
#' containing 23 gene polymorphisms associatied with athletic endurance
#' performance ability as well as cardiovascular fitness level. Each gene and
#' their variants has a researched frequency in large populations. This dataset
#' uses these probabilities to generate a contribed dataset suitable for the
#' purposes of this R package. The cardiovascular fitness of each entry is based
#' on the genetic score.
#'
#' @param entries number of individuals to create data for
#'
#' @return a dataset in the form of a data frame with entries number of individuals
#'
#' @examples \dontrun{
#' generateDataset(100)
#' }
#'
#' @references
#' Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language.
#' Wadsworth & Brooks/Cole.
#'
#' @export
#'
#' @importFrom plyr rbind.fill
#'
#' @importFrom stats runif

generateDataset <- function(entries){
  DS = data.frame(
    "ACE"= integer(0),
    "ACTN3"= integer(0),
    "ADRA2A"= integer(0),
    "ADRB2"= integer(0),
    "AMPD1"= integer(0),
    "APOE"= integer(0),
    "ATP1A2 (exon 1)"= integer(0),
    "ATP1A2 (exon 21-22)"= integer(0),
    "CKM"= integer(0),
    "EPAS1 (hCV1639984)"= integer(0),
    "EPAS1 (hCV2148918)"= integer(0),
    "HFE"= integer(0),
    "HIF1A"= integer(0),
    "HLA-A"= integer(0),
    "MT-ND5 (12406)"= integer(0),
    "MT-ND5 (13365)"= integer(0),
    "MT-ND5 (13470)"= integer(0),
    "MT-TT"= integer(0),
    "PPARA"= integer(0),
    "PPARGC1A"= integer(0),
    "UCP2"= integer(0),
    "VEGFA"= integer(0))

  for (x in 1:entries){
    DS = plyr::rbind.fill(DS, data.frame(
      "ACE"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.29,0.50, 0.21)),
      "ACTN3"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
      "ADRA2A"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
      "ADRB2"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.15,0.50, 0.35)),
      "AMPD1"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.19, 0.80)),
      "APOE"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.12,0.64, 0.24)),
      "ATP1A2 (exon 1)"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.18, 0.81)),
      "ATP1A2 (exon 21-22)"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.63,0.32, 0.05)),
      "BDKRB2"=sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.55, 0.15)),
      "CKM"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.07,0.44, 0.49)),
      "EPAS1 (hCV1639984)"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.18,0.49, 0.33)),
      "EPAS1 (hCV2148918)"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.33,0.48, 0.19)),
      "HFE"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.71,0.25, 0.04)),
      "HIF1A"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.02,0.21, 0.77)),
      "HLA-A"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.84,0.14, 0.02)),
      "MT-ND5 (12406)"=  sample(c(0,2), 1, replace=TRUE, prob = c(0.07,0.93)),
      "MT-ND5 (13365)"=  sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
      "MT-ND5 (13470)"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.03,0.27, 0.70)),
      "MT-TT"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.09,0.51, 0.40)),
      "PPARA"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.35,0.48, 0.17)),
      "PPARGC1A"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.25,0.45, 0.30)),
      "UCP2"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.35,0.48, 0.17)),
      "VEGFA"= sample(c(0,1,2), 1, replace=TRUE, prob = c(0.25,0.45, 0.30))))
  }
  DS$Score = (100/46)*rowSums(DS, na.rm = T)
  for (x in 1:entries){
    if (DS$Score[x] < 20){
      fitness = stats::runif(1, 0.0, 1.0)
      DS$Fitness[x] = fitness
    }
    else if (DS$Score[x] >= 20 & DS$Score[x] < 35){
      fitness = stats::runif(1, 1.0, 2.0)
      DS$Fitness[x] = fitness    }
    else if (DS$Score[x] >= 35 & DS$Score[x] < 45){
      fitness = stats::runif(1, 2.0, 3.0)
      DS$Fitness[x] = fitness    }
    else if (DS$Score[x] >= 45 & DS$Score[x] < 55){
      fitness = stats::runif(1, 3.0, 4.0)
      DS$Fitness[x] = fitness    }
    else if (DS$Score[x] >= 55 & DS$Score[x] < 65){
      fitness = stats::runif(1, 4.0, 5.0)
      DS$Fitness[x] = fitness    }
    else  if (DS$Score[x] >= 65){
      fitness = stats::runif(1, 5.0, 6.0)
      DS$Fitness[x] = fitness    }
  }

  paste("Now enter View(DS) in your R console")
  return(DS)
}

#[END] Written by Helena Jovic
