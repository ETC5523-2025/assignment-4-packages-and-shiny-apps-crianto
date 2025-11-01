#' Launch the Top1000 Shiny App
#'
#' This function launches the interactive Shiny application
#' that allows users to explore how common their name is
#' compared to others in the Top 1000 dataset.
#'
#' @return Opens a Shiny app in your default browser.
#' @export
#' @examples
#' if (interactive()) {
#'   launch_app()
#' }

launch_app <- function() {
  app_dir <- system.file("app", package = "assignment4packagescrianto")
  if (app_dir == "") {
    stop("Could not find app directory. Try reinstalling the package.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
