---
layout: post
title: Predicting who will win a NFL match at half time
tags:
- NFL
- jhsph753
- Adv_NFL_Stats
- rstats
- Prediction
categories:
- rstats
- JHU Biostat
---
<p>It was great to have a little break, <em>Spring break</em>, although the weather didn&#8217;t feel like spring at all! During the early part of the break I worked on my final project for Jeff Leek&#8217;s data analysis class, which we call 140.753 here. Continuing <a href="http://fellgernon.tumblr.com/tagged/jhsph753#.UU44Y1vF2c4">my previous posts on the topic</a>, this time I&#8217;ll share the results of my final project.</p>
<p>At the beginning of the course, we had to submit a project plan (more like a proposal) and <a href="https://github.com/lcolladotor/lcollado753/blob/master/hw/projectplan/lcollado_projectplan.pdf">in mine</a> I announced my interest to look into some sports data. At the time I included a few links to Brian Burke&#8217;s Advanced NFL Stats site (<span class="showtooltip" title="(2013). Advanced NFL Stats.   http://www.advancednflstats.com/ [Online. last-accessed:  2013-03-23 23:28:38].  http://www.advancednflstats.com/."><a href="http://www.advancednflstats.com/">Burke</a></span>). At the time I didn&#8217;t know that Burke&#8217;s site described in detail a lot of the information I would end up using.</p>
<p>My final project had to do with splitting NFL games by half and then use only the play-by-play data from the first half to predict if team A or B would win the game. My overall goal was to have some fun with sports data which I had never looked at, but then also try to come up with something I would personally use in the future. So, why split games by half? I personally would like to know if I should keep watching a game or not at half time. Having a tool to help me decide would be great, and well, if the team I&#8217;m rooting for has high chances of losing or winning, ideally I would switch to doing something else. A related question that I didn&#8217;t try to answer is which half is worth watching? This would be a meaningful question if you only have time to watch one of them.</p>
<p>To truly satisfy my goals, it wasn&#8217;t enough to just build a predictive model. That is why I also built a web application using the <code>shiny</code> package (<span class="showtooltip" title="RStudio and Inc. (2013). _shiny: Web Application Framework for R_.  R package version 0.4.0,   http://CRAN.R-project.org/package=shiny."><a href="http://CRAN.R-project.org/package=shiny">RStudio and Inc., 2013</a></span>). It was the first time I did a shiny app, but thanks to the good manual and some examples on GitHub from John Muschelli like his <a href="https://github.com/muschellij2/Shiny_model">Shiny_model</a> it wasn&#8217;t so bad. I thus invite you to test and browse my shiny app at <a href="http://glimmer.rstudio.com/lcolladotor/NFLhalf/"><a href="http://glimmer.rstudio.com/lcolladotor/NFLhalf/">http://glimmer.rstudio.com/lcolladotor/NFLhalf/</a></a>. It could be improved by adding some functions that scrape live data for the 2013 season so you don&#8217;t have to input all the variables needed by using the sliders. Anyhow, I&#8217;m happy with the result.</p>
<p>The entire project&#8217;s code, EDA steps, shiny app, and report are available via GitHub in my repository (<span class="showtooltip" title="lcolladotor (2013). lcollado753.   https://github.com/lcolladotor/lcollado753 [Online.  last-accessed: 2013-03-21 02:23:49].   https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half."><a href="https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half">lcollado753</a></span>). While the details are in the report, I&#8217;ll give a brief summary here.</p>
<p>Basically, I summarized the play-by-play data for all NFL games from 2002 to 2012 seasons as provided by Burke (<span class="showtooltip" title="(2010). Advanced NFL Stats: Play-by-Play Data.   http://www.advancednflstats.com/2010/04/play-by-play-data.html  [Online. last-accessed: 2013-03-24 00:08:20].   http://www.advancednflstats.com/2010/04/play-by-play-data.html."><a href="http://www.advancednflstats.com/2010/04/play-by-play-data.html">Burke, 2010</a></span>). I used some of the variables Burke uses (<span class="showtooltip" title="(2009). Advanced NFL Stats: How the Model Works-A Detailed  Example Part 1.   http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html  [Online. last-accessed: 2013-03-24 00:08:21].   http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html."><a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html">Burke, 2009</a></span>) and some others like the score difference, who starts the second half, and the game day winning percentages of both teams. After exploring the data, I discarded the years 2002 to 2005. Then, I trained a model using the 2006 to 2011 data and did some quick model selection. Note that I&#8217;m not doing the adjustment by opponent the way Burke did it (<span class="showtooltip" title="(2009). Advanced NFL Stats: How the Model Works-A Detailed  Example Part 2.   http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html  [Online. last-accessed: 2013-03-24 00:08:23].   http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html."><a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html">Burke, 2009-2</a></span>) in part because I was running out of time, but also because the model already uses the current game winning percentages of both teams to consider the two team&#8217;s strength. I evaluated the model using the 2012 data and after seeing that it worked decently enough, I trained a second model using the data from 2006 to 2012 so it can be used for the 2013 season. These two trained models are the ones available in the shiny app I made.</p>
<p>In the report, I didn&#8217;t include ROCs—a big miss—so here they go. The code I will show below is heavily based on a post on GLMs (<span class="showtooltip" title="denishaine (2013). Veterinary Epidemiologic Research: GLM  \ Evaluating Logistic Regression Models (part 3).   http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/  [Online. last-accessed: 2013-03-23 22:51:49].   http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/."><a href="http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/">denishaine, 2013</a></span>). The code below is written in a way that you can easily reproduce it if you have cloned my repository for the 140.753 class (<span class="showtooltip" title="lcolladotor (2013). lcollado753.   https://github.com/lcolladotor/lcollado753 [Online.  last-accessed: 2013-03-21 02:23:49].   https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half."><a href="https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half">lcollado753</a></span>).</p>
<p>First, some setup steps.</p>

{% highlight r %}
## Specify the directory where you cloned the lcollado753 repo
maindir <- "whereYouClonedTheRepo"
## Load packages needed
suppressMessages(library(ROCR))
library(ggplot2)

## Load fits.
## Remember that 1st one used data from 2006 to 2011
## and the 2nd one used data from 2006 to 2012.
load(paste0(maindir, "/lcollado753/final/nfl_half/EDA/model/fits.Rdata"))
{% endhighlight %}

<p>Next, I make the ROCs for both trained models using the data that they were trained on. They should be quite good since it uses the same data to build the model that it will then try to predict.</p>

{% highlight r %}
## Make the ROC plots

## Simple list where I'll store all the results so I can compare the ROC plots later on
all <- list()

## Construct prediction function
for(i in 1:2) {
	## Predict on the original data
	pred <- predict(fits[[i]])
	
	## Subset original data (remove NA's)
	data <- fits[[i]]$data
	data <- data[complete.cases(data),]
	
	## Construct prediction function
	pred.fn <- prediction(pred, data$win)
	
	## Get performance info
	perform <- performance(pred.fn, "tpr", "fpr")
	
	## Get ready to plot
	toPlot <- data.frame(tpr = unlist(slot(perform, "y.values")), fpr = unlist(slot(perform, "x.values")))
	all <- c(all, list(toPlot))

	## Make the plot
	res <- ggplot(toPlot) + geom_line(aes(x=fpr, y=tpr)) + geom_abline(intercept=0, slope=1, colour="orange") + ylab("Sensitivity") + xlab("1 - Specificity") + ggtitle(paste("Years 2006 to", c("2011", "2012")[i]))
	print(res)
	
	## Print the AUC value
	print(unlist(performance(pred.fn, "auc")@y.values))
}
{% endhighlight %}

<p><img alt="plot of chunk ROC" src="http://i.imgur.com/b1FS2ml.png"/></p>
{% highlight r %}
## [1] 0.8506
{% endhighlight %}
<p><img alt="plot of chunk ROC" src="http://i.imgur.com/f2UOySy.png"/></p>

{% highlight r %}
## [1] 0.8513
{% endhighlight %}

<p>Both ROC plots look pretty similar (well, the data sets are very similar!) and have relatively high AUC values.</p>
<p>Next, I make the ROC plot using the model trained with the data from 2006 to 2011 to predict the outcomes for the 2012 games.</p>

{% highlight r %}
## Load 2012 data
load(paste0(maindir, "/lcollado753/final/nfl_half/data/pred/info2012.Rdata"))

## Predict using model fit with data from 2006 to 2011
pred <- predict(fits[[1]], info2012)

## Construction prediction function
pred.fn <- prediction(pred, info2012$win)

## Get performance info
perform <- performance(pred.fn, "tpr", "fpr")

## Get ready to plot
toPlot <- data.frame(tpr = unlist(slot(perform, "y.values")), fpr = unlist(slot(perform, "x.values")))
all <- c(all, list(toPlot))

## Make the plot
ggplot(toPlot) + geom_line(aes(x=fpr, y=tpr)) + geom_abline(intercept=0, slope=1, colour="orange") + ylab("Sensitivity") + xlab("1 - Specificity") + ggtitle("Model trained 2006-2011 predicting 2012")
{% endhighlight %}

<p><img alt="plot of chunk pred2012" src="http://i.imgur.com/DDcsW7W.png"/></p>

{% highlight r %}
## Print the AUC value
print(unlist(performance(pred.fn, "auc")@y.values))
## [1] 0.816
{% endhighlight %}

<p>The steps in the curve are more visible since it is using less data. It also seems to be a little less good than the other two, as expected. This is clear when comparing the AUC values.</p>
<p>Finally, I plot all curves in the same picture to visually compare them.</p>

{% highlight r %}
names(all) <- c("train2011", "train2012", "pred2012")
for(i in 1:3) {
	all[[i]] <- cbind(all[[i]], rep(names(all)[i], nrow(all[[i]])))
	colnames(all[[i]])[3] <- "set"
}
all <- do.call(rbind, all)

ggplot(all) + geom_line(aes(x=fpr, y=tpr, colour=set)) + geom_abline(intercept=0, slope=1, colour="orange") + ylab("Sensitivity") + xlab("1 - Specificity") + ggtitle("Comparing ROCs")
{% endhighlight %}

<p><img alt="plot of chunk allInOne" src="http://i.imgur.com/tUVfgfs.png"/></p>
<p>Both ROCs with the trained data (train2011, train2012) are nearly identical and both are slightly superior to the one predicting the 2012 games.</p>
<p>Overall I am happy with the results and while some things can certainly be improved, I look forward to the NFL 2013 season. Also, remember that Burke publishes his winning estimated probabilities from week 4 onward (<span class="showtooltip" title="BURKE BB (2013). Brian Burke - The Fifth Down Blog -  NYTimes.com.   http://fifthdown.blogs.nytimes.com/author/brian-burke/ [Online.  last-accessed: 2013-03-24 00:26:32].   http://fifthdown.blogs.nytimes.com/author/brian-burke/."><a href="http://fifthdown.blogs.nytimes.com/author/brian-burke/">The Fifth Down Blog</a></span>). So you might be interested on comparing the probability at half time versus his estimated probability which is calculated before the game starts. I mean, maybe you could use the difference between the two to have an idea of how unexpected the first half was. After all, if a game falls outside the pattern it might be worth watching.</p>
<p>Citations made with <code>knitcitations</code> (<span class="showtooltip" title="Boettiger C (2013). _knitcitations: Citations for knitr markdown  files_. R package version 0.4-4,   https://github.com/cboettig/knitcitations."><a href="https://github.com/cboettig/knitcitations">Boettiger, 2013</a></span>).</p>
<ul><li>lcolladotor, lcollado753. <em>GitHub</em> <a href="https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half"><a href="https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half">https://github.com/lcolladotor/lcollado753/tree/master/final/nfl_half</a></a></li>
<li>denishaine, (2013) Veterinary Epidemiologic Research: GLM &amp;ndash; Evaluating Logistic Regression Models (part 3). <em>denis haine</em> <a href="http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/"><a href="http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/">http://denishaine.wordpress.com/2013/03/19/veterinary-epidemiologic-research-glm-evaluating-logistic-regression-models-part-3/</a></a></li>
<li>Advanced NFL Stats. <a href="http://www.advancednflstats.com/"><a href="http://www.advancednflstats.com/">http://www.advancednflstats.com/</a></a></li>
<li>(2010) Advanced NFL Stats: Play-by-Play Data. <a href="http://www.advancednflstats.com/2010/04/play-by-play-data.html"><a href="http://www.advancednflstats.com/2010/04/play-by-play-data.html">http://www.advancednflstats.com/2010/04/play-by-play-data.html</a></a></li>
<li>(2009) Advanced NFL Stats: How the Model Works–A Detailed Example Part 1. <a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html"><a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html">http://www.advancednflstats.com/2009/01/how-model-works-detailed-example.html</a></a></li>
<li>(2009) Advanced NFL Stats: How the Model Works–A Detailed Example Part 2. <a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html"><a href="http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html">http://www.advancednflstats.com/2009/01/how-model-works-detailed-example-part-2.html</a></a></li>
<li>By BURKE, Brian Burke - The Fifth Down Blog - NYTimes.com. <em>The Fifth Down Â» Brian Burke</em> <a href="http://fifthdown.blogs.nytimes.com/author/brian-burke/"><a href="http://fifthdown.blogs.nytimes.com/author/brian-burke/">http://fifthdown.blogs.nytimes.com/author/brian-burke/</a></a></li>
<li>Carl Boettiger, knitcitations: Citations for knitr markdown files. <a href="https://github.com/cboettig/knitcitations"><a href="https://github.com/cboettig/knitcitations">https://github.com/cboettig/knitcitations</a></a></li>
<li>RStudio , Inc. , (2013) shiny: Web Application Framework for R. <a href="http://CRAN.R-project.org/package=shiny"><a href="http://CRAN.R-project.org/package=shiny">http://CRAN.R-project.org/package=shiny</a></a></li>
</ul>
