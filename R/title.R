title <-
function(main = "", sub = "", xlab = "", ylab = "" ,
                    line.main = graphics_parm$line.main, adj.main = graphics_parm$adj.main, cex.main = graphics_parm$cex.main, font.main = graphics_parm$font.main, col.main = graphics_parm$col.main,
                    line.sub = graphics_parm$line.sub, adj.sub = graphics_parm$adj.sub, cex.sub = graphics_parm$cex.sub, font.sub = graphics_parm$font.sub, col.sub = graphics_parm$col.sub,
                    line.xlab = graphics_parm$line.xlab, adj.xlab = graphics_parm$adj.xlab, cex.xlab = graphics_parm$cex.xlab, font.xlab = graphics_parm$font.xlab, col.xlab = graphics_parm$col.xlab,
                    line.ylab = graphics_parm$line.ylab, adj.ylab = graphics_parm$adj.ylab, cex.ylab = graphics_parm$cex.ylab, font.ylab = graphics_parm$font.ylab, col.ylab = graphics_parm$col.ylab, ...)
    {

      ## main text
      mtext(text = main, side = 3, line = line.main, adj = adj.main, cex = cex.main, font = font.main, col = col.main, ...)

      ## sub text
      mtext(text = sub, side = 3, line = line.sub, adj = adj.sub, cex = cex.sub, font = font.sub, col = col.sub, ...)

      ## xlab text
      mtext(text = xlab, side = 1, line = line.xlab, adj = adj.xlab, cex = cex.xlab, font = font.xlab, col = col.xlab, ...)

      ## ylab text
      mtext(text = ylab, side = 2, line = line.ylab, adj = adj.ylab, cex = cex.ylab, font = font.ylab, col = col.ylab, las = 0, ...)
    }

