#' This function is used to calculate a genetic score on a scale of 0 to 100
#' of an individual genetic profile of 23 gene polymorphisms.
#'
#' The function uses an algorithm proposed by Williams and Folland in 2008,
#' which is based on researched associations between certain variants and
#' athletic endurance performance.
#'
#' Understanding your score: a score of 0, means every gene in your genetic
#' profile is unfavourable for athletic endurance performance, whereas a score
#' of 100 means every gene in your genetic profile is optimal for athletic
#' endurance performance.
#'
#' @import readxl
#' @param file containing individual data set
#' @return scatter plot with regression
#' @export
#' @examples
#' Example 1 of Non-Power Speed Profile:
#' powerSpeed("Ind2.xlsx")
#' Example 2 of a Power Speed Profile:
#' powerSpeed("Ind3.xlsx") #'
#'
#' @references
#' Kambouris, M., Ntalouka, F., Ziogas, G., & Maffulli, N. (2012).
#' Predictive Genomics DNA Profiling for Athletic Performance. Recent patents
#' on DNA & gene sequences, 6. doi:10.2174/187221512802717321
#'
#' Petr M, Thiel D, Kateřina K, Brož P, Malý T, Zahálka F, Vostatková P,
#' Wilk M, Chycki J, Stastny P. Speed and power-related gene polymorphisms
#' associated with playing position in elite soccer players. Biol Sport.
#' 2022 Mar;39(2):355-366. doi: 10.5114/biolsport.2022.105333.
#' Epub 2021 Apr 21. PMID: 35309536; PMCID: PMC8919892.
#'
userScore <- function(file){
  # read excel file with user provided genetic profile
  data <- readxl::read_excel(file)
  # initialize total genetic score at 0
  totalScore <- 0
  row <- 0
  # iterate through each genotype variant in individual genetic profile
  for (genotype in data$Variant) {
    row <- row + 1
    # check if variant is unfavourable
    if (genotype %in% geneInfo$`Unfavourable genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 0
      print(geneInfo$`Unfavourable genotype`[row])}
    # check if variant if netural
    else if (genotype %in% geneInfo$`Neutral genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 1
      print(geneInfo$`Neutral genotype`[row])}
    # check if variant is optimal
    else if (genotype %in% geneInfo$`Optimal genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 2
      print(geneInfo$`Optimal genotype`[row])}
    # return error if variant doesn't match with any variant for that gene
    else{
      return(cat("Something went wrong. Check format of variant for",
                geneInfo$`Gene abbreviation`[row],". Variant should be one of: ",
                geneInfo$`Unfavourable genotype`[row], ",",
          geneInfo$`Neutral genotype`[row], ", or",
          geneInfo$`Optimal genotype`[row],". "))
    }
    }
  # calculate and return total genetic score
  totalScore = (100/46)*totalScore
  return(cat("Your total genetic score is: ", totalScore))
}

#' This function is used to provide an overview of a user's genetic profile.
#'
#' The function categorizes each gene's variant into three buckets:
#' unfavorable, neutral and optimal for athletic performance.
#'
#' This function returns three data frames summarizing the genes and their functions.
#'
#' @import readxl readr
#' @param file containing individual data set
#' @return scatter plot with regression
#' @export
#' @examples
#' powerSpeed("Ind2.xlsx")
#' @references
#'@import readxl
geneOverview <- function(file){
  # read excel file with user provided genetic profile
  data <- readxl::read_excel(file)
  # create empty data frame to store unfavourable genes for individual profile
  unfavourable <- data.frame(Gene= character(0), Variant= character(0),
                             Function= character(0))
  # create empty data frame to store neutral genes for individual profile
  neutral <- data.frame(Gene= character(0), Variant= character(0),
                        Function= character(0))
  # create empty data frame to store optimal genes for individual profile
  optimal <- data.frame(Gene= character(0), Variant= character(0),
                        Function= character(0))
  row <- 0
  for (genotype in data$Variant) {
    row <- row + 1
    # check if variant is unfavourable
    if (genotype %in% geneInfo$`Unfavourable genotype`[row]){
      # add gene to unfavourable data frame
      unfavourable <- rbind(unfavourable,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Variant= geneInfo$`Unfavourable genotype`[row],
                                       Function= geneInfo$Function[row]))}

    # check if variant if netural
    else if (genotype %in% geneInfo$`Neutral genotype`[row]){
      # add gene to neutral data frame
      neutral <- rbind(neutral,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Variant= geneInfo$`Neutral genotype`[row],
                                       Function= geneInfo$Function[row]))}
    # check if variant is optimal
    else if (genotype %in% geneInfo$`Optimal genotype`[row]){
      # add gene to optimal data frame
      optimal <- rbind(optimal,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Variant= geneInfo$`Optimal genotype`[row],
                                       Function= geneInfo$Function[row]))}
    # return error if variant doesn't match with any variant for that gene
    else{
      return(cat("Something went wrong. Check format of variant for",
                 geneInfo$`Gene abbreviation`[row],". Variant should be one of: ",
                 geneInfo$`Unfavourable genotype`[row], ",",
                 geneInfo$`Neutral genotype`[row], ", or",
                 geneInfo$`Optimal genotype`[row],". "))}
  }
  # open dataframe with optimal genes in data and their function
  View(optimal)
  # open dataframe with unfavourable genes in data and their function
  View(unfavourable)
  # open dataframe with neutral genes in data and their function
  View(neutral)
  return(invisible(NULL))
}

#' This function is used to provide user's a power speed analysis on their genetic
#' profile.
#'
#' The function checks for matches between a user's genetic profile and the optimal
#' variants for genes associated with power and speed ability.
#'
#' This function returns the associated genotypes, their effect on sports performance
#' and recommended training.
#'
#' @import readxl readr
#' @param file containing individual data set
#' @return scatter plot with regression
#' @export
#' @examples
#' Example 1 of Non-Power Speed Profile:
#' powerSpeed("Ind2.xlsx")
#' Example 2 of a Power Speed Profile:
#' powerSpeed("Ind3.xlsx")
#' @references
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
