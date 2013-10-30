---
layout: post
title: ! 'FBit: GitHub repo for posts with R code for this blog'
tags:
- knitr
categories:
- rstats
- Web
---
<p>This is a test post since I want to improve upon Jeffrey Horner&#8217;s <a href="http://jeffreyhorner.tumblr.com/post/25943954723/blog-with-r-markdown-and-tumblr-part-ii">strategy for posting R code in Tumblr</a>. The only minor improvement I wanted to try out is hosting the images directly on the web. I mean, right now the images won&#8217;t show in RSS readers. I&#8217;m not doing anything new at all, just using the imgur_upload function in <a href="http://yihui.name/knitr/">knitr</a>.</p>
<p>This is part of my plan to write paper posts. I already created the GitHub repo <a href="https://github.com/lcolladotor/FBit">FBit</a> which should host any future posts I make with knitr.</p>
<p>For now, I&#8217;m testing the post template from <a href="https://github.com/lcolladotor/FBit/blob/master/R-post-template/R-post-template.Rmd">FBit template</a></p>
{% highlight r %}library(ggplot2)
qplot(hp, mpg, data = mtcars) + geom_smooth()
{% endhighlight %}
<p><img alt="plot of chunk carplot" src="http://i.imgur.com/zfg0Gih.png"/></p>
<p>You can also visualize the test <a href="http://htmlpreview.github.com/?https://github.com/lcolladotor/FBit/blob/master/test-template/test-template.html">here</a></p>
