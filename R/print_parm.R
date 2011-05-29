print_parm <-
function(type = NULL, value = FALSE)
  {
    ## type <:> can be NULL or graphics, ggplot2, lattice
    ## value <:> logical, should values of parameter be printed or not
    
    if (is.null(type))
      {
        vec <- c("graphics", "ggplot2", "lattice")
      }else{
        vec <- type
      }
      
      
      if (value)
      {
      	sapply(vec, function(x) (eval(parse(text = paste(x, "_parm", sep = "")))))
      }else{
      	sapply(vec, function(x) names(eval(parse(text = paste(x, "_parm", sep = "")))))

      }
  }

