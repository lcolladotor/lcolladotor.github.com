---
yamlFileName: 2015-01-18-correlation.Rmd # WARNING: update the filename?
# print(rmarkdown::metadata$yamlFileName) # permalink
# library(knitr)
# setwd("~/git/ttmmghmm.github.io/_posts") ; fn <- "2015-01-10-sparkline.Rmd" ; knit(fn)  # to get the .md file 
# library(knitrBootstrap)
# rmarkdown::render(fn, knitrBootstrap::bootstrap_document(), clean = FALSE) # no md?
# produce an identical result to Knit HTML in RStudio- no run-time dependency on RStudio
# https://github.com/jimhester/knitrBootstrap#bootstrap-themes
#   knit(fn) ; markdownToHTML("foo.md") ; browseURL("foo.html")
# pandoc(fn, format = "docx") # prodces the .docx file - Word doc.
# rmarkdown::render(fn) # produces table of contents (and html?)
# rmarkdown::render(fn, pdf_document()) # and knit2html() to get .html from .md
title: correlation
#
# like categories, tags can be specified as a YAML list or a space- separated string.
# http://en.wikipedia.org/wiki/YAML#Lists
type: posts
layout: post
tags: R correlation Distance_correlation
categories: rstats correlation
output:
  # https://github.com/jimhester/knitrBootstrap
  # http://cran.r-project.org/web/packages/knitrBootstrap/README.html
  # ::bootstrap_document custom rendering function for the Rmarkdown package.
  knitrBootstrap::bootstrap_document: #  to create bootstrap styled HTML reports - not .md
    # https://github.com/jimhester/knitrBootstrap#package-options
    # title: "where does this appear? # (NULL) Set the title for the html document
    # http://bootswatch.com/ optionally including a dynamic style switch.
    theme: Cyborg # cerulean # Cyborg # monokai cyborg slate darkly superhero cerulean 
    theme.chooser: TRUE # (FALSE) - Add a bootstrap style chooser to the page.
    # highlight Set the default code style. (HighlightJS)
    # https://github.com/jimhester/knitrBootstrap#highlight-themes
    highlight: monokai # Zenburn # monokai # Sunburst # Zenburn # HighlightJs # google code 
    highlight.chooser: TRUE # (FALSE) - Add a code style chooser to the page.
    menu: TRUE # FALSE # Whether to include the bottom navbar.
author: ttmmghmm
---


<!-- setup vignette boiler plate
NB: Do not add yaml code here, put it at the start of the top level Rmd -->
{% include JB/setup %}

*(This blog was produced on: 2015-02-07.)*  




<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->






# correlation

## Distance correlation
http://en.wikipedia.org/wiki/Distance_correlation

```r
library(energy)
packageDescription('energy')
```

```
## Package: energy
## Title: E-statistics (energy statistics)
## Version: 1.6.2
## Date: 2014-10-27
## Author: Maria L. Rizzo and Gabor J. Szekely
## Description: E-statistics (energy) tests and statistics for
##        comparing distributions: multivariate normality,
##        multivariate distance components and k-sample test for
##        equal distributions, hierarchical clustering by
##        e-distances, multivariate independence tests, distance
##        correlation, goodness-of-fit tests. Energy- statistics
##        concept based on a generalization of Newton's potential
##        energy is due to Gabor J. Szekely.
## Maintainer: Maria Rizzo <mrizzo@bgsu.edu>
## Imports: boot
## License: GPL (>= 2)
## NeedsCompilation: yes
## Repository: CRAN
## Packaged: 2014-10-27 20:17:58 UTC; Maria
## Date/Publication: 2014-10-28 08:06:43
## Built: R 3.1.2; x86_64-pc-linux-gnu; 2015-02-01 21:27:08 UTC; unix
## 
## -- File: /usr/local/lib/R/site-library/energy/Meta/package.rds
```

```r
example(edist)
```

```
## 
## edist>  ## compute cluster e-distances for 3 samples of iris data
## edist>  data(iris)
## 
## edist>  edist(iris[,1:4], c(50,50,50))
##           1         2
## 2 123.55381          
## 3 195.30396  38.85415
## 
## edist>  ## pairwise disco statistics
## edist>  edist(iris[,1:4], c(50,50,50), method="discoF")  #F ratios
##           1         2
## 2 145.85699          
## 3 208.48015  35.74207
## 
## edist> ## Don't show: 
## edist>      ## compute e-distances from a distance object
## edist>      data(iris)
## 
## edist>      edist(dist(iris[,1:4]), c(50, 50, 50), distance=TRUE, alpha = .5)
##          1        2
## 2 47.03847         
## 3 64.08673 16.74552
## 
## edist>      ## compute e-distances from a distance matrix
## edist>      data(iris)
## 
## edist>      d <- as.matrix(dist(iris[,1:4]))
## 
## edist>      edist(d, c(50, 50, 50), distance=TRUE, alpha = .5) 
##          1        2
## 2 47.03847         
## 3 64.08673 16.74552
## 
## edist> ## End Don't show
## edist> 
## edist>  ## compute e-distances from vector of group labels
## edist>  d <- dist(matrix(rnorm(100), nrow=50))
## 
## edist>  g <- cutree(energy.hclust(d), k=4)
## 
## edist>  edist(d, sizes=table(g), ix=rank(g, ties.method="first"))
##          1        2        3
## 2 7.828420                  
## 3 2.793152 5.385332         
## 4 3.730281 5.601635 2.727697
```

```r
vignette(package = 'energy')
```

```
## no vignettes found
```

```r
x <- matrix(rnorm(100), 10, 10)
y <- matrix(runif(100), 10, 10)
dx <- dist(x)
dy <- dist(y)
dcor.t(x, y)
```

```
## [1] 0.186149
```

```r
bcdcor(dx, dy, distance=TRUE)
```

```
## [1] 0.03190804
```

```r
dcor.ttest(x, y)
```

```
## 
## 	dcor t-test of independence
## 
## data:  x and y
## T = 0.1861, df = 34, p-value = 0.4267
## sample estimates:
## Bias corrected dcor 
##          0.03190804
```


# sparkline


