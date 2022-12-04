#' This function is used to visualize a scatter plot of a variable in the provided
#' data set and the cardiovascular fitness level of each individual in the data set.
#' A regression line is added to show the trend in the data given in the scatter plot.
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis: Cardiovascular Fitness on a scale of 1 lowest to 6 max based on VO2 max performance.
#'
#' This function returns a scatter plot and a regression line.
#'
#' @import readr
#' @param var variable to plot frequency for
#' @param file containing data set to be plotted
#' @return frequency plot
#' @export
#' @examples
#' scatterPlot("fake_dataset.xlsx")
#' @references H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

scatterPlot <-function(file){
  # read excel file with user provided population data
  data <- read_excel(file)
  x <- data$Score
  y <- data$Fitness
  # plot with main and axis titles
  p <-plot(x, y, main = "Scatterplot with Regression",
       xlab = "Athletic Performance Score",
       ylab = "Cardiovascular Fitness 1 = lowest, 6 = maximum",
       pch = 19, frame = FALSE)
  abline(lm(y ~ x, data = mtcars), col = "blue")
  return(p)
}

#' This function is used to visualize a scatter plot of a variable in the provided
#' data set and the cardiovascular fitness level of each individual in the data set.
#' A regression line is added to show the trend in the data given in the scatter plot.
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis: Cardiovascular Fitness on a scale of 1 lowest to 6 max based on VO2 max performance.
#'
#' This function returns a scatter plot and a regression line.
#'
#' @import readr
#' @param var variable to plot frequency for
#' @param file containing data set to be plotted
#' @return frequency plot
#' @export
#' @examples
#' scatterPlot("fake_dataset.xlsx")
#' @references H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

genotypeFrequencyPlot <- function(file){
  library("readxl")
  # read excel file with user provided population data
  data <- read_excel(file)
  f <- hist(data, main = "Frequency of Scores", # Title
                  sub = "Based on 23-polymorphisms", # Subtitle
                  xlab = "Genetic Score", # X-axis label
                  ylab = "Frequency", # Y-axis label
                  color = 'blue')
  return(f)
}

#' This function is used to visualize a scatter plot of a variable in the provided
#' data set and the cardiovascular fitness level of each individual in the data set.
#' A regression line is added to show the trend in the data given in the scatter plot.
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis: Cardiovascular Fitness on a scale of 1 lowest to 6 max based on VO2 max performance.
#'
#' This function returns a scatter plot and a regression line.
#'
#' @import readr
#' @param var variable to plot frequency for
#' @param file containing data set to be plotted
#' @return frequency plot
#' @export
#' @examples
#' scatterPlot("fake_dataset.xlsx")
#' @references H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

scoreFrequencyPlot <- function(file){
  library("readxl")
  # read excel file with user provided population data
  data <- read_excel(file)
  Score <- data$Score
  h <- hist(Score,
  main="Frequency Plot of Genetic Scores",
  xlab="Genetic Scores",
  xlim=c(0,100),
  col="darkmagenta",
  freq=FALSE)

  return(h)
}

#[END] Written by Helena Jovic
