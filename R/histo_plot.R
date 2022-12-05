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
#' @return histogram
#' @noRd
#' @export
#' @examples
#' scoreHistogram(dataset)
#'

scoreHistogram <- function(data){
  h <- hist(data$Score,
            breaks = 12,
            main="Histogram of Genetic Scores",
            xlab="Genetic Scores",
            xlim=c(0,100),
            col="darkmagenta",)
  return(h)
}
