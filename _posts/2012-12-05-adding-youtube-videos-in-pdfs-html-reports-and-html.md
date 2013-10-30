---
layout: post
title: Adding youtube videos in pdfs, html reports and html presentations
tags:
- Youtube
- knitr
- pdf
- html
categories:
- Web
---
<p>I got a question today on how to add a video to a beamer pdf presentation. Well, I had never done it, but I got curious enough to google around for a bit and here is the end product.</p>
<p>One way of doing it is using the <a href="http://www.ctan.org/pkg/media9">media9</a> tex package. For this to work you need to have the latest version of texlive (or miktex). Then, it&#8217;s quite straight forward to include the video. The issue is that you have to open the pdf with Acrobat Reader 10+ (9 something works. I think that it&#8217;s 9.4.1+ but well, the point is that you need an updated version). You will also need a live web connection to actually show the video. An alternative (if you have the video file) is to convert it to swf and embed it. </p>
<p>Here is my <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video.tex">tex</a> example file with the corresponding <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video.pdf">pdf</a> output compiled using pdflatex. Remember that you need Acrobat Reader to actually see the video in the pdf.</p>
<p>After doing this, I just wanted to make some quick examples on how you can add a video to an html report using markdown (well, you add the video itself using html). I did it via <a href="http://yihui.name/knitr/">knitr</a> and <a href="http://www.rstudio.com/">Rstudio</a>.</p>
<p>Example <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_report.Rmd">Rmd</a> file with corresponding <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_report.md">md</a> and <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_report.html">html</a> * outputs from &#8220;knit HTML&#8221; in Rstudio.</p>
<p>Finally, the more interesting thing you can do is an html presentation which requires <a href="http://johnmacfarlane.net/pandoc/">pandoc</a>. Again, I used knitr to get things started and, while at it, add some R and math.</p>
<p>Example <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_web_slides.Rmd">Rmd</a> file with corresponding <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_web_slides.md">md</a> and <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_web_slides.html">html</a> * output from &#8220;knit HTML&#8221; in Rstudio. The slides are created from the md file using pandoc into this <a href="http://www.biostat.jhsph.edu/~lcollado/misc/video_in_beamer/video_in_web_slides_pre.html">html</a> ** file (main output in this case). </p>
<p>Hopefully they&#8217;ll be useful to anyone venturing into embedding youtube videos in their presentations.</p>
<p>* These two files are very similar.</p>
<p>** html presentation.</p>
