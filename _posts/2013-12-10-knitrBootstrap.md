---
layout: post
title: Creating awesome reports for multiple audiences using knitrBootstrap
tags:
- rstats
- knitr
- html
categories:
- rstats
---
{% include JB/setup %}









As a biostatistics student, I use `R` very frequently when analyzing data. At the same time, I interact with other researchers, some who know how to use `R` (R crowd) and some who don't (yet!): no-R crowd. This means that I have to be able to communicate my results to two crowds. It is important that I can quickly provide the code in case that the `R` savvy want to look at it: maybe they find a bug and report it ^^. Ideally I want to avoid having to write (organize, share, etc) two crowd-specific reports.

A solution to this problem is to create reproducible reports that contain the R code, the results, and interpretation. For the specific scenario I am talking about, reproducibility is a plus, however I believe that it is important for research; albeit not the topic of this post. One of the strongest packages out there to create such reports is `knitr` (<span class="showtooltip" title="Xie Y (2013). Dynamic Documents with R and knitr. Chapman and Hall/CRC. ISBN 978-1482203530."><a href="http://yihui.name/knitr/">Xie, 2013</a></span>). It is specially easy to create `Rmd` files from which you can generate HTML reports. Then using [RStudio](http://www.rstudio.com/) you can share them via [RPubs](http://rpubs.com/), a private folder on Dropbox, etc. From example, [this is a presentation](http://rpubs.com/lcollado/2618) without the slide formatting I shared more than a year ago.

Using `knitr` (<span class="showtooltip" title="Xie Y (2013). Dynamic Documents with R and knitr. Chapman and Hall/CRC. ISBN 978-1482203530."><a href="http://yihui.name/knitr/">Xie, 2013</a></span>) is definitely a step in the right direction. However, you soon find yourself desiring a better template. This is where `knitrBootstrap` (<span class="showtooltip" title="Hester J (2013). knitrBootstrap: Knitr Bootstrap framework.. R package version 0.9.0."><a href="http://CRAN.R-project.org/package=knitrBootstrap">Hester, 2013</a></span>) comes in. This package was initialized in March 20th, 2013 by [Jim Hester](http://jimhester.com/) and hosted on it's [GitHub repository](https://github.com/jimhester/knitrBootstrap). I was sold on the idea early on and I am now making this post in part as a tribute to celebrate that it has been available via [CRAN](http://cran.at.r-project.org/web/packages/knitrBootstrap/index.html) for nearly 5 months now.

So what can you do with `knitrBootstrap` (<span class="showtooltip" title="Hester J (2013). knitrBootstrap: Knitr Bootstrap framework.. R package version 0.9.0."><a href="http://CRAN.R-project.org/package=knitrBootstrap">Hester, 2013</a></span>)? In my opinion, you get the ideal solution (or very close at the least) to the problem I described at the beginning. Basically, you get a HTML report that has the interpretation and results which is what the no-R crowd wants to read, and the R code easily available at the click of a button for the R crowd. In addition, the report is much more nicely formatted which is pleasant to the eye. Furthermore, a menu with the sections is included which is very useful when navigating the report and for jumping to specific sections. To save space, the plots are saved as thumbnails and you can click on them to get the full view. Finally, you can choose to display toggle menus for allowing the users to change the default text and code formatting. 

How do you use this package? The main workhorse is the `knit_boostrap()` function. The initial arguments are similar to those you find in `knitr::knit()` while the new features are controlled using:

* `boot_style` You can select out of 11 or so options for the default formatting. Basically, you choose one of the Bootstrap themes available. 
* `code_style` Similar to `boot_style` but for controlling the appearance of the code chunks.
* `chooser` Allows you to control if you want a toggle menu so the user can choose (hence the name) the bootstrap and/or code styles.
* `thumbsize` For controlling the size of figure thumbnails. 
* `show_code` Whether by default the code is shown. I set this to `FALSE` in order to get a report that by default is accessible for the no-R crowd. The R crowd can then click to see the code for each code chunk or use the menu on the bottom to show all the code at once.
* `show_output` Similar to `show_code` but for controlling the visibility of the output produced from the code. I set this to `TRUE` as you normally want to show the output to both the no-R and R crowds.
* `show_figure` Whether you want to show the plots or not.
* `graphics` Used only for controlling the toggle menus for the bootstrap and code styles.


Once you have decided which options you want to use, it is as simple as running the following code for your `Rmd` file (named `file.Rmd` in the example):


{% highlight r %}
## Install if needed
install.packages("knitrBootstrap")

## knit with knitrBootstrap
library("knitrBootstrap")
knit_bootstrap("file.Rmd", code_style = "Brown Paper", chooser = c("boot", "code"), 
    show_code = FALSE)
{% endhighlight %}



Things get a tiny bit more complicated if you want to use [RStudio](http://www.rstudio.com/). You basically have to modify your `.Rprofile` file, then load RStudio and change the settings to weave files with `knitr`instead of using `Sweave`. Then, you have to use `knitr::render_html()` on the `Rmd` file itself. Below is a short example of the `.Rprofile` modified to use `knitrBootstrap` and the basic `Rmd` example.

<script src="https://gist.github.com/lcolladotor/6445771.js"></script>

You can view the final output [here](http://rpubs.com/lcollado/11210). Note that you might need to click on "hide toolbars" (a RPubs option) to clearly view the menus on the bottom.

If you are like me and use [Textmate](https://github.com/textmate/textmate) as your text editor, you can knit the `Rmd` files with `knitrBootstrap` and preview them directly on the Textmate viewr using a command like this (modified from the SWeave bundle):

<script src="https://gist.github.com/lcolladotor/7884334.js"></script>

Other usage options are described in the [knitrBootstrap help page](http://jimhester.github.io/knitrBootstrap).

To close off, let me emphasize how useful it is to be able to generate a single report that is pleasant to the eye, contains all the information, and is easily sharable for both the R and no-R crowds. Plus it's reproducible!

I really like this package and would like to thank [Jim Hester](http://jimhester.com/) for this great package! Keep up the good work! I even use `knitrBootstrap` in [derfinderReport](https://github.com/lcolladotor/derfinderReport) which generates reports on the results from [derfinder](https://github.com/lcolladotor/derfinder), a package that I am currently developing.





### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2013). knitcitations: Citations for knitr markdown files. R package version 0.4-7."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2013</a></span>).



- Carl Boettiger,   (2013) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)
- Yihui Xie,   (2013) Dynamic Documents with {R} and knitr.  [http://yihui.name/knitr/](http://yihui.name/knitr/)
- Jim Hester,   (2013) knitrBootstrap: Knitr Bootstrap framework..  [http://CRAN.R-project.org/package=knitrBootstrap](http://CRAN.R-project.org/package=knitrBootstrap)


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
## [1] knitrBootstrap_0.9.0 knitcitations_0.4-7  bibtex_0.3-6        
## [4] knitr_1.5           
## 
## loaded via a namespace (and not attached):
##  [1] codetools_0.2-8 digest_0.6.4    evaluate_0.5.1  formatR_0.10   
##  [5] httr_0.2        markdown_0.6.3  RCurl_1.95-4.1  stringr_0.6.2  
##  [9] tools_3.0.2     XML_3.95-0.2    xtable_1.7-1
{% endhighlight %}


Check other topics on [#rstats](https://twitter.com/search?q=%23rstats).
