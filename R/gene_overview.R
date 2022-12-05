#' This function is used to provide an overview of a user's genetic profile.
#'
#' The function categorizes each gene's variant into three buckets:
#' unfavorable, neutral and optimal for athletic performance.
#'
#' This function returns three data frames summarizing the genes and their functions.
#'
#' @param file containing individual data set
#' @return scatter plot with regression
#' @export
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
