---
layout: post
title: Bmore Biostats is born!
tags:
- Blog
categories:
- Web
- JHU Biostat
---
{% include JB/setup %}





In recent weeks, I have met with a group of students [@jhubiostat](https://twitter.com/jhubiostat) interested in blogging about their research, tutorials, pieces of R code, among plenty of other subjects. Within this group we had the idea to aggregate our blogs so it would be easier for others to follow us and to easily promote our own blogs to a much larger audience. Basically, do what [R-bloggers](http://www.r-bloggers.com/) does but focused on blogs from students at Johns Hopkins Biostatistics. Ideally, once a student publishes a new post, our site would pick it up and promote it.

A quick search revealed that making such a site was technically possible via several [WordPress](http://wordpress.org/) plugins available. We initally tried doing so via a wordpress.com account and quickly noticed that we needed a self-hosted wordpress account. 

### paper.li

In the meantime, we also explored the possibility of creating a _paper_ using [paper.li](http://paper.li/) which resulted in the [BmoreBiostats paper](bit.ly/BmoreBiostats). The free version allows you to select up to 25 RSS feeds (among other sources) as the source of new content that you either publish

1. in the morning and afternoon,
1. daily,
1. weekly.

This platform offers several options for promoting new content which we implemented. It can create posts to Twitter (see below), Facebook and LinkedIn.

<blockquote class="twitter-tweet"><p>New posts from students <a href="https://twitter.com/jhubiostat">@jhubiostat</a> <a href="http://t.co/jnHXs7qRPJ">http://t.co/jnHXs7qRPJ</a></p>&mdash; bmorebiostats (@bmorebiostats) <a href="https://twitter.com/bmorebiostats/statuses/398439067689689088">November 7, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

You can also embed it on a webpage just like [I did in my own website](http://www.biostat.jhsph.edu/~lcollado/BmoreBiostats.html#.UnxMX5TF2Qn).


The drawbacks are that customization is limited, specially if you do not like how it looks. It also does not provide you with a RSS feed. However, I did manage to get that to work via Facebook as you can notice [here](http://feeds.feedburner.com/BmoreBiostatsPaper).

We have also heard some comments about paper.li been associated with spammers. I agree with this if you set the paper to be published either twice per day or daily. Weekly wise, I do not see it as a spam generator. However, this is in contradiction with the original goal of promoting posts as soon as they are made, and __only__ when there are new posts.

Nevertheless, in my opinion, the paper.li alternative can work well as a weekly summary of the posts. Something like the [Sunday data/statistics link roundoup](http://simplystatistics.org/?s=sunday+data)s at [SimplyStatistics](http://simplystatistics.org/).


### planetaki.com

[John](http://biostat.jhsph.edu/~jmuschel/index.html) found this resource and implemented a [quick test](http://www.planetaki.com/bmorestattest#start). It looks very simple, yet it includes full length posts and was very easy to setup. Note that the material there is deleted after 7 days since they assume that you check it more than once per week. We saw this as a potential negative feature, plus there is no native support for social media.

### bmorebiostat.com


[Amanda](http://mandymejia.wordpress.com/) and [Jean-Philippe](http://jfortinbiostats.com/) [thanks for trying out Wordpress__.com__!] figured out the WordPress solution, got us a hosted service and reserved the domain [bmorebiostat.com](http://bmorebiostat.com/). Then it was just a matter of choosing a plugin to do the job: we are using [FeedWordPress](http://wordpress.org/plugins/feedwordpress/). 

We split the work and some tweaked the layout and added nice pictures of the [six founding blog authors](http://bmorebiostat.com/contributors/). Thanks to what I learnt making [Fellgernon Bit](http://bit.ly/FellBit) I added the social features: [AddThis](http://www.addthis.com/) Smart Layers, connections to social media, [Disqus](http://disqus.com/) comments (they will not be used much), and [FeedBurner](http://feedburner.google.com/) RSS feeds.

I like how the site looks and it fully achieves our initial goal. Yay!

Currently, [BmoreBiostats](bit.ly/BmoreBiostat) is set up in a way that only the beginning of each post is shown. We can also set it up to contain full posts, but then the `R` code highlighting needs to be polished out. 

### Current implementation

The full current workflow is illustrated below:

<center>
<a href="http://lcolladotor.github.io/figs/2013-11-07-bmorebiostats/BmoreBiostats-schema.png"><img src="http://lcolladotor.github.io/figs/2013-11-07-bmorebiostats/BmoreBiostats-schema.png" alt="Workflow" style="width: 900px;"/></a>
</center>

As a group we are now thinking of dropping the paper.li route. Well, the only option we might use is the weekly one. One strong argument in favor of dropping the paper.li route is that one site avoids any dilution given by having two. Furthermore, we do not want to be seen as spammers although some shameless self-promotion is not so bad either (something I learnt from [@hspter](https://twitter.com/hspter)).

I guess that I am the only one still in favor of weekly summaries and using the feature of embeding the paper in a website (like [here](http://www.biostat.jhsph.edu/~lcollado/BmoreBiostats.html#.UnxMX5TF2Qn)). To minimize the dilution, all the paper.li links point to [bmorebiostat.com](http://bmorebiostat.com/). You can also argue that there might be some interested only on the weekly summaries. Aka, we are just giving others options! 

Maybe I am just reluctant to delete the [BmoreBiostats paper](bit.ly/BmoreBiostats) so soon after I finally completed it. However, some of the work involved is not going down the drain since the social media accounts needed for the paper are now being used by [bmorebiostat.com](http://bmorebiostat.com/).

Note that we do not see much of a problem with the fact that [bmorebiostat.com](http://bmorebiostat.com/) involves monthly fees as we are hoping to get some department support (cross fingers!). 


### Going forward

We are very excited that we have implemented the aggregator of student blogs from Johns Hopkins Biostatistics. We believe that it will be helpful to others including prosprective students. Now that the aggregator is practically finished, we can now move unto writing exciting posts! 

If you are a student [@jhubiostat](https://twitter.com/jhubiostat) --or a former student-- and you have a Biostatistics blog that you want to add to [bmorebiostat.com](http://bmorebiostat.com/), let us know! If you are a current student [@jhubiostat](https://twitter.com/jhubiostat) and need help getting started, contact us!

Be sure to follow us! Here is a hint why:

<blockquote class="twitter-tweet"><p>It seems clear that <a href="https://twitter.com/jhubiostat">@jhubiostat</a> is just dominating all the social media <a href="https://twitter.com/bmorebiostats">@bmorebiostats</a></p>&mdash; Simply Statistics (@simplystats) <a href="https://twitter.com/simplystats/statuses/398625668851716096">November 8, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>



