\name{pal}
\alias{pal}
\title{Shows vector of colours}
\description{Shows vector of colours \code{col} by printing them as a barplot.}
\usage{
pal(col)
}
\arguments{
  \item{col}{Vector of colours}
}
\details{Something similar seen in vignette of \pkg{colorspace}, see \code{vignette("hcl-colors")}.}
\author{Sina Rueeger \email{sina.rueeger@gmail.com}
}

\examples{
pal(palette())
}