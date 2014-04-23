---
layout: post
title: Simple mortgage calculator
tags:
- mortgage
categories:
- rstats
---
{% include JB/setup %}









Have you ever thought of borrowing some money? A common case is when you have to borrow money for buying a house, which is called a mortgage. Wikipedia (<span class="showtooltip" title="(2014). 'Mortgage loan - Wikipedia, the free encyclopedia.' ."><a href="http://en.wikipedia.org/wiki/Mortgage_loan">'Mortgage loan' entry</a></span>) goes into much more detail about the definition than what I'll cover.

One of the aspects you have to evaluate when considering a loan such as a mortgage is how much interest you will be charged and how long the loan will be. Those two determine your monthly payment.

## Comparing loans

That is, given the loan amount, you can compare different loans that offer different rates and/or loan lengths. There are many tools out there that allow you to do so and are generally called mortgage calculators. Although the more detailed term is amortization calculator. From wikipedia(<span class="showtooltip" title="(2014). 'Amortization calculator - Wikipedia, the free encyclopedia.' ."><a href="http://en.wikipedia.org/wiki/Amortization_calculator">'Amortization calculator' entry</a></span>) we find the so called annuity formula which helps you calculate your monthly payment.

Several such mortgage calculators have been features in [R Bloggers](http://www.r-bloggers.com/) before such as (<span class="showtooltip" title="C (2010). 'Mortgage Calculator (and Amortization Charts) with R.' ."><a href="http://www.r-chart.com/2010/11/mortgage-calculator-and-amortization.html">C, 2010</a></span>) and (<span class="showtooltip" title="BioStatMatt (2014). 'Mortgage Refinance Calculator | BioStatMatt.' ."><a href="http://biostatmatt.com/archives/1908">BioStatMatt</a></span>). Plus there are many other alternatives on the web.

## My use case

However, a month or so ago I got curious about comparing some loans which had a different twist than normal. Given some circumstances, I wanted to compare some loans where the loaner is willing to receive payments every few months yet with interests being compounded (that is, calculated) on a different time frame. Obviously, the easiest would be to compound interest at the same frequency as payments are made. Plus, probably most banks would not offer such flexible loans. 

Digging around, I did find modifications to the annuity formula that allow non-monthly payments (<span class="showtooltip" title="(2014). 'Compound Interest Calculator.' ."><a href="http://www.calculator.net/compound-interest-calculator.html">Compound Interest Formula</a></span>) and (<span class="showtooltip" title="(2014). 'Compound Interest.' ."><a href="http://math.about.com/library/weekly/aa042002a.htm">What is compound interest?</a></span>). 

## shiny app

Being interested in `R` code, [shiny](http://www.rstudio.com/shiny/) (<span class="showtooltip" title="RStudio and Inc. (2014). shiny: Web Application Framework for R. R package version 0.9.1."><a href="http://CRAN.R-project.org/package=shiny">RStudio Inc.</a></span>) apps and trying out integrating [rCharts](http://rcharts.io/) (<span class="showtooltip" title="Vaidyanathan R (2013). rCharts: Interactive Charts using Polycharts.js. R package version 0.4.2."><a href="">Vaidyanathan, 2013</a></span>) with shiny, I ended up coding my own mortgage calculator which you can find [here](http://glimmer.rstudio.com/lcolladotor/mortgage/) (<span class="showtooltip" title="(2014). 'Simple Mortgage Calculator.' ."><a href="http://glimmer.rstudio.com/lcolladotor/mortgage/">Simple Mortage Calculator</a></span>). The code is publicly available at [GitHub](https://github.com/lcolladotor/mortgage).

It has a couple of simple inputs:

* Amount to borrow
* Interest rate
* Loan duration
* Payment frequency
* How frequently interests are compounded
* Month of the first payment

The option to begin the loan now but accept the first payment much later is there also because of the complicated use case I had in mind. Again, that is a feature a bank will most likely not offer. But it's something I needed to take into consideration.

Going back to the app, I tried explaining all the inputs as much as possible. The output is relatively straight forward. 

First, there is a line with focus D3 interactive plot (<span class="showtooltip" title="Partners N (2014). 'Line Chart With View Finder - NVD3.' ."><a href="http://nvd3.org//examples/lineWithFocus.html">Line Chart with View Finder</a></span>) which shows the principal (the amount you owe) over months as well as how much you've paid already. The bottom panel allows you to zoom into a specific time range as shown below.

<center>
<a href="http://lcolladotor.github.io/figs/2014-04-22-mortgage-calculator-flexible-payments/lineWithFocus.png"><img src="http://lcolladotor.github.io/figs/2014-04-22-mortgage-calculator-flexible-payments/lineWithFocus.png" alt="Workflow" style="width: 775px;"/></a>
</center>


Next, the information is shown in more detail as an interactive data table (<span class="showtooltip" title="(2014). 'DataTables (table plug-in for jQuery).' ."><a href="https://datatables.net/">DataTables</a></span>) 12 months at a time. The interactive part makes it very easy to search for a specific month and look at the state of the loan.

Finally, you can download the amortization table in CSV format for your records.


PS You can also access the app via shinyapps at this [url](https://lcolladotor.shinyapps.io/mortgage2/). It is the first time I've deployed an app there as I wanted to test shinyapps out.

## Conclusions

The experience of coding the [shiny app](http://glimmer.rstudio.com/lcolladotor/mortgage/) (<span class="showtooltip" title="(2014). 'Simple Mortgage Calculator.' ."><a href="http://glimmer.rstudio.com/lcolladotor/mortgage/">Simple Mortage Calculator</a></span>) was interesting as I did learn a couple of new things. The same was true for figuring out the calculations for the more flexible options.

Finally, but not least, the shiny app was useful for my use case and was informative for comparing different loan options. Hopefully it will be useful for other users!






### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2014). knitcitations: Citations for knitr markdown files. R package version 0.5-0."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2014</a></span>).



-  Mortgage loan - Wikipedia, the free encyclopedia.  *Wikipedia*  [http://en.wikipedia.org/wiki/Mortgage_loan](http://en.wikipedia.org/wiki/Mortgage_loan)
-  Amortization calculator - Wikipedia, the free encyclopedia.  *Wikipedia*  [http://en.wikipedia.org/wiki/Amortization_calculator](http://en.wikipedia.org/wiki/Amortization_calculator)
-  C,   (2010) Mortgage Calculator (and Amortization Charts) with R.  *R-Chart*  [http://www.r-chart.com/2010/11/mortgage-calculator-and-amortization.html](http://www.r-chart.com/2010/11/mortgage-calculator-and-amortization.html)
-  BioStatMatt,  Mortgage Refinance Calculator | BioStatMatt.  *BioStatMatt*  [http://biostatmatt.com/archives/1908](http://biostatmatt.com/archives/1908)
-  Compound Interest Calculator.  [http://www.calculator.net/compound-interest-calculator.html](http://www.calculator.net/compound-interest-calculator.html)
-  Compound Interest.  [http://math.about.com/library/weekly/aa042002a.htm](http://math.about.com/library/weekly/aa042002a.htm)
-  Simple Mortgage Calculator.  [http://glimmer.rstudio.com/lcolladotor/mortgage/](http://glimmer.rstudio.com/lcolladotor/mortgage/)
- Novus Partners,  Line Chart With View Finder - NVD3.  [http://nvd3.org//examples/lineWithFocus.html](http://nvd3.org//examples/lineWithFocus.html)
-  DataTables (table plug-in for jQuery).  *DataTables (jQuery plug-in)*  [https://datatables.net/](https://datatables.net/)
- Carl Boettiger,   (2014) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)
- Ramnath Vaidyanathan,   (2013) rCharts: Interactive Charts using Polycharts.js.
- RStudio , Inc. ,   (2014) shiny: Web Application Framework for R.  [http://CRAN.R-project.org/package=shiny](http://CRAN.R-project.org/package=shiny)


### Reproducibility


{% highlight r %}
sessionInfo()
{% endhighlight %}



{% highlight text %}
## R version 3.1.0 (2014-04-10)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitcitations_0.5-0 bibtex_0.3-6        knitr_1.5.27       
## 
## loaded via a namespace (and not attached):
##  [1] codetools_0.2-8 digest_0.6.4    evaluate_0.5.3  formatR_0.10   
##  [5] httr_0.3        RCurl_1.95-4.1  stringr_0.6.2   tools_3.1.0    
##  [9] XML_3.98-1.1    xtable_1.7-3
{% endhighlight %}


Check other [@jhubiostat](https://twitter.com/jhubiostat) student blogs at [Bmore Biostats](http://bmorebiostat.com/) as well as topics on [#rstats](https://twitter.com/search?q=%23rstats).
