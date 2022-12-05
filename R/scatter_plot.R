#' This function is used to visualize a scatter plot of a variable in the provided
#' data set and the cardiovascular fitness level of each individual in the data set.
#' A regression line is added to show the trend in the data given in the scatter plot.
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis: Cardiovascular Fitness on a scale of 1 lowest to 6 max based on VO2 max performance.
#'
#' This function returns a scatter plot and a regression line.
#'
#' @param data containing data set to be plotted
#' @return scatter plot with regression
#' @export
#' @examples
#' scatterPlot(dataset)

scatterPlot <-function(data){
  x <- data$Score
  y <- data$Fitness
  # plot with main and axis titles
  p <-plot(x, y, main = "Scatterplot with Regression",
       xlab = "Athletic Performance Score",
       ylab = "Cardiovascular Fitness 1 = lowest, 6 = maximum",
       pch = 19, frame = FALSE)
  return(p)
}

#' This function is used to visualize the frequencies of each genotype of the
#' the 23 genes provided in the data set.
#'
#' 23 graphs will be output. Each graph representing a gene, each bar representing
#' a variant, and the y-axis representing the frequency.
#'
#' @param data containing data set to be plotted
#' @return frequency plot
#' @export

genotypeHistogram <- function(data){
  f <- hist(data,
            main = "Frequency of Gene", # Title
            sub = "Based on 23 gene polymorphisms", # Subtitle
            xlab = "Genetic Score", # X-axis label
            ylab = "Frequency", # Y-axis label
            color = "blue")
  return(f)
}
#[END] Written by Helena Jovic
