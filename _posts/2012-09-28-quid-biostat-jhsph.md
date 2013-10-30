---
layout: post
title: Quid @Biostat-JHSPH
tags:
- 3D
- Network
- Quid
- Talk
categories:
- JHU Biostat
---
<p>Just like most scientific departments, we have a seminar (weekly over here) where very bright people come to us to talk about their work. Being a Biostatistics department, we mostly get faculty from other Biostatistics departments from universities to talk to us. This week was quite different. Amy Heineike from <strong><a href="http://quid.com/">Quid</a></strong> gave us a talk describing their product, which fits perfectly in what is now called &#8220;data science&#8221;. You can see Amy at the end of the table in the picture below.</p>
<p><img alt="Amy is the one at the end of the table." height="168" src="http://quid.com/img/life/team.jpg" width="299"/></p>
<p>So what is Quid? It&#8217;s a start up tech company that provides either their software or reports derived from it that help big companies (a) analyze a field, (b) look at what the competition is doing, (c) take informed decisions (helpful for marketing). The short video below describes Quid in a more general way, check it out!</p>
<p><iframe frameborder="0" height="253" src="http://www.youtube.com/embed/5hGTjhuimH0" width="450"></iframe></p>
<p>As Amy Heineike described in her talk, the three common decision-taking pathways are:</p>
<ul><li>Someone follows their own intuition. Say a big shot that thinks he knows where the world is going.</li>
<li>Someone with decision power asks others to generate reports for her/him. That is, lots of manual work where some read, consult others, etc then they summarize the information in a report.</li>
<li>Similar to the above one where lots of people gather the information, then a program is run and the decision is pretty much made by the computer.</li>
</ul><p>The Quid paradigm is to use the computer to gather all the information and then have a human(s) look at a network with a very cool 3D tool to assimilate the information and decide themselves. The argument is that the human brain is very powerful for visual pattern recognition and can out-perform computers. </p>
<p>At first I felt that you can do the network part with a software like <a href="http://www.cytoscape.org/">Cytoscape</a> which I find to be very powerful for network analysis. But the pipeline used by Quid is much more extensive and it&#8217;s an all-in-one bundle.</p>
<p>Another key argument in favor of Quid is that most of the information shared is done in a list format. Like google search results, powerpoint bullet points, your facebook feed, etc. But who came up with the ranking? How are things related? That&#8217;s when you need a network representation.</p>
<p>I recommend taking a look at their <a href="http://quid.com/technical.php">technical overview page</a> where they have the main steps outlined. But needless to say, they depend strongly on the natural language processing early steps. Their 3D tool looked very interesting and I love to play with it. Amy Heineike actually poked us by showing a video of a short session using the software that was designed so we would want to have a go with Quid. I, as many others, were hooked! Sadly, Quid&#8217;s software is not the kind that academics can go buy for now.</p>
<p>I found the example using &#8220;synthetic biology&#8221; as the query to be pretty interesting. Sadly I don&#8217;t have a picture, but one of the features that seems very powerful is when you change to a 2D display. In it, you have the time on the X-axis and the number of articles (well, any kind of input file Quid can use) on the Y-axis. By clicking on a point (which corresponds to a node in the network 3D environment) you can then visualize all the connections that are directly linked to it. Thus you have a scatterplot with a 2D network on top of it. That information can be really useful to understand the flow of information. The specific example was how someone proposed years ago that a specific kind of application was possible, time later grants on the subject were announced, and more close to the present he got a grant, then other grants and results were publicized.</p>
<p>Now, Quid has some flaws. For instance, one hot question was how to control the threshold that determines whether two nodes are connected or not. The answer was something like this: experts in their fields have validated the results for queries related to them. Not very convincing for a biostat crowd. Another one was how to control/remove/correct bias. Amy Heineike replied that you need to learn where the data used by Quid is like. For example, when looking at companies the number of news articles mentioned is linked to how efficient/big their public relations office is.</p>
<p>Nevertheless, Quid&#8217;s product is very interesting. Plus, I feel that part of our tool-box as Biostatisticians is visualizing data in ways that allow us to understand what is going on. As for working at Quid or doing anything alone the line, we definitely need to learn more about computer science. After all, you need incredibly fast algorithms and code to work with enormous data sets. </p>
<p>&#8212;&#8212;</p>
<p>PS Amy Heineike might develop a <a href="http://www.ncbi.nlm.nih.gov/pubmed/">Pubmed</a> scrapper for Quid. Meaning that Quid would be able to access citations data. Then it would be very cool to use a few &#8220;seed&#8221; papers that you are interested in to find the complete history behind them and any other papers similar to them. There might another group out there working in your field that you don&#8217;t know about! Which I think happens more frequently that what you think. Specially if you don&#8217;t look abroad.</p>
<p>&#8212;&#8212;</p>
<p>Edit: I had completely forgotten that I had read about <a href="http://simplystatistics.org/post/19572022804/interview-with-amy-heineike-director-of-mathematics">Amy Heineike before in her SimpleStatistics interview</a>. There&#8217;s more about her in this video and in <a href="http://thephenomlist.com/lists/8/people/32">The Phenomlist</a>.</p>
<p><iframe frameborder="0" height="253" src="http://www.youtube.com/embed/IVdwJvQXeg4" width="450"></iframe></p>
