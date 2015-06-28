---
yamlFileName: 2015-01-02-TODOs.Rmd # WARNING: update the filename?
title: List of TODOs as an .md file - manaully masaged.
author: ttmmghmm
layout: post
# library(knitr) ; fn <- "foo.Rmd" ; knit(fn)  # produces the md file
# pandoc(fn, format = "docx") # prodces the .docx file - Word doc.
# produce an identical result to Knit HTML in RStudio- no run-time dependency on RStudio
#   knit(fn) ; markdownToHTML("foo.md") ; browseURL("foo.html")
tags:
- "Rs as"
- plota as asdf
categories: rstatsas dadf as
---

# List of TODOs
ttmmghmm  


# What they dont tell you about Rmarkdown
## Lists
* Unordered lists should be a doddle but there are gotchas.
* The first element in a list _must_ be preceeded by a blank line before the first item.
    * Ending the preceeding line with two or more spaces does not seem to work.
        * Even though it is documented to.
    * Neither does ending the line with html like < b r >.
        * TODO: how to do a literal quote.
* You need to put two tabs at the start of a sub item.
    + Else the subitem will not render as a subitem in your list.




<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->


```r
library(knitr)
opts_chunk$set(fig.width = 5, fig.height = 5, warning = FALSE, echo = TRUE, cache = FALSE, message = TRUE)
## Track time spent on making the vignette
startTime <- Sys.time()
```



<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->



# Twitter
http://stackoverflow.com/questions/20024047/oauth-issues-with-twitter-package

# GuardianR

```r
library(GuardianR)
results <- get_guardian("islamic+state",
  from.date="2014-09-16",
  to.date="2014-09-16",
  api.key="3xzg2fk53jcdgaj5tbwqqhcz")
```

```
## [1] "Fetched page #1 of 8"
## [1] "Fetched page #3 of 8"
## [1] "Fetched page #5 of 8"
## [1] "Fetched page #7 of 8"
```


```r
plot(rnorm(10))
```

![](2015-01-02-TODOs_files/figure-html/unnamed-chunk-3-1.png) 



* http://cran.r-project.org/web/packages/GuardianR/GuardianR.pdf


# Bitcoin
http://beautifuldata.net/2015/01/querying-the-bitcoin-blockchain-with-r/


# APIs
## public
http://opendata.stackexchange.com/questions/1677/a-web-api-users-guide-for-free-and-open-data?newsletter=1&nlcode=386863%7c20e3
  
# Wikipedia
* Tags: text mining
* Packages: tm

## Graph and web crawling
* http://semanticweb.cs.vu.nl/R/wikipedia_graph/wikipedia_graph.html
* Tags: [text mining, graphs, wikipedia, crawl, Simple Wikipedia, Wikipedia,
  analytical metrics]
  * ???Basic English 850 basic English words chosen by Charles Kay Ogden.???
* TODO: dynamic graph, shiny

## WikiPediR package
* http://www.rexamine.com/2014/06/text-mining-in-r-automatic-categorization-of-wikipedia-articles/
  *  hierarchical categorization of Wikipedia articles
* more information about text mining in R: 
    * http://onepager.togaware.com/TextMiningO.pdf
    * http://cran.r-project.org/web/views/NaturalLanguageProcessing.html
    * http://www.r-bloggers.com/text-mining/
    * http://www.jstatsoft.org/v25/i05/paper
    * http://www.r-bloggers.com/visualising-wikipedia-search-statistics-with-r/
        * search traffic for any article - search statistics for ???Financial crisis???. 
            * The wikiStat() function returns dataframe with the necessary data.
    * http://cran.r-project.org/web/packages/tm.plugin.webmining/vignettes/ShortIntro.pdf


```r
opts_chunk$set(eval = FALSE)
library(magrittr)
docs[[1]]
# Replace all ?????? elements with a space. 
# We do it because there are not a part of text document but in general a html code.
# use the non-greedy .*? match - match up until the first following instance of '>'. Without this, if you use just .*, you'll capture everything up to the last '[END DATA]'>'.
docs2 <- tm_map(docs, function(x) stri_replace_all_regex(x, "<.+?>", " "))
docs3 <- tm_map(docs2, function(x) stri_replace_all_fixed(x, "\t", " "))
docs2[[1]]

docs4 <- tm_map(docs3, PlainTextDocument)
docs5 <- tm_map(docs4, stripWhitespace)
docs6 <- tm_map(docs5, removeWords, stopwords("english"))
docs7 <- tm_map(docs6, removePunctuation)
docs8 <- tm_map(docs7, tolower)

docs8[[1]]

docs %>% 
  tm_map(FUN = function(x) stri_replace_all_regex(x, "<.+?>", " ")) ->  
docs2 
```






<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->



# Reproducibility
This final section highlights how this vignette was created.

## To recreate this vignette
This vignette was generated using:    

* `knitrBootstrap` <a id='cite-knitrBootstrap'></a>(<a href='https://github.com/jimhester/'>Hester, 2014</a>)
* Running behind the scenes:  
    * `knitr` <a id='cite-knitr'></a>(<a href='http://www.crcpress.com/product/isbn/9781466561595'>Xie, 2014</a>) 
    * `rmarkdown` <a id='cite-rmarkdown'></a>(<a href='http://rmarkdown.rstudio.com'>Allaire, McPherson, Xie, Wickham, et al., 2014</a>) 


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
    print(rmarkdown::metadata$title)
    # TODO: stopifnot(file.exists(paste0(rmarkdown::metadata$title, ".Rmd")))
    system.time(knit_bootstrap(docName, chooser=c('boot', 'code'), show_code = TRUE))
    # unlink('dots.md') # why remove .md file and in yaml?
} else {
    ## GitHub version
    library('rmarkdown')
    system.time(render(docName))
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
## List of 8
##  $ yamlFileName: chr "2015-01-02-TODOs.Rmd"
##  $ title       : chr "List of TODOs"
##  $ author      : chr "ttmmghmm"
##  $ layout      : chr "post"
##  $ output      :List of 1
##   ..$ html_document:List of 5
##   .. ..$ fig_caption    : logi TRUE
##   .. ..$ keep_md        : logi TRUE
##   .. ..$ number_sections: logi TRUE
##   .. ..$ self_contained : logi FALSE
##   .. ..$ toc            : logi TRUE
##  $ tags        : chr [1:2] "Rs as" "plota as asdf"
##  $ categories  : chr "rstatsas dadf as"
##  $ published   : logi FALSE
```

## `R` information

### Session and packages

```
## Session info-----------------------------------------------------------------------------
```

```
##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  C                           
##  tz       UTC
```

```
## Packages---------------------------------------------------------------------------------
```

```
##  package       * version  date       source                            
##  GuardianR     * 0.5      2014-09-16 CRAN (R 3.1.2)                    
##  RCurl           1.95.4.5 2014-12-28 CRAN (R 3.1.2)                    
##  RJSONIO         1.3.0    2014-07-28 CRAN (R 3.1.2)                    
##  Rcpp            0.11.3   2014-09-29 CRAN (R 3.1.2)                    
##  RefManageR      0.8.40   2014-10-29 CRAN (R 3.1.2)                    
##  XML             3.98.1.1 2013-06-20 CRAN (R 3.1.2)                    
##  bibtex          0.4.0    2014-12-31 CRAN (R 3.1.2)                    
##  bitops          1.0.6    2013-08-17 CRAN (R 3.1.2)                    
##  devtools      * 1.6.1    2014-10-07 CRAN (R 3.1.2)                    
##  digest          0.6.8    2014-12-31 CRAN (R 3.1.2)                    
##  evaluate        0.5.5    2014-04-29 CRAN (R 3.1.2)                    
##  formatR         1.0      2014-08-25 CRAN (R 3.1.2)                    
##  htmltools       0.2.6    2014-09-08 CRAN (R 3.1.2)                    
##  httr            0.6.1    2015-01-01 CRAN (R 3.1.2)                    
##  knitcitations * 1.0.5    2014-11-26 CRAN (R 3.1.2)                    
##  knitr         * 1.8.13   2015-01-01 local                             
##  lubridate       1.3.3    2013-12-31 CRAN (R 3.1.2)                    
##  memoise         0.2.1    2014-04-22 CRAN (R 3.1.2)                    
##  plyr            1.8.1    2014-02-26 CRAN (R 3.1.2)                    
##  rmarkdown       0.4.2    2015-01-01 Github (rstudio/rmarkdown@ddeb876)
##  rstudioapi      0.2      2014-12-31 CRAN (R 3.1.2)                    
##  stringr         0.6.2    2012-12-06 CRAN (R 3.1.2)                    
##  yaml            2.1.13   2014-06-12 CRAN (R 3.1.2)
```

### Runtime 

Vignette generated in 5.7 seconds.   
<p>Timestamp 2015-01-03 22:47:46. <!-- Date the vignette was generated -->


<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->

# Bibliography

Citations made with `knitcitations` <a id='cite-knitcitations'></a>(<a href='http://CRAN.R-project.org/package=knitcitations'>Boettiger, 2014</a>).

<p><a id='bib-rmarkdown'></a><a href="#cite-rmarkdown">[1]</a><cite>
J. Allaire, J. McPherson, Y. Xie, H. Wickham, et al.
<EM>rmarkdown: Dynamic Documents for R</EM>.
R package version 0.4.2.
2014.
URL: <a href="http://rmarkdown.rstudio.com">http://rmarkdown.rstudio.com</a>.</cite></p>

<p><a id='bib-knitcitations'></a><a href="#cite-knitcitations">[2]</a><cite>
C. Boettiger.
<EM>knitcitations: Citations for knitr markdown files</EM>.
R package version 1.0.5.
2014.
URL: <a href="http://CRAN.R-project.org/package=knitcitations">http://CRAN.R-project.org/package=knitcitations</a>.</cite></p>

<p><a id='bib-knitrBootstrap'></a><a href="#cite-knitrBootstrap">[3]</a><cite>
J. Hester.
<EM>knitrBootstrap: Knitr Bootstrap framework.</EM>
R package version 1.0.0.
2014.
URL: <a href="https://github.com/jimhester/">https://github.com/jimhester/</a>.</cite></p>

<p><a id='bib-knitr'></a><a href="#cite-knitr">[4]</a><cite>
Y. Xie.
&ldquo;knitr: A Comprehensive Tool for Reproducible Research in R&rdquo;.
In: 
<EM>Implementing Reproducible Computational Research</EM>.
Ed. by V. Stodden, F. Leisch and R. D. Peng.
ISBN 978-1466561595.
Chapman and Hall/CRC, 2014.
URL: <a href="http://www.crcpress.com/product/isbn/9781466561595">http://www.crcpress.com/product/isbn/9781466561595</a>.</cite></p>


