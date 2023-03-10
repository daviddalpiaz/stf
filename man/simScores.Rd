% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score.R
\name{simScores}
\alias{simScores}
\title{Simulate scored rolls from strong and weak dice}
\usage{
simScores(ns, nw, ps = 0.4, pw = 0.2, multi = 1, n = 10000)
}
\arguments{
\item{ns}{Number of "strong" dice to roll for each simulation.}

\item{nw}{Number of "weak" dice to roll for each simulation.}

\item{ps}{Success probability of "strong" dice. Defaults to \code{0.4}.}

\item{pw}{Success probability of "weak" dice. Defaults to \code{0.2}.}

\item{multi}{Multiplier that adjusts each score from each simulation. Defaults to \code{1}.}

\item{n}{Number of simulations to perform. (Repeated rolls of \code{ns} "strong"
dice and \code{nw} "weak" dice.) Defaults to \code{10000}.}
}
\value{
A vector of length \code{n}. Each element of the vector is a simulated score.
}
\description{
Simulate scored rolls from strong and weak dice
}
\examples{
simScores(ns = 40, nw = 120, n = 100)
}
