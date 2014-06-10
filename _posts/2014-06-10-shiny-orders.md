---
layout: post
title: Concerns that can deter potential orders for developing Shiny apps
tags:
- shiny
categories:
- rstats
---
{% include JB/setup %}






A few weeks ago I was invited to a meeting where a group was interested in exploring options for replacing their contract with a propriety software. They invited me because they saw some resemblances between a [Shiny](http://shiny.rstudio.com/) application I made and the features they need. It is a relatively small project and it seemed feasible to implement, but well, some details could have been tricky to code. During the meeting I explained what [Shiny](http://shiny.rstudio.com/) is, showcased some of the [Shiny](http://shiny.rstudio.com/) apps I've made, and proposed some options including a simple site password.

A few days after the meeting, they raised three concerns.

1. Privacy and security of their data. Specially with distribution of the site password.
2. Technical support. They wanted something more than community support.
3. Continuity of the project. Specially since their team might lack the technical expertise to support and modify the Shiny app after it is built.

These are all valid concerns and they are not something I have dealt with or been concerned with other [Shiny](http://shiny.rstudio.com/) apps I have deployed. Thus, I ended up finding more information and writing up a long reply which I am modifying into a post format here. If you identify other ways to approach these concerns that I missed, share the knowledge please!

## Shiny overview

<center>
<a href="http://lcolladotor.github.io/figs/2014-06-10-shiny-orders/HelloShiny.png"><img src="http://lcolladotor.github.io/figs/2014-06-10-shiny-orders/HelloShiny.png" alt="Workflow" style="width: 458px;"/></a>
</center>

[Shiny](http://shiny.rstudio.com/) is an `R` package that allows creating web applications with `R`. A user opens the app on their browser, specifies a given set of inputs, these are transmitted to an `R` session, some code is evaluated with the input options, output is produced and transmitted back to the browser. Because it is so easy to use and useful, it has been very popular. That is the gist of it!


## Deploying a Shiny app

Once you develop a [Shiny](http://shiny.rstudio.com/) app, you have to deploy it on a server so users can access it through their browsers. Here I describe several options to do so.

The application itself needs "Shiny Server" to run. An implementation of Shiny Server is free via [ShinyApps](http://shinyapps.io/) (__option 1__) or if you have your own server you can install the open source version of Shiny Server (__option 2__). Alternatively, you can pay for Shiny Server Pro and also install it in your own server (__option 3__). Note that glimmer.rstudio.com is previous version of [ShinyApps](http://shinyapps.io/) and you can no longer get accounts on this server.

Option 1 has the advantage of being completely free and that there is no need to pay for your own server. It does rely on [ShinyApps](http://shinyapps.io/) being online, which should not be a main problem since it is hosted on the cloud. Meaning that it is supposed to be robust.

Option 2 has the advantage of having technical support for the server (not the app) from whoever is providing the server (could be a company or the school). However, you need to have someone capable of installing Shiny Server and updating it whenever it's necessary to do so.

Option 3 allows you to have high level password security (via SSL) to any Shiny app you host. Plus [RStudio](http://www.rstudio.com/) provides technical support for Shiny. The server technical support would still have to come from whoever is providing the server. The main disadvantage is that this option is very expensive (even with the academic pricing discount).

Here is some information you might be interested on checking about Shiny:

* [Main site for Shiny](http://www.rstudio.com/shiny/)
* [Description for Shiny Server and Shiny Server Pro](http://www.rstudio.com/shiny/server/)
* [Academic pricing for Shiny Server Pro](http://www.rstudio.com/shiny/commercial/academic-pricing)
* [Description of ShinyApps](http://www.rstudio.com/shiny/hosted/)
* [Site for learning how to code a web app using Shiny](http://shiny.rstudio.com/)
* [Examples of Shiny apps](http://shiny.rstudio.com/gallery/)


## Concerns

### Privacy

Privacy issues in terms of password sharing can be limited by changing the password frequently. Privacy in terms of protection versus hacking is a different subject and I could implement something like [this demo](http://spark.rstudio.com/withr/authentication/) (username: withr, password: 12345678) as described in this [blog post](http://withr.me/blog/2014/02/14/encrypt-users-password-with-md5-for-you-shiny-app/). However, if you want further protection vs hacking, you would need Shiny Server Pro. [Here is a demo](http://shiny.rstudio.com/gallery/authentication-and-database.html) of the security provided by Shiny Server Pro  (with multiple users too). I understand that hacking was not the main concern you had, but well, as I said password-sharing can be mitigated by frequent changes to the app site.

### Technical support

I mostly answered the different options regarding technical support when I described the three options for deploying a Shiny app. As for getting support from IT, they would need to learn how to use Shiny.

### Continuity

Shiny is one of the most important projects for [RStudio](http://www.rstudio.com/) so they invest a lot in it, the community provides great answers very quickly, and a lot of people are learning how to use it. If you need an R programmer later on instead of a student, you could describe the job at [R Users](http://www.r-users.com/) and employ someone that way. As far as the Biostats department is concerned, I know that several students are using Shiny and some have even published Shiny Apps in the academic literature. Here are some examples:

* [interAdapt](http://spark.rstudio.com/mrosenblum/interAdapt/) is a Shiny app written by Aaron Fisher (Biostats student) and published [here](http://biostats.bepress.com/jhubiostat/paper262/).
* shinymethyl, a shiny application developed by Jean-Philippe Fortin described [here](http://shinymethyl.com/) with a [demo here](http://spark.rstudio.com/jfortin/shinyMethyl/).
* [committees](https://alyssafrazee.shinyapps.io/committees/) is a Shiny app made by Alyssa Frazee for verifying your school oral and/or defense committees. It's described in [this post](http://alyssafrazee.com/committee-checker-2.html).
* [ENAR 2014](https://muschellij2.shinyapps.io/ENAR_2014) is a Shiny app made by John Muschelli for the ENAR2014 conference which allowed you to quickly identify talks you might be interested in. It's described in [this post](http://hopstat.wordpress.com/2014/03/12/enar-2014-searcher-enar2014/).

### Branding

Regarding branding, a Shiny App can be embedded on a website. For illustrating this, I embedded two apps I made [here](http://www.biostat.jhsph.edu/~lcollado/testShiny.html).



## Conclusions

In the end, this group decided to use something else instead of a [Shiny](http://shiny.rstudio.com/) app for now. I do not know exactly why they made that decision, but I can see that their concerns are probably shared with other potential [Shiny](http://shiny.rstudio.com/) users. These concerns are a challenge [RStudio](http://www.rstudio.com/) must be dealing with and I am curious to know how they would have approached them.


#### Want more?



Check other [@jhubiostat](https://twitter.com/jhubiostat) student blogs at [Bmore Biostats](http://bmorebiostat.com/) as well as topics on [#rstats](https://twitter.com/search?q=%23rstats).

This post is part of the summer 2014 [Bmore Biostats](http://bmorebiostat.com/)' iron blogger challenge.
