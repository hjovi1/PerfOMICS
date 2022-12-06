#' This function is used to calculate a genetic score on a scale of 0 to 100
#' of an individual genetic profile of 23 gene polymorphisms, using an algorithm
#' proposed by Williams and Folland in 2008. The algorithm is based on researched
#' associations between certain variants and athletic endurance performance.
#'
#' Understanding your score: a score of 0, means every gene in your genetic
#' profile is unfavourable for athletic endurance performance, whereas a score
#' of 100 means every gene in your genetic profile is optimal for athletic
#' endurance performance.
#'
#' @param data containing individual data set
#'
#' @return a genetic score on a scale of 0 to 100 of athletic performance
#' ability and an individual's genetic profile, using 23 gene polymorphisms.
#'
#' @examples
#' # Example:
#'
#' # First load the individual dataset included in the package
#' ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Generate histogram using dataset
#' userScore(data)
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
#' @export
#'
userScore <- function(data){
  genecsv <- system.file("extdata", "geneInfo.csv", package = "PerfOMICS")
  geneInfo <- readr::read_csv(genecsv)
  # initialize total genetic score at 0
  totalScore <- 0
  row <- 0
  # iterate through each genotype variant in individual genetic profile
  for (genotype in data$Variant) {
    row <- row + 1
    # check if variant is unfavourable
    if (genotype %in% geneInfo$`Unfavourable genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 0}
    # check if variant if netural
    else if (genotype %in% geneInfo$`Neutral genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 1}
    # check if variant is optimal
    else if (genotype %in% geneInfo$`Optimal genotype`[row]){
      # add gene score to total score
      totalScore = totalScore + 2}
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