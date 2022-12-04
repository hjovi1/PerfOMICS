#' Purpose: Use contribed datasets of researched-backed polygenic information
#' to analyze and visualize predicted athletic endurance performances of
#' individuals based on their polygenic athlete profile and total genotype score.
#' Author: Helena Jovic
#' Date: November 11, 2022
#' Version: 1.0
#' Bugs and Issues:
#'
#' Before each session run this in console
#' library(devtools)
#' library(roxygen2)
#' library(testthat)
#' library(knitr)
#'
#' Function: genotypeProb()
#' A function that compiles genetic information of 23 genes associated with
#' endurance athletic ability. The function uses researched statistical data
#' on the frequencies of the genotypes of each gene to generate a polygenic
#' profile to predict athletic endurance performance. Each genotype is paired
#' with a respective genetic score, revealing how favourable (0 = unfavourable,
#' 1 = neutral, 2 = favourable) each genotype is for athletic endurance ability.
#'
#' @export
#' @return a dataframe containing a column of genes associated with athletic
#' ability and a corresponding column of scores paired with each gene for one
#' individual.
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
#'@import readr
userScore <- function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
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

#'@import readr
geneOverview <- function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
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

powerSpeed <- function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
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
  cat("You have ", length(powerSpeedGenes), "genes out of 4 that associate with a
        Genetic Profile of an Individual Favoring Speed and Strength Performance
        . These genes are: ", powerspeedGenes, "View the effect on training of
      these genes and training recommendations for this profile in the powerspeed
      tab.")
  # Show user each genotype's effect on training and training recommendations
  View(powerspeed)
  return(invisible(NULL))
}

athleteProfile <- function(type, file){
  # Show user their total genetic score for athletic performance
  if (type == "score") {
    return(userScore(file))
  }
  # Show user the gene's in their athletic profile that are optimal, neutral,
  # and unfavourable for athletic performance
  else if (type == "gene overview"){
    return(geneOverview(file))
  }
  # Show user how much their genetic profile matches with that of an optimal
  # power-speed athlete and return effects on training and training recommendations
  else if (type == "powerspeed")
    return(powerspeed(file))
  # If incorrect type or file is entered return error message
  else{
    return("Error, please review your input for (type, file). For type:
    Please select from:'score', 'gene overview' and 'powerspeed'.
    Check that the proper file is being called.")
  }
}

#[END] Written by Helena Jovic
