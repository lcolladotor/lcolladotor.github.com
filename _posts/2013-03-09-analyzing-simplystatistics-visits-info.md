---
layout: post
title: Analyzing SimplyStatistics visits info
tags:
- DataAnalysis
- Blog
- ! '@simplystats'
- jhsph753
categories:
- JHU Biostat
- rstats
---
<p>Recently we had to analyze the data of the number of visits per day to <a href="http://simplystatistics.org/">SimplyStatistics.org</a>. There were two goals:</p>
<ol><li>Estimate the fraction of visitors retained after a spike in the number of visitors</li>
<li>Identify (if any) any factors that influence the fraction estimated in 1.</li>
</ol><p>For me it was a fun project in part because I like SimplyStatistics but also because I think that finding the answers to the questions would be interesting and help understand the readers of that blog.</p>
<p>Sadly, I didn&#8217;t work on it much. We had lots of stuff due that week, but well, I&#8217;m happy enough with the analysis I did. My own report is hosted <a href="https://github.com/lcolladotor/lcollado753/tree/master/hw/data-analysis-02">here</a> and <a href="https://github.com/lcolladotor/lcollado753/blob/master/hw/data-analysis-02/report/data_02_lcollado.pdf" target="_blank">this is the pdf file of the report itself</a>.</p>
<p>Half joking with other students, I said that I basically did t-tests. Hopefully I can work on changing this tendency with the pile of recommended books I&#8217;ve been acquiring but not really reading through. Except for the <a href="http://bit.ly/13MyHwt">ggplot2: Elegant Graphics for Data Analysis</a> and the <a href="http://oreil.ly/Yk8xtl">R Graphics Cookbook</a>. Sounds like spring break will be fun :P</p>

<p>Kind of related to this, <a href="http://bit.ly/13MypWw">Jeff Leek announced yesterday that he is going to  compile a list of student blogs that have something to do with statistics and data</a>. He added a link to my blog which is why I saw a large peak of Fellgernon Bit&#8217;s visitor data. After all, when doing the data analysis described above I played around with the data from Fellgernon Bit and now know that at a minimum posting drives visitor&#8217;s into sites (which sounds obvious, but maybe you get random traffic) —see <a href="https://github.com/lcolladotor/lcollado753/blob/master/hw/data-analysis-02/report/data_02_lcollado.pdf">fig 1 of the report</a>.</p>
<p><img alt="image" src="http://media.tumblr.com/f5ce3511fb8d6899a613e348a846dcc8/tumblr_inline_mjf4iavs4A1qz4rgp.png"/></p>

<p>Had Jeff done so before, I could have a point estimate (but without being able to say something about the uncertainty of it) that SimplyStatistics has 142 visitors that read the posts AND click on the links. Maybe using the info from <a href="http://bit.ly/12vVmbp">Hilary&#8217;s</a> and <a href="http://bit.ly/13MyyZS">Alyssa&#8217;s</a> blogs we could have an estimate with some measure of uncertainty, but only for March 8th.</p>
