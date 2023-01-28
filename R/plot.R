#' Plot histogram of simulated scores
#'
#' @param scores Vector of simulated scores
#'
#' @return A ggplot.
#' @export
plotScores = function(scores) {
  df = data.frame(scores = scores)
  ggplot2::ggplot(data = df) +
    ggplot2::aes(x = scores) +
    ggplot2::geom_histogram(binwidth = 1)
}
