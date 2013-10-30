---
layout: post
title: Reading an R file from GitHub
tags:
- rstats
- github
categories:
- rstats
---
<p>Lets say that I want to read in <a href="https://github.com/lcolladotor/ballgownR-devel/blob/master/ballgownR/R/infoGene.R">this R file</a> from GitHub into R.</p>
<p>The first thing you have to do is locate the raw file. You can do so by clicking on the <strong>Raw</strong> button in GitHub. In this case it&#8217;s <a href="https://raw.github.com/lcolladotor/ballgownR-devel/master/ballgownR/R/infoGene.R"><a href="https://raw.github.com/lcolladotor/ballgownR-devel/master/ballgownR/R/infoGene.R">https://raw.github.com/lcolladotor/ballgownR-devel/master/ballgownR/R/infoGene.R</a></a></p>
<p>One would think that using <code>source()</code> would work, but it doesn&#8217;t as shown below:</p>
{% highlight r %}source("https://raw.github.com/lcolladotor/ballgownR-devel/master/ballgownR/R/infoGene.R")
{% endhighlight %}
{% highlight r %}## Warning: unsupported URL scheme
{% endhighlight %}
{% highlight r %}## Error: cannot open the connection
{% endhighlight %}
<p>However, thanks again to Hadley Wickham you can do so by using the <code>devtools</code> (<span class="showtooltip" title="Wickham H and Chang W (2013). devtools: Tools to make developing R code easier. R package version 1.2."><a href="http://CRAN.R-project.org/package=devtools">Wickham &amp; Chang, 2013</a></span> ) package.</p>
<p>Here is how it works:</p>
{% highlight r %}library(devtools)
library(roxygen2)
## Needed because this file has roxygen2 comments. Otherwise you get a
## 'could not find function 'digest'' error
source_url("https://raw.github.com/lcolladotor/ballgownR-devel/master/ballgownR/R/infoGene.R")
{% endhighlight %}
{% highlight r %}## SHA-1 hash of file is 6c32a620799eded5d6ff0997a184843d7964724a
{% endhighlight %}
{% highlight r %}## Note that you can specify the SHA-1 hash to be very specific about
## which version of the file you want to read in.
{% endhighlight %}
<p>We can then check that <code>infoGene</code> has actually been sourced:</p>
{% highlight r %}"infoGene" %in% ls()
{% endhighlight %}
{% highlight r %}## [1] TRUE
{% endhighlight %}
<p>That&#8217;s it! Enjoy!</p>
<p>Citations made with <code>knitcitations</code> (<span class="showtooltip" title="Boettiger C (2013). knitcitations: Citations for knitr markdown files. R package version 0.4-6."><a href="https://github.com/cboettig/knitcitations">Boettiger, 2013</a></span> ).</p>
<ul><li>Hadley Wickham, Winston Chang, (2013) devtools: Tools to make developing R code easier. <a href="http://CRAN.R-project.org/package=devtools"><a href="http://CRAN.R-project.org/package=devtools">http://CRAN.R-project.org/package=devtools</a></a></li>
<li>Carl Boettiger, (2013) knitcitations: Citations for knitr markdown files. <a href="https://github.com/cboettig/knitcitations"><a href="https://github.com/cboettig/knitcitations">https://github.com/cboettig/knitcitations</a></a></li>
</ul><p>Reproducibility</p>
{% highlight r %}sessionInfo()
{% endhighlight %}
{% highlight r %}## R version 3.0.0 (2013-04-03)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] roxygen2_2.2.2      digest_0.6.3        devtools_1.2       
## [4] knitcitations_0.4-6 bibtex_0.3-5        knitr_1.2          
## 
## loaded via a namespace (and not attached):
##  [1] brew_1.0-6     evaluate_0.4.3 formatR_0.7    httr_0.2      
##  [5] memoise_0.1    parallel_3.0.0 RCurl_1.95-4.1 stringr_0.6.2 
##  [9] tools_3.0.0    whisker_0.3-2  XML_3.95-0.2   xtable_1.7-1
{% endhighlight %}
