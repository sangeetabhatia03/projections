% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/accessors.R
\name{get_dates}
\alias{get_dates}
\alias{get_dates.default}
\alias{get_dates.projections}
\alias{get_incidence}
\alias{get_incidence.default}
\alias{get_incidence.projections}
\title{Access content projections objects}
\usage{
get_dates(x, ...)

\method{get_dates}{default}(x, ...)

\method{get_dates}{projections}(x, ...)

get_incidence(x, ...)

\method{get_incidence}{default}(x, ...)

\method{get_incidence}{projections}(x, ...)
}
\arguments{
\item{x}{A \code{projections} object.}

\item{...}{Further arguments passed to methods; currently not used.}
}
\description{
These simple helper functions retrieve content from \code{projections}
objects. They currently include:
}
\details{
\itemize{
 \item \code{get_dates}: get dates of the predictions.

\item \code{get_incidence}: get the original incidence object used as input
 for the predictions.

}
}
\examples{


if (require(distcrete) && require(incidence)) {

## prepare input: epicurve and serial interval
dat <- c(0, 2, 2, 3, 3, 5, 5, 5, 6, 6, 6, 6)
i <- incidence(dat)
si <- distcrete("gamma", interval = 1L,
                 shape = 1.5,
                 scale = 2, w = 0)


## make predictions
pred_1 <- project(i, 1.2, si, n_days = 30)
pred_1


## retrieve content
get_dates(pred_1)
max(i$dates) # predictions start 1 day after last incidence
get_incidence(pred_1)
identical(get_incidence(pred_1), i) # check object is the same
}

}
\author{
Thibaut Jombart \email{thibautjombart@gmail.com}
}
