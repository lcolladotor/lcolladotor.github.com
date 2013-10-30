---
layout: post
title: Introducing Biostatistics to first year LCG students
tags:
- Bioconductor
- LCG
- rstats
- Talk
categories:
- rstats
- UNAM
---
<p>Around two weeks ago I gave a talk via skype to the first year students from the <a href="http://www.lcg.unam.mx/about">Undergraduate Program on Genomic Sciences</a> (LCG in Spanish) from the National Autonomous University of Mexico (UNAM in Spanish). The talk was under the context of the <em>Introduction to Bioinformatics Seminar Series</em> whose goal is to familiarize the new students with the bioinformatics world. It used to be a course heavy on exploring database websites, some basic theory, and lots of new concepts and algorithm names. Like, what is BLAST? This year, the course involved several talks from former students (like myself) on their experience and current job (most of us are in graduate school).</p>
<p>In my case, I was invited to talk about Biostatistics and R as I was one of the first LCG students to learn and teach R to other students (including PhD students ^^): <a href="http://www.lcg.unam.mx/~lcollado/R/">12 hour intro to R and Bioconductor</a>, <a href="http://www.lcg.unam.mx/~lcollado/E/">R in an intro to statistics course</a>, a <a href="http://www.lcg.unam.mx/~lcollado/B/">full course on Bioconductor</a>. </p>
<p>I had a lot of fun preparing my talk as I tried to portray the three main currents in Biostatistics in a way that would be understandable, basic concepts such as a P-value, some basic R code (the students knew the super basics only), and doing so in a way that I would also pass how I see things. A key part for any bioinformatician, as I see it, is to have a good basic toolset. That&#8217;s why I tried to pass on many tips to these young students. Also, I do like to go back to the philosophy of science and whether we need hypothesis nowadays or just models based on the data. I definitely had to cover the topic of communication as I strongly believe that any researcher has to be able to communicate with a biostastician if they want their help in analyzing their data. Also, a biostatistician is not a stastistician, meaning that they have to understand the underlying biological question. I tried emphasizing this point with the students and I attempted to motivate them to take a basic stastistics and probability course (2 preferably). After all, biostatistics is key nowadays in science since biology has gone high-throughput.</p>
<p>Giving the talk through skype was definitely a new experience for me. The best is to be in the classroom as you miss a lot of the interaction with the students. For instance, I didn&#8217;t always know who as asking the question and frequently I had to ask them to repeat it louder. Plus, I chose to share my desktop with them instead of having them watch at my face all the time. I guess it wasn&#8217;t easy for them to just watch a screen with a background voice for 2 hours :P But well, I hoped they liked it as much as I liked preparing it.</p>
<p>If you are interested in the talk, I uploaded the <a href="https://docs.google.com/open?id=0B-mxZfuflcuONmY1MGI3ZjEtN2JjNy00MDNiLTk0NmMtYjdiNDAwNTZmNGNj">PDF file</a>, the associated <a href="https://docs.google.com/open?id=0B-mxZfuflcuOZTkxMDUzY2ItNmMzYi00ZDcyLTgyMTQtMWI5YzJmN2IzZjUw">R file</a> and the master <a href="https://docs.google.com/open?id=0B-mxZfuflcuOYTY3OTQ4NjUtZTFkOC00MGQ5LThiMzgtNDQ2ZjY2NmZlY2Zi">Rnw file</a> to Google Docs. The Rnw file can be useful if you are learning how to write Beamer presentations using Sweave and LaTeX.</p>

<p>Finally, I was asked to prepare two short questions so that the teachers can evaluate the students. As a bonus for any of them reading my blog ^^ (I did portray blogs as an excellent way to update yourself) here they are:</p>
<ol><li>Argue why you need to learn (at least basic) Biostatistics and why it&#8217;s useful nowadays to analyze biological data.</li>
<li>Based on the data from your recent experiment, you construct a 95% confidence interval (frequentist approach) for the mean of your variable of interest. What is the probability that the true mean of the distribution is contained in the confidence interval.</li>
<li>Bonus: list 5 basic R plotting functions</li>
</ol><p>Answers:</p>
<ol><li>You need to learn the basics (at least) of Biostatistics in order to be able to communicate with your biostatistician collaborator, and to analyze your own data specially by performing exploratory data analyses (EDA). Also, biological experiments nowadays generate a lot of data as biology has gone high-throughput. Biostatistics is specially useful in order to analyze all this data.</li>
<li>0 or 1 and you cannot know which is the case for your specific dataset.</li>
<li>I mentioned: plot, hist, boxplot, qqplot, qqnorm, lines, points, abline, legend</li>
</ol>
