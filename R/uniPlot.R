uniPlot <-
function(type = "uniPlot",
                    graphics = NULL,
                    ggplot2 = NULL,
                    lattice = NULL,
                    show.col = FALSE
)
{
  ## //////////////
  ## Function to uniform and customize graphical displays of R packages graphics, ggplot2 and lattice.
  ## //////////////

  ## Arguments for uniPlot()
  ## //////////////
  ## type <:> character, "uniPlot" or "before", if before all settings are resetted
  ## graphics <:> NULL or a list, list contains possible settings for par, these settings are stored in object graphics_parm which can be printed with the function print_parm().
  ## ggplot2 <:> NULL or a list, list contains possible settings for theme_set, these settings are stored in object ggplot2_parm which can be printed with the function print_parm().
  ## lattice <:> NULL or a list, list contains possible settings for trellis.par.set, these settings are stored in object lattice_parm which can be printed with the function print_parm().
  ## col.base <:> character, refers to the color palette, not implemented yet.
  ## show.col  <:> locical, if TRUE, color palette is shown.
  
                      
  ## 0) BUILD ENVIRONMENT
  ## build environment uniPlot.parm, if not builded yet (means that uniPlot() is executed the 1st time)
  ## //////////////////////
  if (!("uniPlot.parm" %in% search()))
  attach(what = NULL, name = "uniPlot.parm")

  ## 1) STORE EXISTING SETTINGS
  ## save all existing settings of graphics (par, palette), ggplot2 (theme_get), lattice (trellis.par.get) in environment uniPlot.parm >> only if uniPlot is executed the 1st time.
  ## //////////////////////

  ## graphics (palette)
  if (!exists("col_default", envir = as.environment("uniPlot.parm"), inherits = FALSE))
    {
      col_default <- palette()
      assign("col_default", col_default, envir = as.environment("uniPlot.parm"))
    }
  
  ## graphics (par)
  if (!exists("graphics_parm_default", envir = as.environment("uniPlot.parm"), inherits = FALSE))
    {
      graphics_parm_default <- par(no.readonly = TRUE) 
      assign("graphics_parm_default", graphics_parm_default, envir = as.environment("uniPlot.parm"))
    }

  ## ggplot2
  if (!exists("ggplot2_parm_default", envir = as.environment("uniPlot.parm"), inherits = FALSE))
    {
      ggplot2_parm_default <- theme_get()
      assign("ggplot2_parm_default", ggplot2_parm_default, envir = as.environment("uniPlot.parm"))
    }

  ## lattice
  if (!exists("lattice_parm_default", envir = as.environment("uniPlot.parm"), inherits = FALSE))
    {
      lattice_parm_default <- trellis.par.get()
      assign("lattice_parm_default", lattice_parm_default, envir = as.environment("uniPlot.parm"))
    }

  ## 2) HANDLE SETTINGS
  ## //////////////////////

  ## check if a function was given to argument ggplot2 or lattice. if TRUE, set ggplot2 or lattice NULL
  ## ----------------------
  ggplot2_func <- ggplot2
  lattice_par_func <- lattice
  ggplot2 <- if(is.function(ggplot2))
    {
      NULL
    }else{
      ggplot2
    }
  
  lattice <- if(is.function(lattice))
    {
      NULL
    }else{
      lattice
    }
  
  ## initialize current settings
  ## ----------------------
  tmp <- init()

  ## add wishes of user to settings 
  ## ----------------------
  parm.uniPlot <- synchron(tmp, graphics.parm.new = graphics, ggplot2.parm.new = ggplot2, lattice.parm.new = lattice)

  ## store the 3 list - elements of parm.uniPlot in the enviroment uniPlot.parm
  ## ----------------------
  invisible(sapply(1:length(parm.uniPlot), function(x)
  {
    assign(names(parm.uniPlot)[x], parm.uniPlot[[x]], envir = as.environment("uniPlot.parm"))
  }))

  ## what is stored in uniPlot.parm?
  ## - existing settings of graphics, ggplot2 and lattice (e.g. called 'graphics_parm_default')
  ## - three parameter sets (e.g. called 'graphics_parm')


  ## 3) type == "uniPlot"
  ## //////////////////////

  ## >> some colours are choosen like in ggplot2 (e.g. colours of bars, colours of categorial variables)

  if (type == "uniPlot")
    {

      ## A-1) adjust package graphics
      ## -----------------------------------
      setDefaults(barplot.default, border = gray(0.2), col = gray(0.2))
      setDefaults(hist.default, border = gray(0.2), col = gray(0.2))
      setDefaults(grid, col = graphics_parm$reference.col, lwd = graphics_parm$reference.lwd, lty = graphics_parm$reference.lty)
      setDefaults(text.default, col = gray(0.2))
      setDefaults(axis, col.ticks = graphics_parm$col.axis.ticks)
      setDefaults(boxplot.default, pars = list(boxwex = 0.5, staplewex = 1, medlwd = 1, whisklty = 1,  whisklwd = 1))


      ## A-2) set colour palette >> has to be extended!! more colour palettes should be available!
      ## -----------------------------------
      col.pal <- c(gray(0.4), brewer.pal(5, "Set2")[c(2,1,3:5)])
      palette(col.pal)
  
      if (show.col){
        pal(palette())
      }
      
      ## if (col.base == "intense") col.pal <- c("black", brewer.pal(5, "Set1")[c(2,1,3:5)], gray(0.6))
      ## if (col.base == "default") col.pal <- col_default
      ## if (col.base == "gray") col.pal <- gray(seq(0,1,0.1))
  

      ## A-3) assign 'title' if necessary
      ## (when uniPlot() was once executed and then uniPlot(type = "before") and uniPlot() again).
      ## -----------------------------------
      ## ## VERSION I 
      ## if ("title_uniPlot" %in% ls("uniPlot.parm"))
      ##   {
      ##     title <- title_uniPlot
      ##     assignInNamespace("title", title, ns = "uniPlot")
      ##   }

      ## VERSION II
      if (!("title_graphics" %in% ls("uniPlot.parm")))
        {
          title_graphics <- graphics::title
          assignInNamespace("title", title, ns = "graphics")
          assign("title_graphics", title_graphics, envir = as.environment("uniPlot.parm"))
        }
      
      if ("title_uniPlot" %in% ls("uniPlot.parm"))
        {
          title <- title_uniPlot
          assignInNamespace("title", title, ns = "graphics")
        }
        
      ## A-4) setHook for par
      ## --------------------------------
  
      ## replace hook of before.plot.new
      setHook('before.plot.new', NULL, 'replace')
  
      ## sets hook by using the function par_uniPlot
      setHook('before.plot.new', par_uniPlot)


      ## B) set theme for ggplot2
      ## --------------------------------
      if (is.function(ggplot2_func)) # if ggplot2 theme given
        {
          theme_set(ggplot2_func)
        }else{                         
          theme_set(theme_uniPlot()) ## use function theme_uniPlot
        }

      update_geom_defaults("point", aes(shape = ggplot2_parm$point.shape))
 
      ## C) settings for lattice
      ## --------------------------------

      ## if lattice function is NOT given
      if (!is.function(lattice_par_func))
        {
          setHook('grid.newpage', NULL, 'replace')
          setHook('grid.newpage', theme_lattice_options_uniPlot)
          setHook('grid.newpage', theme_lattice_par_uniPlot)
          }
      
      ## if lattice function is given
      if (is.function(lattice_par_func))
        {
          setHook('grid.newpage', NULL, 'replace')
          setHook('grid.newpage', theme_lattice_options_uniPlot)
          setHook('grid.newpage', lattice_par_func)
          }
      
    } ## -- end type == "uniPlot"

  ## 4) type == "before"
  ## RESET everything, use "_default" settings stored in environment uniPlot.parm
  ## //////////////////////

  if (type == "before")
    {

      ## A-1) adjust package graphics
      ## -----------------------------------
      unsetDefaults(barplot.default, confirm=FALSE)
      unsetDefaults(hist.default, confirm=FALSE)
      unsetDefaults(grid, confirm=FALSE)
      unsetDefaults(text.default, confirm=FALSE)
      unsetDefaults(boxplot.default, confirm=FALSE)
      unsetDefaults(axis, confirm=FALSE)

      ## A-2) set colour palette
      ## -----------------------------------
      palette(col_default)
        if (show.col){
          pal(palette())
        }

      ## A-3) assign 'graphics::title' and store 'uniPlot::title' in uniPlot.parm (this way it can be used again)
      ## -----------------------------------
      title <- graphics::title
      title_uniPlot <- uniPlot::title
      assign("title_uniPlot", title_uniPlot, envir = as.environment("uniPlot.parm"))
      assignInNamespace("title", title, ns="uniPlot")

      
      ## A-4) reset hook of parm
      ## -----------------------------------
      graphics_parm_default_func <- function()
        {       
          par(graphics_parm_default)
        }
      
      setHook('before.plot.new', NULL, 'replace')
      setHook('before.plot.new', graphics_parm_default_func)
      
      ## B) reset theme of ggplot2
      ## -----------------------------------
      theme_set(ggplot2_parm_default)
      update_geom_defaults("point", aes(shape = 16))

      ## C) reset settings of lattice
      ## -----------------------------------
      trellis.par.set.f <- function()
      {
        trellis.par.set(lattice_parm_default)
      }

      trellis.options.set.f <- function()
        {
          lattice.options(default.args = list(as.table = FALSE))
        }
          
      setHook('grid.newpage', NULL, 'replace')
      setHook('grid.newpage', trellis.par.set.f)
      setHook('grid.newpage', trellis.options.set.f)

    } ## -- end of type == "before"

  
} ## -- end of uniPlot

