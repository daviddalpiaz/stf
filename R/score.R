#' Roll strong and weak dice
#'
#' @param ns Number of "strong" dice to roll.
#' @param nw Number of "weak" dice to roll.
#' @param ps Success probability of "strong" dice. Defaults to `0.4`.
#' @param pw Success probability of "weak" dice. Defaults to `0.2`.
#'
#' @return A vector of length `ns + nw` that contains rolls from `ns` "strong"
#' dice and `nw` "weak" dice.
#' @export
#'
#' @examples
#' roll(ns = 40, nw = 120)
roll = function(ns, nw, ps = 0.4, pw = 0.2) {
  strong = stats::rbinom(n = ns, size = 1, prob = ps)
  weak = stats::rbinom(n = nw, size = 1, prob = pw)
  c(strong, weak)
}

#' Simulate scored rolls from strong and weak dice
#'
#' @param ns Number of "strong" dice to roll for each simulation.
#' @param nw Number of "weak" dice to roll for each simulation.
#' @param ps Success probability of "strong" dice. Defaults to `0.4`.
#' @param pw Success probability of "weak" dice. Defaults to `0.2`.
#' @param multi Multiplier that adjusts each score from each simulation. Defaults to `1`.
#' @param n Number of simulations to perform. (Repeated rolls of `ns` "strong"
#' dice and `nw` "weak" dice.) Defaults to `10000`.
#'
#' @return A vector of length `n`. Each element of the vector is a simulated score.
#' @export
#'
#' @examples
#' simScores(ns = 40, nw = 120, n = 100)
simScores = function(ns, nw, ps = 0.4, pw = 0.2, multi = 1, n = 10000) {
  multi * replicate(n = n, sum(roll(ns, nw, ps = ps, pw = pw)))
}

#' Calculate empirical probability based on simulated scores
#'
#' @param x Cutoff for probability of interest.
#' @param scores Vector of simulated scores.
#' @param lower Logical value. If `TRUE`, returns \eqn{P[X \leq x]}, otherwise \eqn{P[X > x]}.
#'
#' @return A numeric vector of length one.
#' @export
#'
#' @examples
#' scores = simScores(ns = 40, nw = 120, n = 100)
#' prob(x = 40, scores = scores)
prob = function(x, scores, lower = TRUE) {
  prob = mean(scores <= x)
  if (lower) {
    return(prob)
  }
  return(1 - prob)
}
