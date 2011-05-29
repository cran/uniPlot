pal <-
function(col) 
	{
          ## similar to 'pal' from p.1. in vignette hcl-colors
		n <- length(col) 
		barplot(rep(1, n), xlab = "", ylab = "", axes = FALSE, col = col, border = col)
	}

