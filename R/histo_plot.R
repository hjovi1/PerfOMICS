#' This function is used to visualize a histogram of the genetic scores
#' of each individual in the data set and a regression line.
#'
#' @param data object containing data set to be plotted
#'
#' @return a histogram to visualize gene scores. X-axis is the athletic performance
#' score based on 23 gene polymorphisms associated with athletic performance.
#' Y-axis is the density of the gene scores. The graph outputs a density line.
#'
#' @examples
#' # Example:
#'
#' # First load the dataset included in the package
#' ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
#' data <- readxl::read_excel(ds)
#'
#' # Generate histogram using dataset
#' scoreHistogram(data)
#'
#' @references
#' Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language.
#' Wadsworth & Brooks/Cole.Venables, W. N. and Ripley. B. D. (2002)
#' Modern Applied Statistics with S. Springer.
#'
#' @import graphics readxl
#' @export

scoreHistogram <- function(data){
  scores <- data$Score
  h <- graphics::hist(scores,
            breaks = seq(from=0, to=100, by=5),
            main="Histogram of Genetic Scores",
            xlab="Genetic Scores",
            xlim=c(0,100),
            col="darkmagenta",
            freq=F,
            las=1)
  lines(density(scores), col="black", lwd=2)
  return(invisible(NULL))
}

