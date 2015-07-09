---
layout: post
title: Teaching a short topic to beginner R users
tags:
- teaching
- rstats
categories:
- rstats
---
{% include JB/setup %}








A couple weeks ago I was given the opportunity to teach a 1 hr 30 min slot of an introduction to `R` course. In the past, I've taught lectures for similar courses, and I ended up asking myself what would be the best short topic to teach and how to teach it.

## Best short topic

There are two ways to answer the first question, one boring and one more interesting. The boring answer is that the course instructor selected the topic. The interesting one goes like this. I have taken short `R` courses before and taught others, and it's always overwhelming for the students. You get to cover many concepts, get familiarized with `R`'s syntax, and in the end without lots of practice it's very challenging to retain much of the information. I think that students love it when they learn how to do something simple that could be the first building block for many of their projects. In parallel, I think that one of the coolest `R` topics you can learn in an hour is how to create reproducible documents with `rmarkdown` <a id='cite-rmarkdown'></a>(<a href='http://CRAN.R-project.org/package=rmarkdown'>Allaire, Cheng, Xie, McPherson, et al., 2015</a>). 

Learning how to use a single function, `render()` in this case, is as simple as it gets. And using the [RStudio Desktop](http://www.rstudio.com/products/rstudio/#Desktop) is even simpler. Of course, it can easily get complicated. For example, on a new computer you need to install all the LaTeX dependencies if you want to create PDF files. That task can take some time and maybe scare away some new users. But PDF files are really a plus in this case since you can start creating HTML and Word documents. Other complications arise when a user is interested in more control over formatting the file, but like I said earlier, all you need is a simple building block and `rmarkdown` is clearly one of them. 

This is why the final answer to the first question was teaching how to use `rmarkdown` to create reproducible reports (HTML, Word files) using `R`.



## How to teach it

Teaching a short topic to a beginner's audience is no easy feat. In the past I've made lectures that have the code for every single step and many links to resources where students can learn some details. That is, I've created the lectures in such a way that a student can later use them as reference and follow them without an instructor explaining them. 

That's a strategy that I think works on the long run. However, it makes the actual lecture boring and very limited in interactivity. At the JHSPH biostat computing club, other students have chosen to use a lot of images, funny to witty quotes, and asked listeners to voice their opinions. I've come to enjoy those presentations and I decided to create my lecture following that trend.

I started off with a series of questions about reproducible research and asked students to voice their opinions and to define a few key concepts. A couple were aware of the difference between reproducibility and replicability, but most were not. I also questioned them and presented them verbally with some famous cases, so they could realize that it's a fairly complicated matter. Next I presented some answers and definitions from the [_Implementing Reproducible Research_](https://osf.io/s9tya/wiki/home/) book. 

Specifically talking about `R`, I showed the students several documents I've created in the past and asked whether they thought that they could reproduce the results or not. Basically, I wanted to highlight that when using `R`, you really need the session information if you want to reproduce something. Specially if the analysis involves packages under heavy development.

After having motivating the need for reproducible documents, I briefly showed what `rmarkdown` is with some images from RStudio shown below. 

![Markdown overview](http://rmarkdown.rstudio.com/images/markdownOverview.png)

![Markdown and R](http://rmarkdown.rstudio.com/images/markdownChunk.png)

That gave the students a general idea of how these documents look when you are writing them. But the most important part was showing them examples of how the resulting documents look like. That is, I showed them some complicated projects so they could imagine doing one themselves. The examples included some books, but given the audience I think that the one that motivated them most was Alyssa Frazee's `polyester` reproducible paper (check the [source here](https://github.com/leekgroup/polyester_code/blob/master/polyester_manuscript.Rmd)). I also showed them some of the cool stuff you can create with HTML documents: basically adding interactive elements.

From there, we left the presentation and I demo'ed how to use RStudio to write `rmarkdown` documents, the Markdown syntax, where to find help, etc.

![Lets code](http://dgdc5.digitalgameslearning.org/dgdc_5th/wp-content/uploads/lc.png)


By this point, I think the lecture was quite complete and the students were motivated. However, from my past experience, I've come to realize that students will easily forget a topic if they don't practice doing it. That is why even before making the lecture I spent quite a bit of time designing two practice labs. Both labs involved creating a `rmarkdown` document. 

The first lab included some cool illusion plots which involved a lot of `R` code. The code wasn't the point, but simply learning some of the basics such as what is a code chunk, some of Markdown's syntax, specifying some code chunk options, adding the session information, and using inline `R` code to show the date when the document was made. Ahh, and of course, uploading your HTML document to [RPubs](http://rpubs.com/) (see [mine](http://rpubs.com/lcollado/illussion2015)). I know that not everyone is a fan of RPubs, but I imagined that students would get super excited that they made something that they could then show their colleagues and friends. And some did! 

Sadly, we didn't have enough time for the second lab. I did explain to the students what it was about, but they didn't have time to do it themselves. For this second document, I wanted the students to learn how to create a document reporting some results where all the numbers in the text are written by `R` instead of copy-pasting them.

## Conclusions

As you can see, I enjoyed thinking what to teach and specially how to teach a short topic to beginner `R` students. Thanks to having one of the later sessions, I could teach them how to use `rmarkdown` in a way that hopefully left them highly motivated to do it themselves. I hope that most of them will take that they learned in that module and others and apply them in their day to day work.

### References

You can find the lecture itself [here](http://www.aejaffe.com/summerR_2015/modules/module12.html) but like I said earlier, it was designed for class and not for being used as a reference. However, the [lab](http://www.aejaffe.com/summerR_2015/labs/module12_lab.R) and it's [key](http://www.aejaffe.com/summerR_2015/labs/mapping_module_labkey.R) might be more useful.


Citations made with `knitcitations` <a id='cite-knitcitations'></a>(<a href='http://CRAN.R-project.org/package=knitcitations'>Boettiger, 2015</a>).


<p><a id='bib-rmarkdown'></a><a href="#cite-rmarkdown">[1]</a><cite>
J. Allaire, J. Cheng, Y. Xie, J. McPherson, et al.
<em>rmarkdown: Dynamic Documents for R</em>.
R package version 0.7.
2015.
URL: <a href="http://CRAN.R-project.org/package=rmarkdown">http://CRAN.R-project.org/package=rmarkdown</a>.</cite></p>

<p><a id='bib-knitcitations'></a><a href="#cite-knitcitations">[2]</a><cite>
C. Boettiger.
<em>knitcitations: Citations for Knitr Markdown Files</em>.
R package version 1.0.6.
2015.
URL: <a href="http://CRAN.R-project.org/package=knitcitations">http://CRAN.R-project.org/package=knitcitations</a>.</cite></p>




### Want more?

Check other [@jhubiostat](https://twitter.com/jhubiostat) student blogs at [Bmore Biostats](http://bmorebiostat.com/) as well as topics on [#rstats](https://twitter.com/search?q=%23rstats).
