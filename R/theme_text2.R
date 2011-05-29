theme_text2 <-
function (family = "", face = "plain", colour = "black", size = 10, 
    hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 1.1, just = c("centre", "centre")) 
{
  ## copied from theme_text
  ## added: JUST 
    vj <- vjust
    hj <- hjust
    angle <- angle%%360
    if (angle == 90) {
        xp <- vj
        yp <- hj
    }
    else if (angle == 180) {
        xp <- 1 - hj
        yp <- vj
    }
    else if (angle == 270) {
        xp <- vj
        yp <- 1 - hj
    }
    else {
        xp <- hj
        yp <- vj
    }
    structure(function(label, x = xp, y = yp, ..., vjust = vj, 
        hjust = hj, default.units = "npc") {
        textGrob(label, x, y, just = just, hjust = hjust, vjust = vjust, ..., 
            default.units = default.units, gp = gpar(fontsize = size, 
                col = colour, fontfamily = family, fontface = face, 
                lineheight = lineheight), rot = angle)
    }, class = "theme", type = "text", call = match.call())
}

