#' This function is used to visualize a histogram of the genetic scores
#' of each individual in the data set
#'
#' X-axis: Athletic Performance Score is based on 23 gene polymorphisms
#' associated with athletic performance.
#' Y-axis: Frequency
#'
#' This function returns a histogram.
#'
#' @param data object containing data set to be plotted
#' @return a histogram to visualize gene scores
#' @noRd
#' @export
#' @examples
#' load("dataset.rda")
#' scoreHistogram(dataset)
#' @references Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New
#' S Language. Wadsworth & Brooks/Cole.Venables, W. N. and Ripley. B. D. (2002)
#' Modern Applied Statistics with S. Springer.
#'

scoreHistogram <- function(data){
  h <- graphics::hist(data$Score,
            breaks = 7,
            main="Histogram of Genetic Scores",
            xlab="Genetic Scores",
            xlim=c(0,100),
            col="darkmagenta",)
  return(h)
}

