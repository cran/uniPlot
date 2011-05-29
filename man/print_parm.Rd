\name{print_parm}
\alias{print_parm}
\title{Print Parameter of uniPlot}
\description{Lists all graphical options supported by \code{uniPlot}.}
\usage{
print_parm(type = NULL, value = FALSE)
}
\arguments{
  \item{type}{if \code{NULL} the arguments of graphics, ggplot2 and lattice are shown. Optional \code{graphics}, \code{ggplot2} or \code{lattice} can be choosen.}
  \item{value}{logical, should values be given or not.}
}
\value{List of characters}
\details{To use \code{print_parm} \code{uniPlot} has at least be executed once.}
\author{Sina Rueeger \email{sina.rueeger@gmail.com}
}
\seealso{\code{\link{uniPlot}}}
\examples{
uniPlot()
print_parm(type = "graphics", value = TRUE)
print_parm(type = "lattice", value = FALSE)
}