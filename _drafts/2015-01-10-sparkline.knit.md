<div id="wrap"><div class="container"><div class="row row-offcanvas row-offcanvas-right"><div class="contents col-xs-12 col-md-10">---
yamlFileName: 2015-01-10-sparkline.Rmd # WARNING: update the filename?
# print(rmarkdown::metadata$yamlFileName) # permalink
# library(knitr)
# setwd("~/git/ttmmghmm.github.io/_drafts") ; fn <- "2015-01-10-sparkline.Rmd" ; knit(fn)  # to get the .md file 
#
# library(knitrBootstrap)
# rmarkdown::render(fn, knitrBootstrap::bootstrap_document(), clean = FALSE) # no md?
# produce an identical result to Knit HTML in RStudio- no run-time dependency on RStudio
# https://github.com/jimhester/knitrBootstrap#bootstrap-themes
#   knit(fn) ; markdownToHTML("foo.md") ; browseURL("foo.html")
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
author: ttmmghmm
---

# Displaying an index of posts
* {{ site.posts }}
* {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
<!-- http://jekyllrb.com/docs/collections/
{{ con tent }}
{{ out put }}
-->
# Change the default global options
https://github.com/jimhester/knitrBootstrap#chunk-options
<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(magrittr)
# https://github.com/jimhester/knitrBootstrap#chunk-options
# colors() [grep(patt = "dark", x = colours())]
#     panel: FALSE #  Use panels rather than buttons to toggle blocks.
opts_chunk$set(fig.width = 5, fig.height = 5)
# bootstrap.panel (FALSE) - panels rather than buttons to toggle blocks.
opts_chunk$set(background = c('gray10'), panel = TRUE) 
# http://getbootstrap.com/css/#grid
# bootstrap.thumbnail - (TRUE) - Thumbnail and lightbox images.
opts_chunk$set(thumbnail = TRUE, thumbnail.size = 'col-md-6')
# .class ('row') - class to apply to the div containing the chunk.
# opts_chunk$set(class = 'rowew')
# bootstrap.show.code - (TRUE) - Code from this chunk starts as shown.
# opts_chunk$set(code = FALSE, output = FALSE) 
# opts_chunk$set(echo = FALSE, cache = FALSE)
# opts_chunk$set(message = FALSE, warning = FALSE, error = FALSE) 

# NOT working?
# The package options can be changed using the object opts_knit; for example,
opts_knit$set(progress = TRUE, verbose = TRUE)</code></pre></div>



<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->

<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(knitr)
opts_chunk$set(fig.width = 5, fig.height = 5, warning = FALSE, echo = TRUE, cache = FALSE, message = TRUE)
## Track time spent on making the vignette
startTime <- Sys.time()</code></pre></div>


<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->



<div class="row"><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-down"></span> R output</button><pre style=""><code class="output r">## [1] J. Allaire, J. McPherson, Y. Xie, et al. _rmarkdown: Dynamic
## Documents for R_. R package version 0.4.2. 2014. <URL:
## http://rmarkdown.rstudio.com>.
## 
## [2] C. Boettiger. _knitcitations: Citations for knitr markdown
## files_. R package version 1.0.5. 2014. <URL:
## http://CRAN.R-project.org/package=knitcitations>.
## 
## [3] L. Collado-Torres. _dots: Simplifying function calls_. R
## package version 1.0.0. 2014. <URL:
## https://github.com/lcolladotor/dots>.
## 
## [4] J. Hester. _knitrBootstrap: Knitr Bootstrap framework._ R
## package version 1.0.0. 2014. <URL: https://github.com/jimhester/>.
## 
## [5] Y. Xie. "knitr: A Comprehensive Tool for Reproducible Research
## in R". In: _Implementing Reproducible Computational Research_. Ed.
## by V. Stodden, F. Leisch and R. D. Peng. ISBN 978-1466561595.
## Chapman and Hall/CRC, 2014. <URL:
## http://www.crcpress.com/product/isbn/9781466561595>.
</code></pre></div>


# Sparklines
* https://github.com/htmlwidgets/sparkline
* http://www.htmlwidgets.org/develop_intro.html

<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(devtools)
install_github('htmlwidgets/sparkline')</code></pre></div>

http://stats.grok.se retrieves Wikipedia page access statistics on a daily basis. 
The information is either presented in HTML or provided as JSON data.

The API is pretty simple
<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">x = rnorm(20)
library(sparkline)
sparkline(x)</code></pre><!--html_preserve--><span id="htmlwidget-3109" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-3109">{ "x": {
 "values": [ -0.03763026292717517, 0.723976060750263, -0.4967388630279395, 0.01139516138287681, 0.009859945862689684, 0.6782714234230518, 1.029563029157003, -1.72952850422356, -2.204348094541716, 0.5431728957249322, 0.02142719449953793, 0.1625657934822754, 1.241754254068704, 0.7827774777543995, 0.04812070895590322, -1.475400135552165, 0.4357623023419553, -0.07047017857200644, 0.1111965327947037,  1.27350464308159 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">sparkline(x, type = 'bar')</code></pre><!--html_preserve--><span id="htmlwidget-1601" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-1601">{ "x": {
 "values": [ -0.03763026292717517, 0.723976060750263, -0.4967388630279395, 0.01139516138287681, 0.009859945862689684, 0.6782714234230518, 1.029563029157003, -1.72952850422356, -2.204348094541716, 0.5431728957249322, 0.02142719449953793, 0.1625657934822754, 1.241754254068704, 0.7827774777543995, 0.04812070895590322, -1.475400135552165, 0.4357623023419553, -0.07047017857200644, 0.1111965327947037,  1.27350464308159 ],
"options": {
 "type": "bar",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">sparkline(x, type = 'box')</code></pre><!--html_preserve--><span id="htmlwidget-8961" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-8961">{ "x": {
 "values": [ -0.03763026292717517, 0.723976060750263, -0.4967388630279395, 0.01139516138287681, 0.009859945862689684, 0.6782714234230518, 1.029563029157003, -1.72952850422356, -2.204348094541716, 0.5431728957249322, 0.02142719449953793, 0.1625657934822754, 1.241754254068704, 0.7827774777543995, 0.04812070895590322, -1.475400135552165, 0.4357623023419553, -0.07047017857200644, 0.1111965327947037,  1.27350464308159 ],
"options": {
 "type": "box",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve--></div>
You can also use it in an R Markdown document.

<pre>
---
title: "jquery Sparkline HTML Widget"
author: "Ramnath Vaidyanathan"
date: "July 18, 2014"
output: html_document
---
</pre>

<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">library(htmlwidgets)
library(sparkline)
set.seed(1234)
x = rnorm(10)
y = rnorm(10)</code></pre></div>


Inline line graphs <!--html_preserve--><span id="htmlwidget-5533" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-5533">{ "x": {
 "values": [ -1.207065749385421,  0.27742924211066, 1.084441176683056, -2.345697702629349,  0.42912468881105, 0.506055892157574, -0.5747399601346488, -0.546631855784187, -0.564451999093283, -0.8900378290441038 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->

Bar charts  <!--html_preserve--><span id="htmlwidget-6464" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-6464">{ "x": {
 "values": [ 1.207065749385421,  0.27742924211066, 1.084441176683056, 2.345697702629349,  0.42912468881105, 0.506055892157574, 0.5747399601346488, 0.546631855784187, 0.564451999093283, 0.8900378290441038 ],
"options": {
 "type": "bar",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->  negative values: <!--html_preserve--><span id="htmlwidget-3118" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-3118">{ "x": {
 "values": [ -1.207065749385421,  0.27742924211066, 1.084441176683056, -2.345697702629349,  0.42912468881105, 0.506055892157574, -0.5747399601346488, -0.546631855784187, -0.564451999093283, -0.8900378290441038 ],
"options": {
 "type": "bar",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->

| Stock | Sparkline         | Boxplot  
|-------|-------------------|--------
| x     | <!--html_preserve--><span id="htmlwidget-6218" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-6218">{ "x": {
 "values": [ -1.207065749385421,  0.27742924211066, 1.084441176683056, -2.345697702629349,  0.42912468881105, 0.506055892157574, -0.5747399601346488, -0.546631855784187, -0.564451999093283, -0.8900378290441038 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->  | <!--html_preserve--><span id="htmlwidget-3298" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-3298">{ "x": {
 "values": [ -1.207065749385421,  0.27742924211066, 1.084441176683056, -2.345697702629349,  0.42912468881105, 0.506055892157574, -0.5747399601346488, -0.546631855784187, -0.564451999093283, -0.8900378290441038 ],
"options": {
 "type": "box",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->
| y     | <!--html_preserve--><span id="htmlwidget-5020" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-5020">{ "x": {
 "values": [ -0.477192699753547, -0.998386444859704, -0.77625389463799, 0.06445881727626934, 0.9594940589707713, -0.1102854943907743, -0.5110095058066422, -0.9111954166298112, -0.8371716802689395, 2.415835178489341 ],
"options": {
 "height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->  | <!--html_preserve--><span id="htmlwidget-6771" class="sparkline"></span>
<script type="application/json" data-for="htmlwidget-6771">{ "x": {
 "values": [ -0.477192699753547, -0.998386444859704, -0.77625389463799, 0.06445881727626934, 0.9594940589707713, -0.1102854943907743, -0.5110095058066422, -0.9111954166298112, -0.8371716802689395, 2.415835178489341 ],
"options": {
 "type": "box",
"height":                20,
"width":                60 
},
"width":                60,
"height":                20 
},"evals": [  ] }</script><!--/html_preserve-->




<!-- *** reproducibility *** 
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Reproducibility
This final section highlights how this vignette was created.

## To recreate this vignette
This vignette was generated using:    

<!-- 
-->
Additional semantic markup can be added to the citations themselves, such as the reason for the citation. 
https://github.com/trinker/knitcitations 

* `knitrBootstrap` 
* Running behind the scenes:  
    * `knitr` (Xie, 2014) 
    * `rmarkdown` (Allaire, McPherson, Xie, et al., 2014) 
    * Cite an R package using the 'bibentry' object (Temple Lang, 2014).


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
<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">str(rmarkdown::metadata) # https://github.com/rstudio/rmarkdown/issues/260</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-down"></span> R output</button><pre style=""><code class="output r">## List of 7
##  $ yamlFileName: chr "2015-01-10-sparkline.Rmd"
##  $ title       : chr "sparkline"
##  $ type        : chr "posts"
##  $ layout      : chr "post"
##  $ tags        : chr [1:2] "R" "sparkline plot"
##  $ categories  : chr "rstats sparkline"
##  $ author      : chr "ttmmghmm"
</code></pre></div>

## `R` information

### Session and packages
<div class="row"><button class="message R toggle btn btn-xs btn-info"><span class="glyphicon glyphicon-chevron-up"></span> R message</button><pre style="display:none"><code class="message r">## Session info-----------------------------------------------------------------------------
</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-down"></span> R output</button><pre style=""><code class="output r">##  setting  value                       
##  version  R version 3.1.2 (2014-10-31)
##  system   x86_64, linux-gnu           
##  ui       RStudio (0.98.1091)         
##  language (EN)                        
##  collate  C                           
##  tz       <NA>
</code></pre><button class="message R toggle btn btn-xs btn-info"><span class="glyphicon glyphicon-chevron-up"></span> R message</button><pre style="display:none"><code class="message r">## Packages---------------------------------------------------------------------------------
</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-down"></span> R output</button><pre style=""><code class="output r">##  package          * version   date       source                                   
##  AnomalyDetection * 1.0       2015-01-10 Github (twitter/AnomalyDetection@ded98ed)
##  GuardianR        * 0.5       2014-09-16 CRAN (R 3.1.2)                           
##  MASS               7.3.35    2014-09-30 CRAN (R 3.1.2)                           
##  RCurl            * 1.95.4.5  2014-12-28 CRAN (R 3.1.2)                           
##  RJSONIO          * 1.3.0     2014-07-28 CRAN (R 3.1.2)                           
##  Rcpp               0.11.3    2014-09-29 CRAN (R 3.1.2)                           
##  RefManageR         0.8.40    2014-10-29 CRAN (R 3.1.2)                           
##  XML                3.98.1.1  2013-06-20 CRAN (R 3.1.2)                           
##  bibtex             0.4.0     2014-12-31 CRAN (R 3.1.2)                           
##  bitops           * 1.0.6     2013-08-17 CRAN (R 3.1.2)                           
##  colorspace         1.2.4     2013-09-30 CRAN (R 3.1.2)                           
##  devtools         * 1.6.1     2014-10-07 CRAN (R 3.1.2)                           
##  digest             0.6.8     2014-12-31 CRAN (R 3.1.2)                           
##  evaluate           0.5.5     2014-04-29 CRAN (R 3.1.2)                           
##  formatR            1.0       2014-08-25 CRAN (R 3.1.2)                           
##  ggplot2          * 1.0.0     2014-05-21 CRAN (R 3.1.2)                           
##  gtable             0.1.2     2012-12-05 CRAN (R 3.1.2)                           
##  htmltools          0.2.6     2014-09-08 CRAN (R 3.1.2)                           
##  htmlwidgets      * 0.3.2     2014-12-09 CRAN (R 3.1.2)                           
##  httr               0.6.1     2015-01-01 CRAN (R 3.1.2)                           
##  jsonlite           0.9.14    2014-12-01 CRAN (R 3.1.2)                           
##  knitcitations    * 1.0.5     2014-11-26 CRAN (R 3.1.2)                           
##  knitr            * 1.8.13    2015-01-01 local                                    
##  knitrBootstrap   * 1.0.0     2015-01-01 Github (jimhester/knitrBootstrap@76c41f0)
##  labeling           0.3       2014-08-23 CRAN (R 3.1.2)                           
##  lubridate          1.3.3     2013-12-31 CRAN (R 3.1.2)                           
##  magrittr         * 1.5       2014-11-22 CRAN (R 3.1.2)                           
##  markdown           0.7.4     2014-08-24 CRAN (R 3.1.2)                           
##  memoise            0.2.1     2014-04-22 CRAN (R 3.1.2)                           
##  munsell            0.4.2     2013-07-11 CRAN (R 3.1.2)                           
##  plyr               1.8.1     2014-02-26 CRAN (R 3.1.2)                           
##  proto              0.3.10    2012-12-22 CRAN (R 3.1.2)                           
##  reshape2           1.4.1     2014-12-06 CRAN (R 3.1.2)                           
##  rmarkdown          0.4.2     2015-01-01 Github (rstudio/rmarkdown@ddeb876)       
##  rstudio            0.98.1091 2014-12-28 local                                    
##  rstudioapi         0.2       2014-12-31 CRAN (R 3.1.2)                           
##  scales             0.2.4     2014-04-22 CRAN (R 3.1.2)                           
##  sparkline        * 1.0       2015-01-10 Github (htmlwidgets/sparkline@aefe3a1)   
##  stringr            0.6.2     2012-12-06 CRAN (R 3.1.2)                           
##  wikipediatrend   * 0.2.0     2014-11-07 CRAN (R 3.1.2)                           
##  yaml               2.1.13    2014-06-12 CRAN (R 3.1.2)
</code></pre></div>

### Runtime 

Vignette generated in 1.2 seconds.   
<p>Timestamp 2015-01-10 22:45:17. <!-- Date the vignette was generated -->

<!-- *** Bibliography END ***
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Bibliography

Citations made with `knitcitations` (Boettiger, 2014).


<div class="row">[1] J. Allaire, J. McPherson, Y. Xie, et al. _rmarkdown: Dynamic Documents for
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
<li class="dropup"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Output
<b class="caret"></b></a>
<ul class="dropdown-menu"><li class="dropdown-header">Type</li>
<li class="active"><a href="#" class="toggle-global output" type="output">output</a></li>
<li class="active"><a href="#" class="toggle-global message" type="message">message</a></li>
<li ><a href="#" type="all-output" class="toggle-global">All</a></li></ul></li>
<li class="active"><a href="#" type="figure" class="toggle-global">Figures</a></li></ul></div></div></div></div>
<div id="push"></div>
<div id="footer"><div class="container"><p class="text-muted" id="credit">Styled with 
<a href="https://github.com/jimhester/knitrBootstrap">knitrBootstrap</a></p></div></div>
<link rel="stylesheet" id="theme" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" media="screen"></link><link rel="stylesheet" id="highlight" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/default.min.css" media="screen"></link></div>
