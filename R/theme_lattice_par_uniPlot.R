theme_lattice_par_uniPlot <-
function()
        {
          changes <- list(

                          ## axis ticks / text / line
                          ## ----------
                          axis.components = list(left = list(tck = lattice_parm$axis.components.tck * (-1)), right = list(tck = lattice_parm$axis.components.tck * (-1)), bottom = list(tck = lattice_parm$axis.components.tck * (-1)), top = list(tck = lattice_parm$axis.components.tck * (-1))),
                          axis.text = list(cex = lattice_parm$axis.text.cex, col = lattice_parm$axis.text.col),
                          axis.line = list(col = lattice_parm$axis.line.col, lty = 1, lwd = 1),

                          ## annotations title xlab, ylab, zlab, sub, main
                          ## ----------
                          par.xlab.text = list(cex = lattice_parm$par.xlab.text.cex, col = lattice_parm$par.xlab.text.col, font = lattice_parm$par.xlab.text.font),
                          par.ylab.text = list(cex = lattice_parm$par.ylab.text.cex, col = lattice_parm$par.ylab.text.col, font = lattice_parm$par.ylab.text.font),
                          par.main.text = list(cex = lattice_parm$par.main.text.cex, col = lattice_parm$par.main.text.col, font = lattice_parm$par.main.text.font),
                          par.zlab.text = list(cex = lattice_parm$par.zlab.text.cex, col =lattice_parm$ par.zlab.text.col, font = lattice_parm$par.zlab.text.font),
                          par.sub.text = list(cex = lattice_parm$par.sub.text.cex, col = lattice_parm$par.sub.text.col, font = lattice_parm$par.sub.text.font),
                          
                          ## boxplot dot / umbrella / rectangle
                          ## ----------
                          box.dot = list(col = lattice_parm$box.dot.col, pch = lattice_parm$box.dot.pch), 
                          box.umbrella = list(col = lattice_parm$ box.umbrella.col, lty = lattice_parm$box.umbrella.lty, lwd = lattice_parm$box.umbrella.lwd), 
                          box.rectangle = list(col = lattice_parm$box.rectangle.col, lty = lattice_parm$box.rectangle.lty, lwd = lattice_parm$box.rectangle.lwd),

                          ## add line / text
                          ## ----------
                          add.line = list(col = lattice_parm$add.line.col, lty = lattice_parm$add.line.lty, lwd = lattice_parm$add.line.lwd),
                          add.text = list(col = lattice_parm$add.text.col, lineheight = 0.8, cex = 0.8),
                          ## dot symbol / line
                          ## ----------
                          dot.symbol = list(cex = lattice_parm$dot.symbol.cex, pch = lattice_parm$dot.symbol.pch, col = lattice_parm$dot.symbol.col),
                          dot.line = list(col = lattice_parm$dot.line.col, lty = lattice_parm$dot.line.lty, lwd = lattice_parm$dot.line.lwd),

                          ## plot symbol / line / polygon
                          ## -------
                          plot.symbol = list(col = lattice_parm$plot.symbol.col, pch = lattice_parm$plot.symbol.pch, cex = lattice_parm$plot.symbol.cex), 
                          plot.line = list(col = lattice_parm$plot.line.col, lty = lattice_parm$plot.line.lty, lwd = lattice_parm$plot.line.lwd),
                          plot.polygon = list(col = gray(0.2), border = "white", lty = lattice_parm$plot.polygon.lty, lwd = lattice_parm$plot.polygon.lwd),

                          ## superpose symbol / line / polygon
                          ## ----------
                          superpose.polygon = list(border = NA, col = palette()[-1], lty = lattice_parm$superpose.polygon.lty, lwd = lattice_parm$superpose.polygon.lwd),
                          superpose.symbol = list(cex = ggplot2_parm$superpose.symbol.cex, col = palette()[-1], pch = lattice_parm$superpose.symbol.pch),
                          superpose.background = list(col = palette()[-1]),
                          superpose.line = list(col = palette()[-1], lty = lattice_parm$superpose.line.lty, lwd = lattice_parm$superpose.line.lwd), 

                          ## strip
                          ## -------

                          strip.background = list(col = lattice_parm$strip.background.col),
                          strip.border = list(col = lattice_parm$strip.border.col),
                          strip.shingle = list(col = lattice_parm$strip.shingle.col),
                          ## reference line
                          ## -------
                          reference.line = list(col = lattice_parm$reference.line.col, lwd = lattice_parm$reference.line.lwd, lty = lattice_parm$reference.line.lty),

                          ## background
                          ## -------
                          panel.background = list(col = lattice_parm$panel.background.col))
          
          trellis.par.set(changes)
        }

