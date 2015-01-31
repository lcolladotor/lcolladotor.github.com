<div id="wrap"><div class="container"><div class="row row-offcanvas row-offcanvas-right"><div class="contents col-xs-12 col-md-10">---
yamlFileName: 2015-01-10-sparkline.Rmd # WARNING: update the filename?
# print(rmarkdown::metadata$yamlFileName) # permalink
# library(knitr)
# setwd("~/git/ttmmghmm.github.io/_posts") ; fn <- "2015-01-10-sparkline.Rmd" ; knit(fn)  # to get the .md file 
#
# library(knitrBootstrap)
# rmarkdown::render(fn, knitrBootstrap::bootstrap_document(), clean = FALSE) # no md?
# produce an identical result to Knit HTML in RStudio- no run-time dependency on RStudio
# https://github.com/jimhester/knitrBootstrap#bootstrap-themes
#   knit(fn) ; browseURL(sub("Rmd", "html", fn))
# pandoc(fn, format = "docx") # prodces the .docx file - Word doc.
# rmarkdown::render(fn) # produces table of contents (and html?)
# rmarkdown::render(fn, pdf_document()) # and knit2html() to get .html from .md
title: "sparkline"
#
# like categories, tags can be specified as a YAML list or a space- separated string.
# http://en.wikipedia.org/wiki/YAML#Lists
type: posts
layout: post
tags: R sparkline plot
categories: rstats sparkline
output:
  # https://github.com/jimhester/knitrBootstrap
  # http://cran.r-project.org/web/packages/knitrBootstrap/README.html
  # ::bootstrap_document custom rendering function for the Rmarkdown package.
  knitrBootstrap::bootstrap_document: #  to create bootstrap styled HTML reports - not .md
    # https://github.com/jimhester/knitrBootstrap#package-options
    # title: "where does this appear? # (NULL) Set the title for the html document
    # http://bootswatch.com/ optionally including a dynamic style switch.
    theme: Cyborg # Cyborg # monokai cyborg slate darkly superhero cerulean 
    theme.chooser: TRUE # (FALSE) - Add a bootstrap style chooser to the page.
    # highlight Set the default code style. (HighlightJS)
    # https://github.com/jimhester/knitrBootstrap#highlight-themes
    highlight: monokai # monokai # Sunburst # Zenburn # HighlightJs # google code 
    highlight.chooser: TRUE # (FALSE) - Add a code style chooser to the page.
    menu: TRUE # FALSE # Whether to include the bottom navbar.
author: ttmmghmm
---

<!--
# Change the default global options
<https://github.com/jimhester/knitrBootstrap#chunk-options>
-->


<!-- setup vignette boiler plate
NB: Do not add yaml code here, put it at the start of the top level Rmd -->

*(This blog was produced on: 2015-01-31.)*  




<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->






# Sparklines
* https://github.com/htmlwidgets/sparkline
* http://www.htmlwidgets.org/develop_intro.html

<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(devtools)
install_github('htmlwidgets/sparkline')</code></pre></div>

http://stats.grok.se retrieves Wikipedia page access statistics on a daily basis. 
The information is either presented in HTML or provided as JSON data.

The API is:
<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">x = rnorm(20)
library(sparkline)
sparkline(x)</code></pre><!--html_preserve--><span id="htmlwidget-9264" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-9264">{ "x": {
 "values": [ 0.1340882201520312, -0.4906858966909428, -0.4405478723532271, 0.4595894410058536, -0.6937202469374755, -1.448204910386472, 0.5747557209007284, -1.023655722963879, -0.01513830036418168, -0.9359486011683936, 1.102297546200263, -0.4755930788690574, -0.7094400375125062, -0.5012580605947614, -1.629093469078704, -1.167619262094186, -2.180039648948674, -1.340993192100028, -0.2942938587637133, -0.4658975404061103 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">sparkline(x, type = 'bar')</code></pre><!--html_preserve--><span id="htmlwidget-4719" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-4719">{ "x": {
 "values": [ 0.1340882201520312, -0.4906858966909428, -0.4405478723532271, 0.4595894410058536, -0.6937202469374755, -1.448204910386472, 0.5747557209007284, -1.023655722963879, -0.01513830036418168, -0.9359486011683936, 1.102297546200263, -0.4755930788690574, -0.7094400375125062, -0.5012580605947614, -1.629093469078704, -1.167619262094186, -2.180039648948674, -1.340993192100028, -0.2942938587637133, -0.4658975404061103 ],
"options": {
 "type": "bar",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">sparkline(x, type = 'box')</code></pre><!--html_preserve--><span id="htmlwidget-1427" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-1427">{ "x": {
 "values": [ 0.1340882201520312, -0.4906858966909428, -0.4405478723532271, 0.4595894410058536, -0.6937202469374755, -1.448204910386472, 0.5747557209007284, -1.023655722963879, -0.01513830036418168, -0.9359486011683936, 1.102297546200263, -0.4755930788690574, -0.7094400375125062, -0.5012580605947614, -1.629093469078704, -1.167619262094186, -2.180039648948674, -1.340993192100028, -0.2942938587637133, -0.4658975404061103 ],
"options": {
 "type": "box",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--></div>
You can also use it in an R Markdown document.


<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(htmlwidgets)
set.seed(1234)
x = rnorm(10)
y = rnorm(10)</code></pre></div>





<!-- *** reproducibility *** 
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Reproducibility
This final 'boiler plate' section highlights how this vignette was created.

## To recreate this vignette

<!-- Additional semantic markup can be added to the citations themselves, such as the reason for the citation. -->

* `knitrBootstrap` (Hester, 2014)
<!--  -->
* Running behind the scenes:  
    * `knitr` (Xie, 2014).
    * `rmarkdown` (Allaire, McPherson, Xie, et al., 2014).
    * From the bibtex information for select packages:
        * `RCurl` (Temple Lang, 2014).
        * `magrittr` (Bache and Wickham, 2014).
    * <https://github.com/trinker/knitcitations>


<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-up"></span> R source</button><pre style="display:none"><code class="source r"># TODO: parse permalink? varialble
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
KnitPost(docName)</code></pre></div>

## YAML boiler plate
<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-up"></span> R source</button><pre style="display:none"><code class="source r">str(rmarkdown::metadata) # https://github.com/rstudio/rmarkdown/issues/260</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-up"></span> R output</button><pre style="display:none"><code class="output r">## List of 8
##  $ yamlFileName: chr "2015-01-10-sparkline.Rmd"
##  $ title       : chr "sparkline"
##  $ type        : chr "posts"
##  $ layout      : chr "post"
##  $ tags        : chr [1:2] "R" "sparkline plot"
##  $ categories  : chr "rstats sparkline"
##  $ output      :List of 1
##   ..$ knitrBootstrap::bootstrap_document:List of 5
##   .. ..$ theme            : chr "cerulean"
##   .. ..$ theme.chooser    : logi TRUE
##   .. ..$ highlight        : chr "Zenburn"
##   .. ..$ highlight.chooser: logi TRUE
##   .. ..$ menu             : logi TRUE
##  $ author      : chr "ttmmghmm"
</code></pre></div>

## `R` information

### Session and packages
<div class="row"><button class="message R toggle btn btn-xs btn-info"><span class="glyphicon glyphicon-chevron-up"></span> R message</button><pre style="display:none"><code class="message r">## Session info -----------------------------------------------------------------------------
</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-up"></span> R output</button><pre style="display:none"><code class="output r">##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, linux-gnu           
##  ui       RStudio (0.98.1091)         
##  language (EN)                        
##  collate  C                           
##  tz       <NA>
</code></pre><button class="message R toggle btn btn-xs btn-info"><span class="glyphicon glyphicon-chevron-up"></span> R message</button><pre style="display:none"><code class="message r">## Packages ---------------------------------------------------------------------------------
</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-up"></span> R output</button><pre style="display:none"><code class="output r">##  package        * version    date       source                                   
##  DBI              0.3.1      2014-09-24 CRAN (R 3.1.1)                           
##  MASS           * 7.3-35     2014-09-30 CRAN (R 3.1.2)                           
##  RCurl            1.95-4.5   2014-12-28 CRAN (R 3.1.2)                           
##  RJSONIO        * 1.3-0      2014-07-28 CRAN (R 3.1.2)                           
##  RSQLite          1.0.0      2014-10-25 CRAN (R 3.1.2)                           
##  Rbitcoin         0.9.2      2014-09-01 CRAN (R 3.1.2)                           
##  Rcpp           * 0.11.3     2014-09-29 CRAN (R 3.1.2)                           
##  RefManageR     * 0.8.40     2014-10-29 CRAN (R 3.1.2)                           
##  XML            * 3.98-1.1   2013-06-20 CRAN (R 3.1.2)                           
##  animint        * 2015.01.19 2015-01-24 Github (tdhock/animint@e6b0f99)          
##  bibtex         * 0.4.0      2014-12-31 CRAN (R 3.1.2)                           
##  bitops           1.0-6      2013-08-17 CRAN (R 3.1.2)                           
##  chron          * 2.3-45     2014-02-11 CRAN (R 3.1.2)                           
##  codetools      * 0.2-9      2014-08-21 CRAN (R 3.1.2)                           
##  colorspace     * 1.2-4      2013-09-30 CRAN (R 3.1.2)                           
##  data.table       1.9.5      2015-01-31 Github (Rdatatable/data.table@84ba115)   
##  devtools         1.7.0      2015-01-17 CRAN (R 3.1.2)                           
##  digest         * 0.6.8      2014-12-31 CRAN (R 3.1.2)                           
##  evaluate       * 0.5.5      2014-04-29 CRAN (R 3.1.2)                           
##  formatR        * 1.0        2014-08-25 CRAN (R 3.1.2)                           
##  ggplot2        * 1.0.0.99   2015-01-24 Github (tdhock/ggplot2@aac38b6)          
##  gtable         * 0.1.2      2012-12-05 CRAN (R 3.1.2)                           
##  htmltools      * 0.2.6      2014-09-08 CRAN (R 3.1.2)                           
##  htmlwidgets      0.3.2      2014-12-09 CRAN (R 3.1.2)                           
##  httr           * 0.6.1      2015-01-01 CRAN (R 3.1.2)                           
##  jsonlite       * 0.9.14     2014-12-01 CRAN (R 3.1.2)                           
##  knitcitations    1.0.5      2014-11-26 CRAN (R 3.1.2)                           
##  knitr            1.8.15     2015-01-11 local                                    
##  knitrBootstrap   1.0.0      2015-01-11 Github (jimhester/knitrBootstrap@76c41f0)
##  lubridate      * 1.3.3      2013-12-31 CRAN (R 3.1.2)                           
##  magrittr         1.5        2014-11-22 CRAN (R 3.1.2)                           
##  markdown       * 0.7.4      2014-08-24 CRAN (R 3.1.2)                           
##  memoise        * 0.2.1      2014-04-22 CRAN (R 3.1.2)                           
##  munsell        * 0.4.2      2013-07-11 CRAN (R 3.1.2)                           
##  plyr           * 1.8.1      2014-02-26 CRAN (R 3.1.2)                           
##  proto          * 0.3-10     2012-12-22 CRAN (R 3.1.2)                           
##  reshape2       * 1.4.1      2014-12-06 CRAN (R 3.1.2)                           
##  rmarkdown      * 0.4.2      2015-01-11 Github (rstudio/rmarkdown@514d134)       
##  rstudio        * 0.98.1091  2014-12-28 local                                    
##  rstudioapi     * 0.2        2014-12-31 CRAN (R 3.1.2)                           
##  rvest            0.2.0.9000 2015-01-24 Github (hadley/rvest@ef0c469)            
##  scales         * 0.2.4      2014-04-22 CRAN (R 3.1.2)                           
##  slidify        * 0.4.5      2015-01-25 Github (ramnathv/slidify@453a86e)        
##  sparkline        1.0        2015-01-10 Github (htmlwidgets/sparkline@aefe3a1)   
##  stringr        * 0.6.2      2012-12-06 CRAN (R 3.1.2)                           
##  whisker        * 0.3-2      2013-04-28 CRAN (R 3.1.2)                           
##  yaml           * 2.1.13     2014-06-12 CRAN (R 3.1.2)
</code></pre></div>

### Runtime 

Vignette generated in 12.4 seconds.   
<p>Timestamp 2015-01-31 23:10:53. <!-- Date the vignette was generated -->

<!-- *** Bibliography END ***
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Bibliography

Citations made with `knitcitations` (Boettiger, 2014).


<div class="row">[1] J. Allaire, J. McPherson, Y. Xie, et al. _rmarkdown: Dynamic
Documents for R_. R package version 0.4.2. 2014. <URL:
http://rmarkdown.rstudio.com>.

[2] S. M. Bache and H. Wickham. _magrittr: A Forward-Pipe Operator
for R_. R package version 1.5. 2014. <URL:
http://CRAN.R-project.org/package=magrittr>.

[3] C. Boettiger. _knitcitations: Citations for knitr markdown
files_. R package version 1.0.5. 2014. <URL:
http://CRAN.R-project.org/package=knitcitations>.

[4] J. Hester. _knitrBootstrap: Knitr Bootstrap framework._ R
package version 1.0.0. 2014. <URL: https://github.com/jimhester/>.

[5] D. Temple Lang. _RCurl: General network (HTTP/FTP/...) client
interface for R_. R package version 1.95-4.5. 2014. <URL:
http://CRAN.R-project.org/package=RCurl>.

[6] Y. Xie. "knitr: A Comprehensive Tool for Reproducible Research
in R". In: _Implementing Reproducible Computational Research_. Ed.
by V. Stodden, F. Leisch and R. D. Peng. ISBN 978-1466561595.
Chapman and Hall/CRC, 2014. <URL:
http://www.crcpress.com/product/isbn/9781466561595>.
</div>

</div></div>
<div class="navbar navbar-fixed-bottom navbar-inverse"><div class="container"><div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"><span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span></button></div>
<div id="bottom-navbar" class="navbar-collapse collapse navbar-responsive-collapse"><ul class="nav navbar-nav navbar-right"><li class="nav"><p class="navbar-text">Toggle</p></li>
<li class="dropup"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Code 
<b class="caret"></b></a>
<ul class="dropdown-menu"><li class="dropdown-header">Languages</li>
<li class="active"><a href="#" class="toggle-global source R" type="source.R">R</a></li>
<li ><a href="#" type="all-source" class="toggle-global">All</a></li></ul></li>

<li class="active"><a href="#" type="figure" class="toggle-global">Figures</a></li></ul></div></div></div></div>
<div id="push"></div>
<div id="footer"><div class="container"><p class="text-muted" id="credit">Styled with 
<a href="https://github.com/jimhester/knitrBootstrap">knitrBootstrap</a></p></div></div>
<link rel="stylesheet" id="theme" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" media="screen"></link><link rel="stylesheet" id="highlight" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/default.min.css" media="screen"></link></div>
