par_uniPlot <-
function()
  {
    graphics::par(
                  ## adjustment
                  adj = graphics_parm$adj,

                  ## background
                  bg = graphics_parm$bg,

                  ## tick length
                  tcl = graphics_parm$tcl,

                  ## size
                  cex = graphics_parm$cex,
                  cex.axis = graphics_parm$cex.axis,

                  ## colour
                  col = graphics_parm$col, col.axis = graphics_parm$col.axis,

                  ## font
                  family = graphics_parm$family,
                  font = graphics_parm$font,

                  ## linetype
                  lty = graphics_parm$lty,
                  lwd = graphics_parm$lwd,

                  ## pointcharacter
                  pch = graphics_parm$pch,

                  ## point size of text
                  ps = graphics_parm$ps,

                  ## style of axis labels
                  las = 1)
    ## , pty = "s"
  }

