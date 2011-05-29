\name{uniPlot}
\alias{uniPlot}
\title{Change options of graphics, ggplot2, and lattice simultaneously}
\description{Uniform and customize graphical options of packages \pkg{graphics}, \pkg{ggplot2} and \pkg{lattice}.}

\usage{
uniPlot(type = "uniPlot", graphics = NULL, ggplot2 = NULL, lattice = NULL, show.col = FALSE)
}
\arguments{
  \item{type}{\code{"uniPlot"} or \code{"before"}, see details.
}
  \item{graphics}{a list  containing options of the package graphics. With \code{print_parm(type="graphics")} all supported options are listed.}
  \item{ggplot2}{a list  containing options of the package ggplot2. With \code{print_parm(type="ggplot2")} all supported options are listed.
}
  \item{lattice}{a list  containing options of the package lattice. With \code{print_parm(type="lattice")} all supported options are listed.
}
  \item{show.col}{logical, should color palette be shown when uniPlot is started.
}
}
\details{
To change options give either a list of options to \code{graphics}, \code{ggplot2}, or \code{lattice}. The options of the other two packages are adjusted simultaneously to achieve a similar appearance as far as possible.

Use the function \code{print_parm} to get a list of the supported options. Note: \code{uniPlot} has at least to be executed once to use \code{print_parm}. The option names of argument \code{lattice} and \code{ggplot2} are as close to the original names as possible. The \code{$}-sign was replaced by a dot (e.g. the two options in lattice of title code{title = list(cex = 1, col = 2)} become title.cex and title.col). 

With \code{uniPlot(type = "before")} all options are set on defaults. 

Optionally, functions can be given to \code{ggplot2} or \code{lattice}. However, such changes are not global.

For further information or to check the todo-list go to \url{http://uniplot.sinarueeger.ch}. Not yet implemented features are discussed there as well.
}
\value{No visible value returned. Changes of options are performed as described above.}

\references{
Chambers, J.M. (2008) \emph{Software for data analysis: programming with R} Springer.

R Development Core Team (2011) \emph{Writing R Extensions}.

Sarkar, D. (2008) \emph{Lattice: multivariate data visualization with R}. Springer.

Tufte, E.R. (1983) \emph{The visual display of quantitative information}. Graphics Press.

Wickham, H. (2009) \emph{ggplot2: elegant graphics for data analysis}. Springer.
}

\author{Sina Rueeger \email{sina.rueeger@gmail.com}
}
\note{Options are stored in a separate environment called \code{uniPlot.parm}. Also the package \pkg{uniPlot} contains functions with names identical to other functions. Therefore the order of the environments is important. \code{package:uniPlot} and \code{uniPlot.parm} must occur before \code{package:graphics}.

If uniPlot is in use \code{par()} can not be used regulary. This has to be fixed.
}

\seealso{
\code{\link[lattice]{trellis.par.set}}, 
\code{\link[ggplot2]{theme_set}}, 
\code{\link[graphics]{par}}
}

\keyword{customize}
\keyword{uniform}

\examples{

\dontshow{
uniPlot()
uniPlot(type = "before")}
require(ggplot2)
require(lattice)
dia <- diamonds[sample(1:nrow(diamonds), 1000), ]


## Default
## ----------------
dev.new()
plot(dia$carat, dia$price, main = "Diamonds", col = dia$color)
grid()

dev.new()
qplot(carat, price, data = dia, main ="Diamonds", color = color) + facet_wrap(~ cut)

dev.new()
xyplot(price ~ carat | factor(cut), data = dia, group = color, main = "Diamonds", type = c("p", "g"))


## uniform
## ----------------
uniPlot()
dev.new()
plot(dia$carat, dia$price, main = "Diamonds", col = dia$color)
grid()

dev.new()
qplot(carat, price, data = dia, main ="Diamonds", color = color) + facet_wrap(~ cut)

dev.new()
xyplot(price ~ carat | factor(cut), data = dia, group = color, main = "Diamonds", type = c("p", "g"))


## customize
## ----------------

## check print_parm() for names
print_parm(type = "graphics")
uniPlot(graphics = list(pch = 16, reference.col = "black", tcl = (-0.5)), lattice = list(strip.background.col = "white", reference.line.col = "red"), show.col = TRUE)

dev.new()
plot(dia$carat, dia$price, main = "Diamonds", col = dia$color)
grid()

dev.new()
qplot(carat, price, data = dia, main ="Diamonds", color = color) + facet_wrap(~ cut)

dev.new()
xyplot(price ~ carat | factor(cut), data = dia, group = color, main = "Diamonds", type = c("p", "g"))


## reset
## ----------------
uniPlot(type = "before")

dev.new()
plot(dia$carat, dia$price, main = "Diamonds", col = dia$color)
grid()

dev.new()
qplot(carat, price, data = dia, main ="Diamonds", color = color) + facet_wrap(~ cut)

dev.new()
xyplot(price ~ carat | factor(cut), data = dia, group = color, main = "Diamonds", type = c("p", "g"))


}