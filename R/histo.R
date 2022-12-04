#' This function is used to visualize a histogram of the genetic scores
#' of each individual in the data set
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms
#' associated with athletic performance.
#' Y-axis: Frequency
#'
#' This function returns a histogram.
#'
#' @import readr
#' @param file containing data set to be plotted
#' @return histogram
#' @noRd
#' @export
#' @examples
#' histo("fake_dataset.xlsx")
#' histo("dataset.Rda")
#' @references

scoreHistogram <- function(file){
  # read excel file with user provided population data
  try(data <- read_excel(file))
  try(load(file=file))

  h <- hist(data$Score,
            breaks = 12,
            main="Histogram of Genetic Scores",
            xlab="Genetic Scores",
            xlim=c(0,100),
            col="darkmagenta",)
  curve(dnorm(x, mean=mean(data$Score), sd=sd(data$Score), add=TRUE, col= "darkblue", lwd=2))
  return(h)
}
