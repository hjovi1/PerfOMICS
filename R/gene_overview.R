#' @title geneOverview
#'
#' @description This function is used to provide an overview of a user's genetic profile by
#' categorizing each gene's variant into three buckets: unfavorable, neutral
#' and optimal for athletic endurance performance.
#'
#' @param data containing individual data set of 23 gene polymorphisms
#'
#' @return this function returns three saved data frames summarizing the genes
#' and their functions
#'
#' @examples
#' # Example:
#'
#' # First load the individual dataset included in the package
#' ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Generate summary using dataset
#' geneOverview(data)
#'
#' @export
#'
#' @import readr
#'
#' @importFrom plyr rbind.fill

geneOverview <- function(data){
  genecsv <- system.file("extdata", "geneInfo.csv", package = "PerfOMICS")
  geneInfo <- readr::read_csv(genecsv)
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
  for (genotype in data$Variant){
    row = row + 1
    # check if variant is unfavourable
    if (genotype %in% geneInfo$`Unfavourable genotype`[row]){
      # add gene to unfavourable data frame
      unfavourable <- plyr::rbind.fill(unfavourable,
                            data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                       Variant= geneInfo$`Unfavourable genotype`[row],
                                       Function= geneInfo$Function[row]))}

    # check if variant if netural
    else if (genotype %in% geneInfo$`Neutral genotype`[row]){
      # add gene to neutral data frame
      neutral <- plyr::rbind.fill(neutral,
                       data.frame(Gene= geneInfo$`Gene abbreviation`[row],
                                  Variant= geneInfo$`Neutral genotype`[row],
                                  Function= geneInfo$Function[row]))}
    # check if variant is optimal
    else if (genotype %in% geneInfo$`Optimal genotype`[row]){
      # add gene to optimal data frame
      optimal <- plyr::rbind.fill(optimal,
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

  return("Now type, 'View(optimal)', 'View(neutral)', 'View(unfavourable)' in your R console")
}

#[END] Written by Helena Jovic
