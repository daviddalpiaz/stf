#' Simulate a battle
#'
#' @param a_ns Number of attacker "strong" dice to roll for each simulation.
#' @param a_nw Number of attacker "weak" dice to roll for each simulation.
#' @param a_multi Multiplier that adjusts attacker score from each simulation. Defaults to `1`.
#' @param d_ns Number of defender "strong" dice to roll for each simulation.
#' @param d_nw Number of defender "weak" dice to roll for each simulation.
#' @param d_multi Multiplier that adjusts defender score from each simulation. Defaults to `1`.
#' @param n Number of battles to simulate. Defaults to `10000`.
#'
#' @return A numeric vector containing estimated battle outcomes.
#' @export
simBattle = function(a_ns, a_nw, a_multi = 1, d_ns, d_nw, d_multi = 1, n = 1000) {
  attack = stf::simScores(ns = a_ns, nw = a_nw, n = n, multi = a_multi)
  defend = stf::simScores(ns = d_ns, nw = d_nw, n = n, multi = d_multi)
  a_win = mean(attack > defend)
  tie   = mean(attack == defend)
  d_win = mean(attack < defend)
  c(a_win = a_win, tie = tie, d_win = d_win)
}
