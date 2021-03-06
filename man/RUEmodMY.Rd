% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RUEmodMY.R
\name{RUEmodMY}
\alias{RUEmodMY}
\title{Radiation use efficiency based model}
\usage{
RUEmodMY(weatherdatafile, doy.s = 91, doy.f = 227, ...)
}
\arguments{
\item{weatherdatafile}{weather data file (see example).}

\item{doy.s}{first day of the growing season, default 91.}

\item{doy.f}{last day of the growing season, default 227.}

\item{...}{additional arguments to be passed to the \code{\link{RUEmod}}
function.}
}
\value{
a \code{\link{data.frame}} structure with components
\itemize{
\item year simulation year.
\item doy day of the year.
\item lai.cum cumulative leaf area index.
\item AG.cum cumulative above ground dry biomass (Mg \eqn{ha^{-1}}).
\item AGDD cumulative growing degree days.
\item Int.e Intercepted solar radiation.
}
}
\description{
Same as \code{\link{RUEmod}} but it handles multiple years.
}
\examples{

## weather data from Champaign, IL
data(cmiWet)
tmp1 <- RUEmodMY(cmiWet)

lattice::xyplot(AG.cum ~ doy | factor(year), type='l', data = tmp1,
       lwd=2,
       ylab=expression(paste('dry biomass (Mg ',ha^-1,')')),
       xlab='DOY')

}
\keyword{models}
