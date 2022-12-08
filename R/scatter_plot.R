#' @title scatterPlot
#'
#' @description This function is used to visualize a scatter plot of a variable in the provided
#' data set and the cardiovascular fitness level of each individual in the data set.
#' A regression line is added to show the trend in the data given in the scatter plot.
#'
#' @param data containing data set to be plotted
#'
#' @return scatter plot with regression. X-axis: athletic performance score
#' based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis: cardiovascular fitness on a scale of 1 lowest to 6 max based on
#' VO2 max performance. A regression line is added to show trend in data given.
#'
#' @examples
#' # Example:
#' # First load the dataset included in the package
#' ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Generate scatterplot using dataset
#' scatterPlot(data)
#'
#' @references
#' Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language.
#' Wadsworth & Brooks/Cole.Venables, W. N. and Ripley. B. D. (2002)
#' Modern Applied Statistics with S. Springer.
#'
#' @export
#'
#' @import graphics
#'
#' @importFrom stats lm

scatterPlot <-function(data){
  x <- data$Score
  y <- data$Fitness
  # plot with main and axis titles
  p <-graphics::plot(x, y, main = "Score vs Fitness Scatterplot with Regression",
           xlab = "Athletic Performance Score",
           ylab = "Cardiovascular Fitness 1 = lowest, 6 = maximum",
           las = 1,
           xlim = c(0,100),
           ylim = c(1,6),
           pch = 19, frame = FALSE,
           col = 4)
  abline(lm(y~x), col=1)
  return(p)
}

#' @title genotypeScatter
#'
#' @description This function is used to visualize the relationship between genotype score of
#' a particular gene in an individual and their cardiovascular fitness level. A
#' regression line is added to show the trend in the data given in the scatter plot.
#'
#' @param data containing data set to be plotted
#'
#' @param gene written in the format dataset$gene, corresponding to a column
#'
#' @return scatter plot with regression. X-axis: genotype score on scale of 0 to
#' 2, where 0 means unfavourable genotype association with athletic performance,
#' 1 means neutral genotype association with athletic performance and 2 means
#' optimal genotype association with athletic performance. Y-axis: cardiovascular
#' fitness on a scale of 1 lowest to 6 max based on VO2 max performance. A
#' regression line is added to show trend in data given.
#'
#' @export
#'
#' @examples
#' # Example:
#' # First load the dataset included in the package
#' ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Generate scatterplot using dataset
#' genotypeScatter(data,data$ACE)
#'
#' @references
#' Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language.
#' Wadsworth & Brooks/Cole.Venables, W. N. and Ripley. B. D. (2002)
#' Modern Applied Statistics with S. Springer.
#'
#' @import graphics
#'
#' @importFrom stats lm
#'
#' @export

genotypeScatter <- function(data, gene){
  if(is.null(gene)){
    stop("This gene column does not exist. Please input another one.")
  }


  fitness <- data$Fitness
  p <-graphics::plot(gene, fitness, main = "Gene vs Fitness Scatterplot with Regression",
                     xlab = "Genotype Score of Gene",
                     ylab = "Cardiovascular Fitness 1 = lowest, 6 = maximum",
                     las = 1,
                     xlim = c(0,2),
                     ylim = c(1,6),
                     pch = 21, frame = FALSE,
                     col = 1)
  abline(stats::lm(fitness~gene), col=4)
  return(p)
}
#[END] Written by Helena Jovic
