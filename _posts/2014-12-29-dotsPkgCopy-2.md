---
output:
  knitrBootstrap::bootstrap_document:
    theme.chooser: TRUE
    highlight.chooser: TRUE
  html_document:
    toc: true
    theme: united
---

<!--
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{Introduction to dots}
-->

Introduction to `dots`
==================

If you wish, you can view this vignette online [here](http://lcolladotor.github.io/dots/).





# Overview


`dots` <code class="knitr inline"><a id='cite-dots'></a>(<a href='https://github.com/lcolladotor/dots'>Collado-Torres, 2014</a>)</code> is a simple package that helps you simplify your function definitions by using the `...` arguments. This reduces the complexity a new user of your package will face when reading its documentation. At the same time, `dots` allows you to define advanced arguments which you can then define inside your functions. Experienced users will be able to use them thus controlling those fine parameters most users do not need.


## dots()

The main function in this package is `dots()`.  It will look inside `...` to see if `name` has been used. If it has, it will return its value. Otherwise, it returns a default `value`.

<div class="chunk" id="library"><div class="rcode"><div class="source"><pre class="knitr r">## Load the library
library('dots')
</pre></div>
</div></div>


<div class="chunk" id="dotsCode"><div class="rcode"><div class="source"><pre class="knitr r">## Explore code
## Alias: advanced...()
dots
</pre></div>
<div class="output"><pre class="knitr r">## function (name, value, ...) 
## {
##     args <- list(...)
##     if (!name %in% names(args)) {
##         return(value)
##     }
##     else {
##         return(args[[name]])
##     }
## }
## <environment: namespace:dots>
</pre></div>
</div></div>

The idea of this fairly simple function is to use it inside your functions to define advanced arguments and give them default values.


The following example defines `myFun()` which needs the argument `x` to work. Inside `myFun()`, `dots()` is used to define the advanced argument `verbose` which the developer of `myFun()` thinks users will rarely want to use. This developer still wants to give users the flexibility to control this argument but doesn't want to confuse the majority of its users with a huge argument list. 

<div class="chunk" id="dotsExample"><div class="rcode"><div class="source"><pre class="knitr r">myFun <- function(x, ...) {
    ## In all the cases, the user has to specify 'x' for this function to work
    
    ## However, only a few users will want to make the function print status
    ## reports (controlled by the 'verbose' argument)
    
    #' @param verbose Controls whether to print status reports or not.
    #' Use value from global 'verbose' option if available. Otherwise, use 
    #' \code{FALSE}
    verbose <- dots('verbose', getOption('verbose', FALSE), ...)
    if(verbose)
        message(paste(Sys.time(), 'myFun: performing analysis'))
    
    ## In this case, it's just a simple example, so lets return the identify value
    return(identity(x))
}

## Lets use it now
myFun(1:10)
</pre></div>
<div class="output"><pre class="knitr r">##  [1]  1  2  3  4  5  6  7  8  9 10
</pre></div>
<div class="source"><pre class="knitr r">## Experienced user wants to print status reports
myFun(1:10, verbose = TRUE)
</pre></div>
<div class="message"><pre class="knitr r">## 2014-12-29 22:08:31 myFun: performing analysis
</pre></div>
<div class="output"><pre class="knitr r">##  [1]  1  2  3  4  5  6  7  8  9 10
</pre></div>
</div></div>

Ok, this is an example and there are really only two arguments but in practice things can get complicated fast. As a developer, soon you might find yourself with functions that have 10 or more arguments and need to cut the list down to promote friendliness and usability of your code.


Note that if you are using the same advanced argument inside several functions, you might want to consider using the function `getOption()`. It's useful for users who want to set global options and don't want to specify them for every single function call.

We highly recommend documenting any advanced arguments using [roxygen2](http://cran.r-project.org/web/packages/roxygen2/index.html) tags inside the source code so experienced users can understand the code. We also recommend explaining these advanced arguments in your package vignette at the section targeting advanced users.

That is, we expect experienced users to be able to dig into either the source code and/or find the appropriate docs section. As a package developer you have to give them a place to find such documentation.

## formal_call()

Once you start using the `...` argument, you will soon find use cases where you are using  `...` for several functions, but then some of them might complain when `...` contains an argument they don't use. In such scenarios you will want to run the function using some key arguments, remaining arguments from `...` that the function was defined to use, and drop the unwanted arguments in `...`.

That's where `formal_call()` comes into play.

<div class="chunk" id="formalCallCode"><div class="rcode"><div class="source"><pre class="knitr r">## Explore source
## Alias: formalCall()
formal_call
</pre></div>
<div class="output"><pre class="knitr r">## function (fun, ...) 
## {
##     formal <- formalArgs(fun)
##     args <- list(...)
##     use <- dots("formalCallUse", NULL, ...)
##     if (!is.null(use)) {
##         stopifnot(is.list(use))
##         stopifnot(!is.null(names(use)))
##         args <- args[!names(args) %in% names(use)]
##         input <- use
##     }
##     else {
##         input <- NULL
##     }
##     input <- c(input, args[names(args) %in% formal])
##     result <- do.call(fun, input)
##     return(result)
## }
## <environment: namespace:dots>
</pre></div>
</div></div>

### Basic example

The following example shows how you can use `formal_call()` inside your functions. First, lets try a simple function that will return the identity of the maximum value of a vector `x`.

<div class="chunk" id="formalCodeExample"><div class="rcode"><div class="source"><pre class="knitr r">myFunBroken <- function(x, ...) {
    identity(max(x, ...), ...)
}

## Test without using ...
myFunBroken(1:10)
</pre></div>
<div class="output"><pre class="knitr r">## [1] 10
</pre></div>
</div></div>

That worked because we are not using the `...` argument. However, as is the code will break when using `...` because `identity()` does not have have other arguments defined.

<div class="chunk" id="formalBroken"><div class="rcode"><div class="source"><pre class="knitr r">## Breaks when you use ...
myFunBroken(1:10, 11:20)
</pre></div>
</div></div>

We can fix the broken code by using `formal_call()` as shown below.

<div class="chunk" id="formalFixed"><div class="rcode"><div class="source"><pre class="knitr r">## Fix code using formal_call()
myFunFixed <- function(x, ...) {
    formal_call(identity, x = max(x, ...), ...)
}

## Check that we are getting the same value as before
identical(myFunBroken(1:10), myFunFixed(1:10))
</pre></div>
<div class="output"><pre class="knitr r">## [1] TRUE
</pre></div>
<div class="source"><pre class="knitr r">## Doesn't break when you use ...
myFunFixed(1:10, 11:20)
</pre></div>
<div class="output"><pre class="knitr r">## [1] 20
</pre></div>
</div></div>

In this particular example, you could dodge the problem by using `identity(x)` instead of `identity(x, ...)`. However, the illustrative use of `formal_call()` remains and there are more complicated cases where you will need to use it.

### Complex example

In the following example we want a function that does things with `...` (in this case, it defines the `verbose` argument) and then pass it to `plot()`. Simply using `dots()` is not enough as `plot()` will complain that `verbose` is not a graphical parameter.

<div class="chunk" id="funkyPlot"><div class="rcode"><div class="source"><pre class="knitr r">## A more complicated example
funkyPlot <- function(x, y, ...) {
    verbose <- dots('verbose', getOption('verbose', FALSE), ...)
    if(verbose)
        message(paste(Sys.time(), 'funkyPlot: getting ready to roll'))
    plot(x, y, ...)
}

## funkyPlot() doesn't work
tryCatch(funkyPlot(1:10, 10:1, verbose = TRUE, xlab = 'Data (units)'), warning = function(w) { print(w) })
</pre></div>
<div class="message"><pre class="knitr r">## 2014-12-29 22:08:31 funkyPlot: getting ready to roll
</pre></div>
<div class="rimage default"><img src="figure/funkyPlot-1.png" title="plot of chunk funkyPlot" alt="plot of chunk funkyPlot" class="plot" /></div>
<div class="output"><pre class="knitr r">## <simpleWarning in plot.window(...): "verbose" is not a graphical parameter>
</pre></div>
</div></div>

There are many graphical parameters, but they are not part of the formal definition of `plot()`. We can solve this by using the advanced argument `formalCallUse` which specifies arguments we still want to use even if they are not part of the formal definition.

Below we do so only for the `xlab` graphical parameter.


<div class="chunk" id="funkyPlot2"><div class="rcode"><div class="source"><pre class="knitr r">## Use 'xlab'
funkyPlot2 <- function(x, y, ...) {
    verbose <- dots('verbose', getOption('verbose', FALSE), ...)
    if(verbose)
        message(paste(Sys.time(), 'funkyPlot: getting ready to roll'))
    xlab <- dots('xlab', '', ...)
    formal_call(plot, x = x, y = y, ..., formalCallUse = list(xlab = xlab))
}

## Works now =)
funkyPlot2(1:10, 10:1, verbose = TRUE, xlab = 'Data (units)')
</pre></div>
<div class="message"><pre class="knitr r">## 2014-12-29 22:08:31 funkyPlot: getting ready to roll
</pre></div>
<div class="rimage default"><img src="figure/funkyPlot2-1.png" title="plot of chunk funkyPlot2" alt="plot of chunk funkyPlot2" class="plot" /></div>
<div class="output"><pre class="knitr r">## NULL
</pre></div>
</div></div>

If you have a small number of advanced arguments you want users to be able to use, this approach will work. But in the case of `plot()` there are tons of graphical parameters that we want users to be able to use. 

If you knew for certain that the other functions inside yours only use a small number of arguments passed through `...` (`verbose` in our example), you can eliminate them from `...` yourself and pass them to `formalCallUse`.

<div class="chunk" id="funkyPlot3"><div class="rcode"><div class="source"><pre class="knitr r">## If we knew for sure that we only want to exclude 'verbose' from ... before
## calling plot() we can do so this way.
funkyPlot3 <- function(x, y, ...) {
    verbose <- dots('verbose', getOption('verbose', FALSE), ...)
    if(verbose)
        message(paste(Sys.time(), 'funkyPlot: getting ready to roll'))
    
    ## Drop 'verbose' from ...
    use <- list(...)
    use <- use[!names(use) == 'verbose']
    
    ## Call plot. Note that we are not passing ... anymore.
    formal_call(plot, x = x, y = y, formalCallUse = use)
}

## Works with more graphical parameters
funkyPlot3(1:10, 10:1, verbose = TRUE, xlab = 'Data (units)', ylab = 'Success', main = 'Complicated example')
</pre></div>
<div class="message"><pre class="knitr r">## 2014-12-29 22:08:31 funkyPlot: getting ready to roll
</pre></div>
<div class="rimage default"><img src="figure/funkyPlot3-1.png" title="plot of chunk funkyPlot3" alt="plot of chunk funkyPlot3" class="plot" /></div>
<div class="output"><pre class="knitr r">## NULL
</pre></div>
</div></div>

So for these very complicated use cases, `formalCallUse` can help you when you either want to make sure you are supplying a small set of arguments or if you have a small set you want to exclude.

Cases where there are many arguments to either exclude or supply are nasty either way.

# Learn more

If you want to check other examples using `dots()`, check the functions `last()` and `recursive_last()`.

You can also see how these functions are used in packages such as `derfinder`: [Biconductor page](http://www.bioconductor.org/packages/release/bioc/html/derfinder.html), [GitHub code](https://github.com/lcolladotor/derfinder).



# Reproducibility

Code for creating the vignette

<div class="chunk" id="createVignette"><div class="rcode"><div class="source"><pre class="knitr r">## Create the vignette
library('knitrBootstrap') 

knitrBootstrapFlag <- packageVersion('knitrBootstrap') < '1.0.0'
if(knitrBootstrapFlag) {
    ## CRAN version
    library('knitrBootstrap')
    system.time(knit_bootstrap('dots.Rmd', chooser=c('boot', 'code'), show_code = TRUE))
    unlink('dots.md')
} else {
    ## GitHub version
    library('rmarkdown')
    system.time(render('dots.Rmd'))
}
unlink('dotsRef.bib')
## Note: if you prefer the knitr version use:
# library('rmarkdown')
# system.time(render('dots.Rmd', 'html_document'))

## Extract the R code
library('knitr')
knit('dots.Rmd', tangle = TRUE)
</pre></div>
</div></div>

Date the vignette was generated.

<div class="chunk" id="reproducibility1"><div class="rcode"><div class="output"><pre class="knitr r">## [1] "2014-12-29 22:08:31 UTC"
</pre></div>
</div></div>

Wallclock time spent generating the vignette.

<div class="chunk" id="reproducibility2"><div class="rcode"><div class="output"><pre class="knitr r">## Time difference of 0.637 secs
</pre></div>
</div></div>

`R` session information.

<div class="chunk" id="reproducibility3"><div class="rcode"><div class="message"><pre class="knitr r">## Session info-----------------------------------------------------------------------------
</pre></div>
<div class="output"><pre class="knitr r">##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, linux-gnu           
##  ui       RStudio (0.98.1091)         
##  language (EN)                        
##  collate  C                           
##  tz       <NA>
</pre></div>
<div class="message"><pre class="knitr r">## Packages---------------------------------------------------------------------------------
</pre></div>
<div class="output"><pre class="knitr r">##  package        * version  date       source                           
##  RCurl            1.95.4.5 2014-12-20 CRAN (R 3.1.2)                   
##  RJSONIO          1.3.0    2014-07-28 CRAN (R 3.1.2)                   
##  Rcpp             0.11.3   2014-09-29 CRAN (R 3.1.2)                   
##  RefManageR       0.8.40   2014-10-29 CRAN (R 3.1.2)                   
##  XML              3.98.1.1 2013-06-20 CRAN (R 3.1.2)                   
##  bibtex           0.3.6    2013-07-29 CRAN (R 3.1.2)                   
##  bitops           1.0.6    2013-08-17 CRAN (R 3.1.2)                   
##  devtools       * 1.6.1    2014-10-07 CRAN (R 3.1.2)                   
##  digest           0.6.7    2014-12-20 CRAN (R 3.1.2)                   
##  dots           * 1.0.0    2014-12-29 Github (lcolladotor/dots@a933540)
##  evaluate         0.5.5    2014-04-29 CRAN (R 3.1.2)                   
##  formatR          1.0      2014-08-25 CRAN (R 3.1.2)                   
##  htmltools        0.2.6    2014-09-08 CRAN (R 3.1.2)                   
##  httr             0.6.0    2014-12-13 CRAN (R 3.1.2)                   
##  knitcitations  * 1.0.5    2014-11-26 CRAN (R 3.1.2)                   
##  knitr          * 1.8      2014-11-11 CRAN (R 3.1.2)                   
##  knitrBootstrap * 0.9.0    2013-10-17 CRAN (R 3.1.2)                   
##  lubridate        1.3.3    2013-12-31 CRAN (R 3.1.2)                   
##  markdown         0.7.4    2014-08-24 CRAN (R 3.1.2)                   
##  memoise          0.2.1    2014-04-22 CRAN (R 3.1.2)                   
##  plyr             1.8.1    2014-02-26 CRAN (R 3.1.2)                   
##  rmarkdown      * 0.4.2    2014-12-22 CRAN (R 3.1.2)                   
##  rstudioapi       0.1      2014-03-27 CRAN (R 3.1.2)                   
##  stringr          0.6.2    2012-12-06 CRAN (R 3.1.2)                   
##  yaml             2.1.13   2014-06-12 CRAN (R 3.1.2)
</pre></div>
</div></div>

# Bibliography

This vignette was generated using `knitrBootstrap` <code class="knitr inline"><a id='cite-knitrBootstrap'></a>(<a href='http://CRAN.R-project.org/package=knitrBootstrap'>Hester, 2013</a>)</code>
with `knitr` <code class="knitr inline"><a id='cite-knitr'></a>(<a href='http://www.crcpress.com/product/isbn/9781466561595'>Xie, 2014</a>)</code> and `rmarkdown` <code class="knitr inline"><a id='cite-rmarkdown'></a>(<a href='http://CRAN.R-project.org/package=rmarkdown'>Allaire, McPherson, Xie, Wickham, et al., 2014</a>)</code> running behind the scenes.

Citations made with `knitcitations` <code class="knitr inline"><a id='cite-knitcitations'></a>(<a href='http://CRAN.R-project.org/package=knitcitations'>Boettiger, 2014</a>)</code>.

<p><a id='bib-rmarkdown'></a><a href="#cite-rmarkdown">[1]</a><cite>
J. Allaire, J. McPherson, Y. Xie, H. Wickham, et al.
<EM>rmarkdown: Dynamic Documents for R</EM>.
R package version 0.4.2.
2014.
URL: <a href="http://CRAN.R-project.org/package=rmarkdown">http://CRAN.R-project.org/package=rmarkdown</a>.</cite></p>

<p><a id='bib-knitcitations'></a><a href="#cite-knitcitations">[2]</a><cite>
C. Boettiger.
<EM>knitcitations: Citations for knitr markdown files</EM>.
R package version 1.0.5.
2014.
URL: <a href="http://CRAN.R-project.org/package=knitcitations">http://CRAN.R-project.org/package=knitcitations</a>.</cite></p>

<p><a id='bib-dots'></a><a href="#cite-dots">[3]</a><cite>
L. Collado-Torres.
<EM>dots: Simplifying function calls</EM>.
R package version 1.0.0.
2014.
URL: <a href="https://github.com/lcolladotor/dots">https://github.com/lcolladotor/dots</a>.</cite></p>

<p><a id='bib-knitrBootstrap'></a><a href="#cite-knitrBootstrap">[4]</a><cite>
J. Hester.
<EM>knitrBootstrap: Knitr Bootstrap framework.</EM>
R package version 0.9.0.
2013.
URL: <a href="http://CRAN.R-project.org/package=knitrBootstrap">http://CRAN.R-project.org/package=knitrBootstrap</a>.</cite></p>

<p><a id='bib-knitr'></a><a href="#cite-knitr">[5]</a><cite>
Y. Xie.
&ldquo;knitr: A Comprehensive Tool for Reproducible Research in R&rdquo;.
In: 
<EM>Implementing Reproducible Computational Research</EM>.
Ed. by V. Stodden, F. Leisch and R. D. Peng.
ISBN 978-1466561595.
Chapman and Hall/CRC, 2014.
URL: <a href="http://www.crcpress.com/product/isbn/9781466561595">http://www.crcpress.com/product/isbn/9781466561595</a>.</cite></p>

