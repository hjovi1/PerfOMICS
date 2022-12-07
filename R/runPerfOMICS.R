#' Launch Shiny App for PerfOMICS
#'
#' A function that launches the Shiny app for PerfOMICS, the code for the
#' Shiny app haas been placed in \code{./inst/shiny-scripts}.
#'
#' @return opens a Shiny page
#'
#' @examples
#' \dontrun{
#' PerfOMICS::runPerfOMICS()
#' }
#'
#' @export
#' @importFrom shiny runApp
#'

runPerfOMICS <- function() {
  appDir <- system.file("shiny-scripts", package = "PerfOMICS")
  runShinyApp <- shiny::runApp(appDir, display.mode = "normal")
  return(runShinyApp)
}

# [END]
