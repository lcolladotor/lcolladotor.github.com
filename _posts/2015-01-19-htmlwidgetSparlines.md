# jquery Sparkline HTML Widget
Ramnath Vaidyanathan  
July 18, 2014  


<!-- setup vignette boiler plate
NB: Do not add yaml code here, put it at the start of the top level Rmd -->

*(This blog was produced on: 2015-01-24.)*  




<!-- NB: Do not add yaml code here, put it at the start of the top level Rmd -->







```r
plot(runif(1e3))
```

![](2015-01-19-htmlwidgetSparlines_files/figure-html/unnamed-chunk-2-1.png) 


```r
library(ggplot2)
qplot(runif(1e2))
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![](2015-01-19-htmlwidgetSparlines_files/figure-html/unnamed-chunk-3-1.png) 



```r
library(htmlwidgets)
library(sparkline)
set.seed(1234)
x = rnorm(10)
y = rnorm(10)
```


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

Additional semantic markup can be added to the citations themselves, such as the reason for the citation. 
https://github.com/trinker/knitcitations 

* `knitrBootstrap` 
* Running behind the scenes:  
    * `knitr` (Xie, 2014) 
    * `rmarkdown` (Allaire, McPherson, Xie, Wickham, Cheng, and Allen, 2014) 
    * Cite an R package using the 'bibentry' object (Temple Lang, 2014).



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
## List of 7
##  $ title       : chr "jquery Sparkline HTML Widget"
##  $ author      : chr "Ramnath Vaidyanathan"
##  $ date        : chr "July 18, 2014"
##  $ yamlFileName: chr "2015-01-19-htmlwidgetSparlines.Rmd"
##  $ tags        : chr [1:2] "R" "sparkline"
##  $ categories  : chr "rstats sparkline htmkwidget"
##  $ output      :List of 2
##   ..$ html_document                     :List of 1
##   .. ..$ keep_md: logi TRUE
##   ..$ knitrBootstrap::bootstrap_document:List of 2
##   .. ..$ theme        : chr "Cyborg"
##   .. ..$ theme.chooser: logi TRUE
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
##  tz       <NA>
```

```
## Packages---------------------------------------------------------------------------------
```

```
##  package       * version  date       source                                
##  MASS            7.3.35   2014-09-30 CRAN (R 3.1.2)                        
##  RCurl           1.95.4.5 2014-12-28 CRAN (R 3.1.2)                        
##  RJSONIO         1.3.0    2014-07-28 CRAN (R 3.1.2)                        
##  Rcpp            0.11.3   2014-09-29 CRAN (R 3.1.2)                        
##  RefManageR      0.8.40   2014-10-29 CRAN (R 3.1.2)                        
##  XML             3.98.1.1 2013-06-20 CRAN (R 3.1.2)                        
##  bibtex          0.4.0    2014-12-31 CRAN (R 3.1.2)                        
##  bitops          1.0.6    2013-08-17 CRAN (R 3.1.2)                        
##  colorspace      1.2.4    2013-09-30 CRAN (R 3.1.2)                        
##  devtools      * 1.6.1    2014-10-07 CRAN (R 3.1.2)                        
##  digest          0.6.8    2014-12-31 CRAN (R 3.1.2)                        
##  evaluate        0.5.5    2014-04-29 CRAN (R 3.1.2)                        
##  formatR         1.0      2014-08-25 CRAN (R 3.1.2)                        
##  ggplot2       * 1.0.0.99 2015-01-18 Github (tdhock/ggplot2@aac38b6)       
##  gtable          0.1.2    2012-12-05 CRAN (R 3.1.2)                        
##  htmltools       0.2.6    2014-09-08 CRAN (R 3.1.2)                        
##  htmlwidgets   * 0.3.2    2014-12-09 CRAN (R 3.1.2)                        
##  httr            0.6.1    2015-01-01 CRAN (R 3.1.2)                        
##  knitcitations * 1.0.5    2014-11-26 CRAN (R 3.1.2)                        
##  knitr         * 1.8.15   2015-01-11 local                                 
##  labeling        0.3      2014-08-23 CRAN (R 3.1.2)                        
##  lubridate       1.3.3    2013-12-31 CRAN (R 3.1.2)                        
##  magrittr      * 1.5      2014-11-22 CRAN (R 3.1.2)                        
##  memoise         0.2.1    2014-04-22 CRAN (R 3.1.2)                        
##  munsell         0.4.2    2013-07-11 CRAN (R 3.1.2)                        
##  plyr            1.8.1    2014-02-26 CRAN (R 3.1.2)                        
##  proto           0.3.10   2012-12-22 CRAN (R 3.1.2)                        
##  reshape2        1.4.1    2014-12-06 CRAN (R 3.1.2)                        
##  rmarkdown       0.4.2    2015-01-11 Github (rstudio/rmarkdown@514d134)    
##  rstudioapi      0.2      2014-12-31 CRAN (R 3.1.2)                        
##  scales          0.2.4    2014-04-22 CRAN (R 3.1.2)                        
##  sparkline     * 1.0      2015-01-10 Github (htmlwidgets/sparkline@aefe3a1)
##  stringr         0.6.2    2012-12-06 CRAN (R 3.1.2)                        
##  yaml            2.1.13   2014-06-12 CRAN (R 3.1.2)
```

### Runtime 

Vignette generated in 4.7 seconds.   
<p>Timestamp 2015-01-24 19:00:38. <!-- Date the vignette was generated -->

<!-- *** Bibliography END ***
NB: Do not add yaml code here, put it at the start of the top level Rmd 
-->

# Bibliography

Citations made with `knitcitations` (Boettiger, 2014).


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

