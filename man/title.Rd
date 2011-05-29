\name{title}
\alias{title}
\title{Adding Annotations}
\description{Creates titles and other annotations in a plot. It is more flexible than \code{\link[graphics]{title}} of package graphics and substitutes it.}

\usage{
title(main = "", sub = "", xlab = "", ylab = "", line.main = graphics_parm$line.main, adj.main = graphics_parm$adj.main, cex.main = graphics_parm$cex.main, font.main = graphics_parm$font.main, col.main = graphics_parm$col.main, line.sub = graphics_parm$line.sub, adj.sub = graphics_parm$adj.sub, cex.sub = graphics_parm$cex.sub, font.sub = graphics_parm$font.sub, col.sub = graphics_parm$col.sub, line.xlab = graphics_parm$line.xlab, adj.xlab = graphics_parm$adj.xlab, cex.xlab = graphics_parm$cex.xlab, font.xlab = graphics_parm$font.xlab, col.xlab = graphics_parm$col.xlab, line.ylab = graphics_parm$line.ylab, adj.ylab = graphics_parm$adj.ylab, cex.ylab = graphics_parm$cex.ylab, font.ylab = graphics_parm$font.ylab, col.ylab = graphics_parm$col.ylab, ...)
}
\arguments{
  \item{main}{Main title as character}
  \item{sub}{Sub title as character}
  \item{xlab}{Title X-axis as character}
  \item{ylab}{Title Y-axis as character}
  \item{line.main}{Line main title}
  \item{adj.main}{Adjustment main title}
  \item{cex.main}{Size main title}
  \item{font.main}{Font main title}
  \item{col.main}{Colour main title}
  \item{line.sub}{Line sub title}
  \item{adj.sub}{Adjustment sub title}
  \item{cex.sub}{Size sub title}
  \item{font.sub}{Font sub title}
  \item{col.sub}{Colour sub title}
  \item{line.xlab}{Line xlab title}
  \item{adj.xlab}{Adjustment xlab title}
  \item{cex.xlab}{Size xlab title}
  \item{font.xlab}{Font xlab title}
  \item{col.xlab}{Colour xlab title}  
  \item{line.ylab}{Line ylab title}
  \item{adj.ylab}{Adjustment ylab title}
  \item{cex.ylab}{Size ylab title}
  \item{font.ylab}{Font ylab title}
  \item{col.ylab}{Colour ylab title}  
  \item{\dots}{arguments of \code{mtext}}
}
\details{For arguments starting with line, font, adj, cex or col see \code{\link{par}}. \code{title} is usually used within \code{plot.default}.}

\author{Sina Rueeger \email{sina.rueeger@gmail.com}
}

\seealso{\code{\link[graphics]{title}}}

\examples{
uniPlot()
plot(rnorm(100), rnorm(100))
title(main = "rnorm(100)", sub = "Demonstrating Purpose")
}
