synchron <-
function(parm_object, graphics.parm.new, ggplot2.parm.new, lattice.parm.new)
  {
    ## parm_object <:> type init()
    ## graphics.parm.new / ggplot2.parm.new / lattice.parm.new <:> is a list or NULL
    graphics_parm <- parm_object$graphics_parm
    ggplot2_parm <- parm_object$ggplot2_parm
    lattice_parm <- parm_object$lattice_parm
    global_parm <- parm_object$global_parm


    ## warning 1: if not list and not NULL
    ## ---------------------------------------
    if ((!is.null(graphics.parm.new) & !is.list(graphics.parm.new)))
      {
    warning("Argument of graphics must be NULL or a list.")
  }

    if ((!is.null(ggplot2.parm.new) & !is.list(graphics.parm.new)))
      {
    warning("Arguments ggplot2 must be NULL or a list.")
  }

    if ((!is.null(lattice.parm.new) & !is.list(lattice.parm.new)))
      {
    warning("Arguments lattice must be NULL or a list.")
  }

    ## warning 2: if not valid argument name
    ## ---------------------------------------

    indg <- !(names(graphics.parm.new) %in% unlist(graphics_parm, use.names = FALSE))
    indgg <- !(names(ggplot2.parm.new) %in% unlist(ggplot2_parm, use.names = FALSE))
    indl <- !(names(lattice.parm.new) %in% unlist(lattice_parm, use.names = FALSE))


    if (sum(indg) > 0)
      {
         warning(paste("Argument", names(graphics.parm.new)[indg] ,"is not a valid name for graphics-list. Check object 'graphics_parm'."))
      }
    
    if (sum(indgg) > 0)
      {
         warning(paste("Argument", names(ggplot2.parm.new)[indgg] ,"is not a valid name for ggplot2-list. Check object 'ggplot2_parm'."))
      }

    if (sum(indl) > 0)
      {
         warning(paste("Argument", names(lattice.parm.new)[indl] ,"is not a valid name for lattice-list. Check object 'lattice_parm'."))
      }

 
    ## adjust global_parm by using new settings 
    ## ---------------------
    ## purpose: find position of value in global_parm which has to be replaced
    ## complicated because one setting can have several names (e.g. pch in

    ## if graphics.parm.new AND lattice.parm.new have a pch value, then the one of lattice is prefered (because of the order); no warning is given.
    
    ## graphics
    ## --------
    if (!is.null(graphics.parm.new))
      {
      idx <- rep(NA, length(graphics.parm.new))
      for (i in 1:length(graphics.parm.new))
        {
          ## check if the new graphics setting is in the settings list
          idx.temp <- grep(names(graphics.parm.new)[i], graphics_parm)

          ## if it is in more than one place (e.g. lty can be in lty or reference.lty) then check explicity with %in% 
          if (length(idx.temp) > 1)
              {
                idx.temp2 <- graphics_parm[idx.temp] %in% names(graphics.parm.new)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
        }
      
      global_parm[idx] <- graphics.parm.new
      }

    ## ggplot2
    ## --------
    if (!is.null(ggplot2.parm.new))
      {

      idx <- rep(NA, length(ggplot2.parm.new))
      for (i in 1:length(ggplot2.parm.new))
        {
          idx.temp <- grep(names(ggplot2.parm.new)[i], ggplot2_parm)
          if (length(idx.temp) > 1)
              {
                idx.temp2 <- ggplot2_parm[idx.temp] %in% names(ggplot2.parm.new)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
        }
      global_parm[idx] <- ggplot2.parm.new
      }

    ## lattice
    ## --------
    if (!is.null(lattice.parm.new))
      {
        idx <- rep(NA, length(lattice.parm.new))
      for (i in 1:length(lattice.parm.new))
        {
          idx.temp <- grep(names(lattice.parm.new)[i], lattice_parm)
          if (length(idx.temp) > 1)
              {
                idx.temp2 <- lattice_parm[idx.temp] %in% names(lattice.parm.new)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
        }
      global_parm[idx] <- lattice.parm.new
      }

    ## create a list for each: graphics, ggplot2, lattice
    ## and assign the correct value
    ## ------------------

    ## graphics
    ## --------

    ## make a list with only the content of graphics_parm (not with the names)
    graphics_parm_use <- as.list(unlist(graphics_parm, use.names = FALSE))
    names(graphics_parm_use) <- unlist(graphics_parm, use.names = FALSE)


    idx <- rep(NA, length(graphics_parm_use))
    for (i in 1:length(graphics_parm_use))
      {
        if (names(graphics_parm_use)[i] != "notDefined")
          {
            ## check if the new graphics setting is in the settings list
            idx.temp <- grep(names(graphics_parm_use)[i], graphics_parm)

            ## if it is in more than one place (e.g. lty can be in lty or reference.lty) then check explicity with %in% 
            if (length(idx.temp) > 1)
              {
                idx.temp2 <- graphics_parm[idx.temp] %in% names(graphics_parm_use)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
            graphics_parm_use[i] <- global_parm[idx[i]]
          }
      }

    ## ggplot2
    ## -------                                 
    ggplot2_parm_use <- as.list(unlist(ggplot2_parm, use.names = FALSE))
    names(ggplot2_parm_use) <- unlist(ggplot2_parm, use.names = FALSE)
    idx <- rep(NA, length(ggplot2_parm_use))
    for (i in 1:length(ggplot2_parm_use))
      {
        if (names(ggplot2_parm_use)[i] != "notDefined")
          {
            idx.temp <- grep(names(ggplot2_parm_use)[i], ggplot2_parm)
            ## legt fest, wie lange die
            if (length(idx.temp) > 1)
              {
                idx.temp2 <- ggplot2_parm[idx.temp] %in% names(ggplot2_parm_use)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
            ggplot2_parm_use[i] <- global_parm[idx[i]]
          }
      }
    
    ## lattice
    ## --------
    lattice_parm_use <- as.list(unlist(lattice_parm, use.names = FALSE))
    names(lattice_parm_use) <- unlist(lattice_parm, use.names = FALSE)
    idx <- rep(NA, length(lattice_parm_use))
    for (i in 1:length(lattice_parm_use))
      {
        if (names(lattice_parm_use)[i] != "notDefined")
          {
            idx.temp <- grep(names(lattice_parm_use)[i], lattice_parm)
            ## legt fest, wie lange die
            if (length(idx.temp) > 1)
              {
                idx.temp2 <- lattice_parm[idx.temp] %in% names(lattice_parm_use)[i]
                idx[i] <- idx.temp[idx.temp2]
              }else{
                idx[i] <- idx.temp
              }
            lattice_parm_use[i] <- global_parm[idx[i]]
          }
 
      }

    ## Delete all cases "notDefined"
    ## ------------------                                        
    graphics_parm_use <- graphics_parm_use[names(graphics_parm_use) != "notDefined"]
    ggplot2_parm_use <- ggplot2_parm_use[names(ggplot2_parm_use) != "notDefined"]
    lattice_parm_use <- lattice_parm_use[names(lattice_parm_use) != "notDefined"]
    
    ## return 3 lists
    ## --------------                                
    parm_uniPlot <- list(graphics_parm = graphics_parm_use, ggplot2_parm = ggplot2_parm_use, lattice_parm = lattice_parm_use)
    return(parm_uniPlot)
  }

