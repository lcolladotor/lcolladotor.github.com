---
layout: post
title: Using plyr and doMC for quick and easy apply-family functions
tags:
- rstats
- plyr
- parallel
- knitr
- cluster
categories:
- rstats
---
<p>A few weeks back I dedicated a short amount of time to actually read what <code>plyr</code> (<span class="showtooltip" title="Wickham H (2011). The Split-Apply-Combine Strategy for Data
Analysis. _Journal of Statistical Software_, *40*(1), pp. 1-29.
 http://www.jstatsoft.org/v40/i01/."><a href="http://www.jstatsoft.org/v40/i01/">Wickham, 2011</a></span>) is about and I was surprised. The whole idea behind <code>plyr</code> is very simple: expand the <code>apply()</code> family to do things easy. <code>plyr</code> has many functions whose name ends with <code>ply</code> which is short of apply. Then, the functions are identified by two letters before <code>ply</code> which are abbreviations for the input (first letter) and output (second one). For instance, <code>ddply</code> takes an input a <code>data.frame</code> and returns a <code>data.frame</code> while <code>ldply</code> takes as input a <code>list</code> and returns a <code>data.frame</code>.</p>
<p>The syntax is pretty straight forward. For example, here are the arguments for <code>ddply</code>:</p>

{% highlight r %}
library(plyr)
args(ddply)
## function (.data, .variables, .fun = NULL, ..., .progress = "none", 
##     .inform = FALSE, .drop = TRUE, .parallel = FALSE, .paropts = NULL) 
## NULL
{% endhighlight %}

<p>What we basically have to specify are</p>
<ul><li><code>.data</code> which in general is the name of the input <code>data.frame</code>,</li>
<li><code>.variables</code> which is a vector (note the use of the <code>.</code> function) of variable names. In this case, <code>ddply</code> is very useful for applying some function to subsets of the data as specified by these variables,</li>
<li><code>.fun</code> which is the actual function we want to run,</li>
<li>and <code>...</code> which are parameter options for the function we are running.</li>
</ul><p>From the <code>ddply</code> help page we have the following examples:</p>

{% highlight r %}
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(dfx, .(group, sex), summarize,
 mean = round(mean(age), 2),
 sd = round(sd(age), 2))
##   group sex  mean    sd
## 1     A   F 40.48 12.72
## 2     A   M 34.48 15.28
## 3     B   F 36.05  9.98
## 4     B   M 38.35  7.97
## 5     C   F 20.04  1.86
## 6     C   M 43.81 10.72

# An example using a formula for .variables
ddply(baseball[1:100, ], ~year, nrow)

##   year V1
## 1 1871  7
## 2 1872 13
## 3 1873 13
## 4 1874 15
## 5 1875 17
## 6 1876 15
## 7 1877 17
## 8 1878  3

# Applying two functions; nrow and ncol
ddply(baseball, .(lg), c("nrow", "ncol"))

##   lg  nrow ncol
## 1       65   22
## 2 AA   171   22
## 3 AL 10007   22
## 4 FL    37   22
## 5 NL 11378   22
## 6 PL    32   22
## 7 UA     9   22
{% endhighlight %}

<p>But this is not the end of the story! Something I really liked about <code>plyr</code> is that it can be parallelized via the <code>foreach</code> (<span class="showtooltip" title="Analytics R (2012). _foreach: Foreach looping construct for R_. R
package version 1.4.0, 
http://CRAN.R-project.org/package=foreach."><a href="http://CRAN.R-project.org/package=foreach">Analytics, 2012</a></span>) package. I don&#8217;t know much about <code>foreach</code>, but all I learnt is that you have to use other packages such as <code>doMC</code> (<span class="showtooltip" title="Analytics R (2013). _doMC: Foreach parallel adaptor for the
multicore package_. R package version 1.3.0, 
http://CRAN.R-project.org/package=doMC."><a href="http://CRAN.R-project.org/package=doMC">Analytics, 2013</a></span>) to actually run the code. It&#8217;s like <code>foreach</code> specifies the infraestructure to communicate in parallel (and split jobs) and packages like <code>doMC</code> tailor it for specific environments like for running in multi-core.</p>
<p>Running things in parallel can then be very easy. Basically, you load the packages, specify the number of cores, and run your <code>ply</code> function. Here is a short example:</p>

{% highlight r %}
## Load packages
library(plyr)
library(doMC)

## Loading required package: foreach
## Loading required package: iterators
## Loading required package: parallel

## Specify the number of cores
registerDoMC(4)

## Check how many cores we are using
getDoParWorkers()
## [1] 4

## Run your ply function
ddply(dfx, .(group, sex), summarize, mean = round(mean(age), 2), sd = round(sd(age), 
    2), .parallel = TRUE)

##   group sex  mean    sd
## 1     A   F 40.48 12.72
## 2     A   M 34.48 15.28
## 3     B   F 36.05  9.98
## 4     B   M 38.35  7.97
## 5     C   F 20.04  1.86
## 6     C   M 43.81 10.72
{% endhighlight %}

<p>In case that you are interested, here is a short shell script for knitting an Rmd file in the cluster and specifying the appropriate number of cores to then use <code>plyr</code> and <code>doMC</code>.</p>

{% highlight bash %}
#!/bin/bash 
# To run it in the current working directory
#$ -cwd 
# To get an email after the job is done
#$ -m e 
# To speficy that we want 4 cores
#$ -pe local 4
# The name of the job
#$ -N myPlyJob

echo "**** Job starts ****"
date

# Knit your file: assuming it's called FileToKnit.Rmd
Rscript -e "library(knitr); knit2html('FileToKnit.Rmd')"

echo "**** Job ends ****"
date
{% endhighlight %}

<p>Lets say that the bash script is named <code>script.sh</code>. Then you can submit it to the cluster queue using</p>

{% highlight bash %}
qsub script.sh
{% endhighlight %}
<p>This is what I used to re-format a large <code>data.frame</code> in a few minutes in the cluster for the <a href="https://twitter.com/search?q=%23jhsph753&amp;src=typd">#jhsph753</a> class homework project.</p>
<p>So, thank you again <a href="https://twitter.com/hadleywickham">Hadley Wickham</a> for making awesome R packages!</p>
<p>Citations made with <code>knitcitations</code> (<span class="showtooltip" title="Boettiger C (2013). _knitcitations: Citations for knitr markdown
files_. R package version 0.4-4, 
https://github.com/cboettig/knitcitations."><a href="https://github.com/cboettig/knitcitations">Boettiger, 2013</a></span>).</p>
<ul><li>Revolution Analytics, (2013) doMC: Foreach parallel adaptor for the multicore package. <a href="http://CRAN.R-project.org/package=doMC"><a href="http://CRAN.R-project.org/package=doMC">http://CRAN.R-project.org/package=doMC</a></a></li>
<li>Revolution Analytics, (2012) foreach: Foreach looping construct for R. <a href="http://CRAN.R-project.org/package=foreach"><a href="http://CRAN.R-project.org/package=foreach">http://CRAN.R-project.org/package=foreach</a></a></li>
<li>Carl Boettiger, knitcitations: Citations for knitr markdown files. <a href="https://github.com/cboettig/knitcitations"><a href="https://github.com/cboettig/knitcitations">https://github.com/cboettig/knitcitations</a></a></li>
<li>Hadley Wickham, (2011) The Split-Apply-Combine Strategy for Data Analysis. <em>Journal of Statistical Software</em> <strong>40</strong> (1) <a href="http://www.jstatsoft.org/v40/i01/"><a href="http://www.jstatsoft.org/v40/i01/">http://www.jstatsoft.org/v40/i01/</a></a></li>
</ul>
