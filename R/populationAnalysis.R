scatterPlot <-function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
  x <- data$Score
  y <- data$Fitness
  # Plot with main and axis titles
  # Change point shape (pch = 19) and remove frame.
  p <-plot(x, y, main = "Scatterplot with Regression",
       xlab = "Athletic Performance Score", ylab = "Cardiovascular Fitness 1 = lowest, 6 = maximum",
       pch = 19, frame = FALSE)
  abline(lm(y ~ x, data = mtcars), col = "blue")
  return(p)
}

#' @import readr
frequencyPlot <- function(file){
  library("readxl")
  data <- read_excel(file)
  f <- hist(data, main = "Frequency of Scores", # Title
                  sub = "Based on 23-polymorphisms", # Subtitle
                  xlab = "Genetic Score", # X-axis label
                  ylab = "Frequency", # Y-axis label
                  color = 'blue')
  return(f)
}

#return(freplot)

#[END] Written by Helena Jovic
