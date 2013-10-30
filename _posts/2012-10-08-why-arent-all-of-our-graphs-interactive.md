---
layout: post
title: Why aren't all of our graphs interactive?
tags:
- Graphics
- Interactive
- rstats
- Talk
categories:
- JHU Biostat
- Ideas
---
<p>During the last pre-happy hour seminar, <a href="http://www.biostat.wisc.edu/~kbroman/">Karl Broman</a> talked about <a href="http://www.biostat.wisc.edu/~kbroman/presentations/DynamicGraphs/">Why aren&#8217;t all of our graphs interactive?</a> I didn&#8217;t know, but a few years ago Karl worked in the department and clearly promoted beer-drinking and is <em>the heart of the department. </em>I&#8217;m a fan of our pre-happy hour seminars since you have a get to listen to good/fun talks over a beer or two.</p>
<p>But I&#8217;m also a fan of reproducible research and useful graphics. I do most of this by using <a href="http://www.statistik.lmu.de/~leisch/Sweave/">Sweave</a> (for reproducibility) in LaTeX documents and with the R packages <a href="http://cran.r-project.org/web/packages/lattice/index.html">lattice</a>, <a href="http://cran.r-project.org/web/packages/car/index.html">car</a>, and <a href="http://cran.r-project.org/web/packages/plotrix/index.html">plotrix</a>, and some <a href="http://ggplot2.org/">ggplot2</a> (I should use it more). </p>
<p>Karl made <a href="http://www.biostat.wisc.edu/~kbroman/presentations/DynamicGraphs/">his presentation</a> using html (definitely check it out!) and inserted pretty interactive graphics. His talk got me really interested and I definitely need to pick up a few tools. For example, asciidoc or R Markdown can be useful for making html documents with R code. Specially if you want to write a report and you don&#8217;t want to deal with Sweave/Latex when making plots (can be a pain to know where they&#8217;ll show up). </p>
<p>For the interactive side, D3 (and other tools Karl listed) can be useful to learn. But I might put this on a hold for some time. Maybe I&#8217;ll wait and see what others in the deparment are developing for R-D3 and embedding interactive plots in pdf files.</p>
<p>I don&#8217;t think that it will be long before interactive plots make it to the journals. Specially for their web versions. Though, I still think that if you are showing a 3D plot, as the author you will have to give a few default views where you can clearly see something that you want to talk about instead of having the reader find that sweet spot. </p>
<p>One problem that I don&#8217;t think has been solved yet is reproducible research on a cluster. Karl and others mentioned <a href="http://www.gnu.org/software/make/manual/make.html">make</a> as well as having if/else clauses where you either show the output or a cleaned up version of the code that you used to generate the output. </p>
<p>Overall, there are many tools and tips I can learn from Karl. And I&#8217;m sure that I&#8217;m not the only one! Hopefully he&#8217;ll give tips on where to start (nothing is more tedious than reading UNIX man-files).</p>
