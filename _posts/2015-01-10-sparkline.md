---
yamlFileName: 2015-01-10-sparkline.Rmd # WARNING: update the filename?
# print(rmarkdown::metadata$yamlFileName) # permalink
# library(knitr)
# setwd("~/git/ttmmghmm.github.io/_posts") ; fn <- "2015-01-10-sparkline.Rmd" ; knit(fn)  # to get the .md file 
#
# library(knitrBootstrap)
# rmarkdown::render(fn, knitrBootstrap::bootstrap_document(), clean = FALSE) # no md?
# produce an identical result to Knit HTML in RStudio- no run-time dependency on RStudio
# https://github.com/jimhester/knitrBootstrap#bootstrap-themes
#   knit(fn) ; browseURL(sub("Rmd$", "html", fn))
# pandoc(fn, format = "docx") # prodces the .docx file - Word doc.
# rmarkdown::render(fn) # produces table of contents (and html?)
# rmarkdown::render(fn, pdf_document()) # and knit2html() to get .html from .md
title: "sparkline"
#
# like categories, tags can be specified as a YAML list or a space- separated string.
# http://en.wikipedia.org/wiki/YAML#Lists
type: posts
layout: post
tags:
- R
- sparkline plot
categories: rstats sparkline
output:
  # https://github.com/jimhester/knitrBootstrap
  # http://cran.r-project.org/web/packages/knitrBootstrap/README.html
  # ::bootstrap_document custom rendering function for the Rmarkdown package.
  knitrBootstrap::bootstrap_document: #  to create bootstrap styled HTML reports - not .md
    # https://github.com/jimhester/knitrBootstrap#package-options
    # title: "where does this appear? # (NULL) Set the title for the html document
    # http://bootswatch.com/ optionally including a dynamic style switch.
    theme: cerulean # Cyborg # monokai cyborg slate darkly superhero cerulean 
    theme.chooser: TRUE # (FALSE) - Add a bootstrap style chooser to the page.
    # highlight Set the default code style. (HighlightJS)
    # https://github.com/jimhester/knitrBootstrap#highlight-themes
    highlight: Zenburn # monokai # Sunburst # Zenburn # HighlightJs # google code 
    highlight.chooser: TRUE # (FALSE) - Add a code style chooser to the page.
    menu: TRUE # FALSE # Whether to include the bottom navbar.
author: ttmmghmm
---



# Change the default global options
https://github.com/jimhester/knitrBootstrap#chunk-options




<!-- setup vignette boiler plate
NB: Do not add yaml code here, put it at the start of the top level Rmd -->

*(This blog was produced on: 2015-01-31.)*  




<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->






# Sparklines
* https://github.com/htmlwidgets/sparkline
* http://www.htmlwidgets.org/develop_intro.html


```r
library(devtools)
install_github('htmlwidgets/sparkline')
```

http://stats.grok.se retrieves Wikipedia page access statistics on a daily basis. 
The information is either presented in HTML or provided as JSON data.

The API is pretty simple

```r
x = rnorm(20)
library(sparkline)
sparkline(x)
```

<!--html_preserve--><span id="htmlwidget-6856" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-6856">{ "x": {
 "values": [ 0.6919652329250042, -0.4718802799430417, -1.774519615387741, -0.6375325849479716, 0.5219317104953515, 0.794434457589652, 0.3208079327542113, 1.197174226863785, -0.9568099585471216, 0.07624716077313738, 0.7964121024705162, 0.7940382977777728, 0.6731618881748075, 0.8605139223323282, -1.517505529192479, 1.075583448527095, -0.5265482636901841, 0.1190512741654871, -1.699601925525043, -0.8151332706980016 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->

```r
sparkline(x, type = 'bar')
```

<!--html_preserve--><span id="htmlwidget-5685" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-5685">{ "x": {
 "values": [ 0.6919652329250042, -0.4718802799430417, -1.774519615387741, -0.6375325849479716, 0.5219317104953515, 0.794434457589652, 0.3208079327542113, 1.197174226863785, -0.9568099585471216, 0.07624716077313738, 0.7964121024705162, 0.7940382977777728, 0.6731618881748075, 0.8605139223323282, -1.517505529192479, 1.075583448527095, -0.5265482636901841, 0.1190512741654871, -1.699601925525043, -0.8151332706980016 ],
"options": {
 "type": "bar",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->

```r
sparkline(x, type = 'box')
```

<!--html_preserve--><span id="htmlwidget-5846" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-5846">{ "x": {
 "values": [ 0.6919652329250042, -0.4718802799430417, -1.774519615387741, -0.6375325849479716, 0.5219317104953515, 0.794434457589652, 0.3208079327542113, 1.197174226863785, -0.9568099585471216, 0.07624716077313738, 0.7964121024705162, 0.7940382977777728, 0.6731618881748075, 0.8605139223323282, -1.517505529192479, 1.075583448527095, -0.5265482636901841, 0.1190512741654871, -1.699601925525043, -0.8151332706980016 ],
"options": {
 "type": "box",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->
You can also use it in an R Markdown document.



```r
library(htmlwidgets)
set.seed(1234)
x = rnorm(10)
y = rnorm(10)
```





<!-- *** reproducibility *** 
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Reproducibility
This final 'boiler plate' section highlights how this vignette was created.

## To recreate this vignette

<!-- Additional semantic markup can be added to the citations themselves, such as the reason for the citation. -->

* `knitrBootstrap` (Hester, 2014)
  * 
* Running behind the scenes:  
    * `knitr` (Xie, 2014).
    * `rmarkdown` (Allaire, McPherson, Xie, Wickham, Cheng, and Allen, 2014).
    * From the bibtex information for select packages:
      * (Temple Lang, 2014).
    * <https://github.com/trinker/knitcitations>


```r
# TODO: parse permalink? varialble
print(rmarkdown::metadata$yamlFileName) # permalink
docName <- rmarkdown::metadata$yamlFileName

## Create the vignette
library('knitrBootstrap') 
knitrBootstrapFlag <- packageVersion('knitrBootstrap') < '1.0.0'
if(knitrBootstrapFlag) {
    ## CRAN version
    library('knitrBootstrap')
    cat("\n\n\tmetadata:title", rmarkdown::metadata$title, "\n\n")
    # TODO: stopifnot(file.exists(paste0(rmarkdown::metadata$title, ".Rmd")))
    print(system.time(knit_bootstrap(docName, chooser=c('boot', 'code'), show_code = TRUE)))
    # unlink('dots.md') # why remove .md file and in yaml?
} else {
    ## GitHub version
    library('rmarkdown')
    print(system.time(render(docName)))
}
unlink('citations.bib')
## Note: if you prefer the knitr version use:
# library('rmarkdown')
# system.time(render(docName, 'html_document'))

## Extract the R code
library('knitr')
knit(docName, tangle = TRUE)

KnitPost <- function(input, base.url = "/") {
    require(knitr)
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, envir = parent.frame())
}
# TODO: insert the file name dynamically (both from _drafts and _posts?)
KnitPost(docName)
```

## YAML boiler plate

```r
str(rmarkdown::metadata) # https://github.com/rstudio/rmarkdown/issues/260
```

```
##  list()
```

## `R` information

### Session and packages

```
## Session info -----------------------------------------------------------------------------
```

```
##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  C                           
##  tz       <NA>
```

```
## Packages ---------------------------------------------------------------------------------
```

```
##  package       * version  date       source                                
##  RCurl         * 1.95-4.5 2014-12-28 CRAN (R 3.1.2)                        
##  RJSONIO       * 1.3-0    2014-07-28 CRAN (R 3.1.2)                        
##  Rcpp          * 0.11.3   2014-09-29 CRAN (R 3.1.2)                        
##  RefManageR    * 0.8.40   2014-10-29 CRAN (R 3.1.2)                        
##  XML           * 3.98-1.1 2013-06-20 CRAN (R 3.1.2)                        
##  bibtex        * 0.4.0    2014-12-31 CRAN (R 3.1.2)                        
##  bitops        * 1.0-6    2013-08-17 CRAN (R 3.1.2)                        
##  devtools        1.7.0    2015-01-17 CRAN (R 3.1.2)                        
##  digest        * 0.6.8    2014-12-31 CRAN (R 3.1.2)                        
##  evaluate      * 0.5.5    2014-04-29 CRAN (R 3.1.2)                        
##  formatR       * 1.0      2014-08-25 CRAN (R 3.1.2)                        
##  htmltools     * 0.2.6    2014-09-08 CRAN (R 3.1.2)                        
##  htmlwidgets     0.3.2    2014-12-09 CRAN (R 3.1.2)                        
##  httr          * 0.6.1    2015-01-01 CRAN (R 3.1.2)                        
##  knitcitations   1.0.5    2014-11-26 CRAN (R 3.1.2)                        
##  knitr           1.8.15   2015-01-11 local                                 
##  lubridate     * 1.3.3    2013-12-31 CRAN (R 3.1.2)                        
##  magrittr        1.5      2014-11-22 CRAN (R 3.1.2)                        
##  memoise       * 0.2.1    2014-04-22 CRAN (R 3.1.2)                        
##  plyr          * 1.8.1    2014-02-26 CRAN (R 3.1.2)                        
##  rmarkdown     * 0.4.2    2015-01-11 Github (rstudio/rmarkdown@514d134)    
##  rstudioapi    * 0.2      2014-12-31 CRAN (R 3.1.2)                        
##  sparkline       1.0      2015-01-10 Github (htmlwidgets/sparkline@aefe3a1)
##  stringr       * 0.6.2    2012-12-06 CRAN (R 3.1.2)                        
##  yaml          * 2.1.13   2014-06-12 CRAN (R 3.1.2)
```

### Runtime 

Vignette generated in 3 seconds.   
<p>Timestamp 2015-01-31 22:55:26. <!-- Date the vignette was generated -->

<!-- *** Bibliography END ***
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Bibliography

Citations made with `knitcitations` (Boettiger, 2014).



```
## Error in BibOptions(.opts): Invalid name specified, see ?BibOptions
```

[1] J. Allaire, J. McPherson, Y. Xie, et al. _rmarkdown: Dynamic Documents for
R_. R package version 0.4.2. 2014. <URL: http://rmarkdown.rstudio.com>.

[2] C. Boettiger. _knitcitations: Citations for knitr markdown files_. R package
version 1.0.5. 2014. <URL: http://CRAN.R-project.org/package=knitcitations>.

[3] J. Hester. _knitrBootstrap: Knitr Bootstrap framework._ R package version
1.0.0. 2014. <URL: https://github.com/jimhester/>.

[4] D. Temple Lang. _RCurl: General network (HTTP/FTP/...) client interface for
R_. R package version 1.95-4.5. 2014. <URL:
http://CRAN.R-project.org/package=RCurl>.

[5] Y. Xie. "knitr: A Comprehensive Tool for Reproducible Research in R". In:
_Implementing Reproducible Computational Research_. Ed. by V. Stodden, F. Leisch
and R. D. Peng. ISBN 978-1466561595. Chapman and Hall/CRC, 2014. <URL:
http://www.crcpress.com/product/isbn/9781466561595>.
# generate the parentetical citation for these:
 citep(list(knitr,knitcitations))


