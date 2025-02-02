% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smallest.R
\name{Smallest}
\alias{Smallest}
\title{Smallest}
\usage{
Smallest(M)
}
\arguments{
\item{M}{A matrix "M".}
}
\value{
The smallest row of "M" in lexicographical order.
}
\description{
Smallest
}
\examples{
Smallest(rbind(c(1,2),c(2,3),c(2,3),c(7,8)))

# Example with your dataset in "inst/"
datafile=system.file("M64.RData",package="grouptheory")
load(datafile)
# Apply my function
Smallest(M64)
}
