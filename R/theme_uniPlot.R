theme_uniPlot <-
function()
{
  structure(list(axis.line = theme_blank(),

                 ## axis text
                 ## ---------
                 axis.text.x = theme_text(family = ggplot2_parm$base_family, size = ggplot2_parm$axis.text.x.size * ggplot2_parm$base_size, lineheight = 0.9, vjust = 1, face = ggplot2_parm$axis.text.x.face, colour = ggplot2_parm$axis.text.x.colour),
                 axis.text.y = theme_text(family = ggplot2_parm$base_family, size = ggplot2_parm$axis.text.y.size * ggplot2_parm$base_size, lineheight = 0.9, hjust = 1, face = ggplot2_parm$axis.text.y.face, colour = ggplot2_parm$axis.text.y.colour),

                 ## ticks
                 ## ----------
                  axis.ticks = theme_segment(colour = ggplot2_parm$axis.ticks.colour, size = 0.2),
                 
                 ## axis lab
                 ## ----------
                 axis.title.x = theme_text2(family = ggplot2_parm$base_family, size = ggplot2_parm$axis.title.x.size * ggplot2_parm$base_size, vjust = 0.5, colour = ggplot2_parm$axis.title.x.colour, face = ggplot2_parm$axis.title.x.face),
                 axis.title.y = theme_text2(family = ggplot2_parm$base_family, size = ggplot2_parm$axis.title.y.size * ggplot2_parm$base_size, angle = 90, vjust = 0.5, colour = ggplot2_parm$axis.title.y.colour, face = ggplot2_parm$axis.text.y.face),
                 
                 ## axis ticks
                 ## -----------
                 axis.ticks.length = unit(ggplot2_parm$axis.ticks.length * (-1), "lines"), 
                 axis.ticks.margin = unit(0.5, "lines"), 
                 
                 ## legend
                 ## -------	
                 legend.background = theme_rect(colour = NA), 
                 legend.key = theme_rect(colour = NA), 
                 legend.key.size = unit(1.2, "lines"), 
                 legend.key.height = NA, 
                 legend.key.width = NA, 
                 legend.text = theme_text(family = ggplot2_parm$base_family, size =  ggplot2_parm$base_size * 0.8), 
                 legend.text.align = NA, 
                 legend.title = theme_text(family =  ggplot2_parm$base_family, size =  ggplot2_parm$base_size * 0.8, face = "bold", hjust = 0), 
                 legend.title.align = NA, 
                 legend.position = "right", 
                 legend.direction = "vertical", 
                 legend.box = NA,
                 legend.background = theme_rect(colour = NA), 
      
                 ## box 
                 ## -----
                 panel.border = theme_rect(fill = NA, colour = ggplot2_parm$panel.border.colour), 
  
                 ## reference line
                 ## -------
                 panel.background = theme_rect(fill = "white", colour = NA), 
                 panel.grid.major = theme_line(colour = ggplot2_parm$reference.major.colour, size = ggplot2_parm$reference.major.size, linetype = ggplot2_parm$reference.major.linetype),      
                  panel.grid.minor = theme_line(colour = NA, size = ggplot2_parm$reference.minor.size, linetype = ggplot2_parm$reference.minor.linetype),
                  panel.margin = unit(0.25, "lines"), 

                 ## background
                 ## ---------
                 plot.background = theme_rect(colour = ggplot2_parm$plot.background.colour),
                 
                  ## title
                  ## ---------
                  plot.title = theme_text2(size = ggplot2_parm$plot.title.size * ggplot2_parm$base_size, colour = ggplot2_parm$plot.title.colour, face = ggplot2_parm$plot.title.face),
                 
                  ## strips
                  ## ---------
                  strip.background = theme_rect(fill = ggplot2_parm$strip.background.fill[1], colour = ggplot2_parm$strip.background.colour[1]), 
                  strip.text.x = theme_text(colour = ggplot2_parm$strip.text.x.colour, size = ggplot2_parm$strip.text.x.size * ggplot2_parm$base_size), 
                  strip.text.y = theme_text(colour = ggplot2_parm$strip.text.y.colour, size = ggplot2_parm$strip.text.y.size * ggplot2_parm$base_size, angle = -90), 
  		                 
                  ## margin
                  ## -----------
                  plot.margin = unit(c(1,1,0.5,0.5), "lines")), 
             class = "options")
 }

