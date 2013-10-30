---
layout: post
title: ! 'Introduction to R and Biostatistics (2012 version): presentation'
tags:
- LCG
- rstats
- knitr
- Biostatistics
- Talk
categories:
- UNAM
- rstats
---
<p>To follow my <a href="http://fellgernon.tumblr.com/post/34677935591/introducing-r-and-biostatistics-to-first-year-lcg#.UKFlW-Oe918">Introducing R and Biostatistics to first year LCG students (2012 version)</a> post,  you can now find the presentation online from my site either in <a href="http://www.biostat.jhsph.edu/~lcollado/lcg/introR2012/intro_R_Biostat_LCG_2012_slides.html">presentation format</a>, in a <a href="http://www.biostat.jhsph.edu/~lcollado/lcg/introR2012/intro_R_Biostat_LCG_2012.html">single webpage format</a>, or the <a href="http://www.biostat.jhsph.edu/~lcollado/lcg/introR2012/intro_R_Biostat_LCG_2012.Rmd">raw Rmd file</a>. To prove the point that publishing to <a href="http://rpubs.com/">RPubs</a> is super easy, you can also find the <a href="http://rpubs.com/lcollado/2618">single webpage format over there</a>. I also like how you can comment and share in RPubs.</p>
<p>One of the challenges of giving a presentation to first year students is finding the balance between introducing them to cool things you are doing in your work and actually giving a talk that they can follow. I thought about this and ended dropping anything related to my work.</p>
<p>My presentation was split pretty much in two parts. First, I wanted to promote some philosophical discussion about what is statistics. Second, I gave a brief overview of what you can do with R. Or more exactly, what they should be able to learn to do even if they become <em>wet </em>biologists.</p>
<p>While planning this presentation, I knew that I wanted to give the new students a flavor of the three different currents in statistics. I aimed to improve <a href="http://fellgernon.tumblr.com/post/13739343319/introducing-biostatistics-to-first-year-lcg-students#.UKFl6uOe918">my 2011 explanations</a> now that I&#8217;m taking the Foundations of Statistical Inference course. I&#8217;m happy with the result and I think this is greatly due to Royall&#8217;s diagnostic test example.</p>
<p>Another key point that I wanted to emphasize was that RStudio is the way to go if you are new to R. It is very straightforward to use, plus it is nicely interegrated with <a href="http://yihui.name/knitr/">knitr</a>.</p>
<p>I decided to use R Markdown (Rmd) for the first time, after seeing how easy <a href="http://daringfireball.net/projects/markdown/">Markdown</a> really is compared to using LaTeX and Beamer. However, when it got to doing the presentation I have to say that I was a bit dissapointed by how some things just break when using the R Markdown to Markdown to HTML presentation pipeline —using <a href="http://johnmacfarlane.net/pandoc/">pandoc</a> for the last step. For example, the math breaks when using mathml or mathjax at times (like after adding an iframe for a youtube video), so I had to use webtex which doesn&#8217;t look as nice.</p>
<p>If you are interested in the commands, I used the &#8220;Knit HTML&#8221; button in R Studio [equivalent to running from R: <em>library(knitr); knit(&#8220;filename.Rmd&#8221;)</em>] and then ran the following command:</p>
<p><em>pandoc -s -S &#8212;webtex -i -t dzslides intro_R_Biostat_LCG_2012.md -o intro_R_Biostat_LCG_2012_slides.html &amp; open intro_R_Biostat_LCG_2012_slides.html</em></p>
<p>I was originally aiming to have a single Rmd file to produce an HTML presentation and a Beamer presentation. However, controlling the pictures in the Beamer output proved to be challenging. While I had a work around, the final problem was the math part. By the time I realized this it was too late —I just dropped the Beamer presentation. Googling, even the author of knitr acknowledges that the best input for PDF output is still LaTeX.</p>
<p>In the end, I&#8217;m happy that I got the HTML presentation done using R Markdown and briefly introduced it to the first year students. The basics of knitr are very easy to learn and I&#8217;m hoping that it got some of them curious enough to try it.</p>
<p>Next thing in line: prepare 5 questions for the students.</p>
