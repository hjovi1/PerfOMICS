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

geneOverview <- function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
  unfavourable <- data.frame(Gene= character(0), Function= character(0))
  neutral <- data.frame(Gene= character(0), Function= character(0))
  optimal <- data.frame(Gene= character(0), Function= character(0))
  row <- 0
  for (genotype in data$Variant) {
    row <- row + 1
    # check if variant is unfavourable
    if (genotype %in% geneInfo$`Unfavourable genotype`[row]){
      # add gene to unfavourable data frame
      unfavourable <- rbind(unfavourable,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Function= geneInfo$Function[row]))}

    # check if variant if netural
    else if (genotype %in% geneInfo$`Neutral genotype`[row]){
      # add gene to neutral data frame
      neutral <- rbind(neutral,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Function= geneInfo$Function[row]))}
    # check if variant is optimal
    else if (genotype %in% geneInfo$`Optimal genotype`[row]){
      # add gene to optimal data frame
      optimal <- rbind(optimal,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
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

athleteProfile1(type, file){
  # score
  # gene overview
  # training recommendations
  # health recommendations

  if (type == "score") {
    return(userScore(file))
  }
  else if (type == "gene overview"){
    return(geneOverview(file))
  }
  else if (type == "training recommendations"){

  }
}

genotypeProb <- function(){
# 23 gene polymorphisms that will be used to calculate the athletic performance prediction score
gene <- c("ACE2", "ACTN3","ADRA2A","ADRB2","AMPD1","APOE","ATP1A2","ATP1A2x",
          "BDKRB2","CKM","EPAS1","EPAS1x","HFE","HIF1A","HLAA","MTND5","MTND5x",
          "MTND5y", "MTTT","PPARA","PPARGC1A","UCP2","VEGFA")
# each gene's variants are paired with an accepted researched frequency in large populations.
score <- c(sample(c(0,1,2), 1, replace=TRUE, prob = c(0.29,0.50, 0.21)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.15,0.50, 0.35)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.19, 0.80)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.12,0.64, 0.24)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.18, 0.81)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.63,0.32, 0.05)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.55, 0.15)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.07,0.44, 0.49)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.18,0.49, 0.33)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.33,0.48, 0.19)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.71,0.25, 0.04)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.02,0.21, 0.77)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.84,0.14, 0.02)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.07,0.93)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.03,0.27, 0.70)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.09,0.51, 0.40)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.35,0.48, 0.17)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.25,0.45, 0.30)))
# storing the data in a data frame
df <- data.frame(gene, score)
return(df)
}

#'Function: calculateTGS()
#'
#'Purpose: Total genotype score (TGS) reflects the additive effect of genotypes
#'on predicting a complex trait such as athletic performance. It is an algorithm
#'introduced by Williams and Folland and is also known as a genetic
#'predisposition score using synthetic data of 23 genetic markers.
#'
#'@references
#'Williams, A. G., & Folland, J. P. (2008). Similarity of polygenic profiles
#'limits the potential for elite human physical performance. The Journal of
#'physiology, 586(1), 113–121. https://doi.org/10.1113/jphysiol.2007.141887
#'
#'@export
#'@return Returns the total genotype score (TGS) of one polygenic profile.
#'
calculateTGS <- function(){
  genes <- genotypeProb()
  scores <- genotypeProb()["score"]
  # Williams and Folland genetic predisposition score using synthetic data of 23 genetic markers
  TGS <- ((100/46)*sum(scores))
  return(TGS)
}

#'Function: athleteProfile()
#'
#'Purpose: To generate a detailed report on an athlete's polygenic profile.
#'This function uses the helper function genotypeProb() and TGS calculations
#'to provide insights on an athlete's strengths, weakness' as well as consequential
#'effects on sports performances and individualized training recommendations.
#'@export
#'@return Returns a series of print functions to convey a detailed report on an
#'athlete's polygenic profile and its implications on training recommendations
#'and athletic performance.
#'

athleteProfile <- function(){
  ind <- genotypeProb()
  scores <-ind["score"]
  TGS <- ((100/46)*sum(scores))
  scor <- ind$score

  favourable <- list()
  neutral <- list()
  unfavourable <- list()

  counter = 1
  for (s in ind$score){
    if (s == 0){
      unfavourable <- append(unfavourable,ind$gene[counter])
      counter = counter + 1
    }
    if (s == 1){
      neutral <- append(neutral,ind$gene[counter])
      counter = counter + 1
    }
    if (s == 2){
      favourable <- append(favourable,ind$gene[counter])
      counter = counter + 1
    }
  }

  if ("ACE2"%in% unfavourable){
    print("ACE gene is unfavourable in your genetic profile. Effect on Sports
    Performance: Reduced endurance capacity / increased muscle performance.
    Training Recommendations: Training to increase anaerobic (a-lactic)
    performance. Increase progressively but fast the number of training
    sessions on weekly schedule. If required, emphasis on training to increase
    endurance. Perform training for strength in high frequency with sub-maximum
          loads.")
  }
  if ("ACTN3"%in%favourable){
  print("ACTN3 gene is favourable in your genetic profile. Effect on Sports
  Performance: Increased slow muscle fiber metabolism
  reduced muscle power. Training Recommendations: Long term physical
  preparation to achieve technical perfection. Perform many routes of the
  competition distance / repetitive routes of similar overall distance.
  Advantage in rapid muscle contraction confers increased risk of muscle
  injury when performing exercises with maximum intensity. Perform exercises
  in sub maximum intensity or increase progressively the intensity of the
  exercise.")
  }

  print("Your calculated Total Genotype Score out of 100 is: ")
  print(TGS)
  print("These genes in your profile are favourable for endurance athletic performance")
    print(favourable)
    print("These genes in your profile are unfavourable for endurance athletic performance")
    print(unfavourable)
    print("These genes in your profile are neutral for endurance athletic performance")
    print(neutral)
  print("Refer to the gene glossary in geneInfo.R for more insights on your polygenetic profile.")
}

#'Function: generateDataSet(n)
#'
#'Purpose: To generate a large dataset in the form of a data fram of n
#'polygenic total genotype scores to be used for analysis and (potential)
#'plotting purposes.
#'
#'@param n for the number of polygenic profiles to be generated and their
#'respective calculated total genotype scores to be included in the dataset.
#'@export
#'@return Returns a dataframe of n individuals and their respective TGS.
#'
generateDataSet <- function(n) {
  df = data.frame()
  for (x in 1:n){
    output = PerfOMICS::calculateTGS()
    df = rbind(df, output)
  }
  colnames(df)<-c("TGS")
  return(df)
}

#'Plot function: generateFreqPlot(n)
#'
#'Purpose: To generate a frequency plot of n polygenic total genotype scores to
#'be used for analysis and plotting purposes.
#'
#'@param n for the number of polygenic profiles to be generated and their
#'respective calculated total genotype scores to be included in the dataset.
#'@export
#'@return Returns a frequency plot of n individuals and their respective TGS.
#'@import Hmisc lattice survival Formula ggplot2
#'
generateFreqPlot <- function(n=100){
  plot <- hist.data.frame(generateDataSet(n))
  return(invisible(NULL))
}

#'Plot function: generateBoxPlot(n)
#'
#'Purpose: To generate a box plot of n polygenic total genotype scores to
#'be used for analysis and plotting purposes.
#'
#'@param n for the number of polygenic profiles to be generated and their
#'respective calculated total genotype scores to be included in the dataset.
#'@export
#'@return Returns a frequency plot of n individuals and their respective TGS.
#'@import graphics
#'
generateBoxPlot <- function(n=100){
  # install.packages("graphics")
  # library(graphics) # to load and attach
  dataset <- generateDataSet(n)
  box <- boxplot(dataset) # boxplot
  return(invisible(NULL))
}

#[END] Written by Helena Jovic
