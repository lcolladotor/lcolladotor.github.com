---
layout: post
title: rMaps released
tags:
- rstats
- fun
categories:
- rstats
---
{% include JB/setup %}








[Ramnath Vaidyanathan](https://github.com/ramnathv) just released his new `R` interactive package, `rMaps` (<span class="showtooltip" title="Vaidyanathan R (2014). rMaps: Interactive Maps from R. R package version 0.1."><a href="">Vaidyanathan, 2014</a></span>). The packages relies on the development version of his widely known `rCharts` package (<span class="showtooltip" title="Vaidyanathan R (2013). rCharts: Interactive Charts using Polycharts.js. R package version 0.4.2."><a href="">Vaidyanathan, 2013</a></span>) as well as javascript libraries that specialize in maps. If you don't know Ramnath, he is one of the most active `R` developers out there!! You can see that from his [GitHub profile](https://github.com/ramnathv).

The package is very new and still under development, but I bet that Ramnath released it to get us users excited and maybe find some helpful hands to document it and further develop it.

I don't know about you, but I surely got excited about the package from his intro video:

<iframe width="560" height="315" src="//www.youtube.com/embed/sSbb3PyaSu8" frameborder="0" allowfullscreen></iframe>

It's a simple screen cast with good music. 

In the [GitHub rMaps](https://github.com/ramnathv/rMaps) repository you can find the simple installation instructions as well as three different examples. They all work if you run them in the latest version of [RStudio](http://www.rstudio.com/) otherwise you might run into a couple minor hiccups like [I did](https://github.com/ramnathv/rMaps/issues/1).

Just to get you excited, this is the third example where you can easily add markers with pop ups.


{% highlight r %}
suppressMessages(library("rMaps"))
{% endhighlight %}



{% highlight r %}
map <- Leaflet$new()
map$setView(c(51.505, -0.09), zoom = 13)
map$tileLayer(provider = "Stamen.Watercolor")
map$marker(c(51.5, -0.09), bindPopup = "Hi. I am a popup")
map
{% endhighlight %}


<center>
<a href="http://lcolladotor.github.io/figs/2014-02-10-rMaps-released/example3.png"><img src="http://lcolladotor.github.io/figs/2014-02-10-rMaps-released/example3.png" alt="Workflow" style="width: 808px;"/></a>
</center>

You can view the interactive version of the example [here](http://www.biostat.jhsph.edu/~lcollado/misc/rMaps/file5d8743376948.html) -- I'm sure that a feature will be added later to make it easy to share the maps you make.


Overall, I think that this is a great start and I look forward to using it. For now, don't be discouraged with the lack of documentation. I'm sure that if you [ask nicely](https://github.com/ramnathv/rMaps/issues) Ramnath will answer asap!

### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2014). knitcitations: Citations for knitr markdown files. R package version 0.5-0."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2014</a></span>).



- Carl Boettiger,   (2014) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)
- Ramnath Vaidyanathan,   (2013) rCharts: Interactive Charts using Polycharts.js.
- Ramnath Vaidyanathan,   (2014) rMaps: Interactive Maps from R.


### Reproducibility


{% highlight r %}
sessionInfo()
{% endhighlight %}



{% highlight text %}
## R version 3.0.2 (2013-09-25)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] rMaps_0.1           knitcitations_0.5-0 bibtex_0.3-6       
## [4] knitr_1.5          
## 
## loaded via a namespace (and not attached):
##  [1] codetools_0.2-8    digest_0.6.4       evaluate_0.5.1    
##  [4] formatR_0.10       grid_3.0.2         httr_0.2          
##  [7] lattice_0.20-24    plyr_1.8           rCharts_0.4.2     
## [10] RColorBrewer_1.0-5 RCurl_1.95-4.1     RJSONIO_1.0-3     
## [13] stringr_0.6.2      tools_3.0.2        whisker_0.3-2     
## [16] XML_3.95-0.2       xtable_1.7-1       yaml_2.1.10
{% endhighlight %}


Check other topics on [#rstats](https://twitter.com/search?q=%23rstats).
