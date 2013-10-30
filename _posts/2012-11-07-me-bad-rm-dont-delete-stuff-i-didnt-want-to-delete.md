---
layout: post
title: ! 'me: Bad rm, don''t delete stuff I didn''t want to delete! (rm: well, I do
  what you tell me to do!)'
tags:
- UNIX
- Computing
categories:
- Computing
---
<p>When Sandy was in town at some point I started doing some of my research work, but I shouldn&#8217;t have. I basically did a silly mistake and erased files that take a long time to compute.</p>
<p>Prior to being here, I had an alias in my bash profile like this:</p>
<p>alias rm=&#8217;rm -i&#8217;</p>
<p>But when I setup my bash profile here I googled a bit to find what was the best common solution to avoid deleting stuff you shouldn&#8217;t be deleting. That&#8217;s when I found the following stackoverflow entry: <a href="http://superuser.com/questions/384769/alias-rm-rm-i-considered-harmful">`alias rm=“rm -i”` considered harmful?</a></p>
<p>One of the answers suggests using rmi instead of rm for the alias. The idea is that you will never expect that rm will run interactively in other machines, which could potentially be disastrous. </p>
<p>Being &#8220;smart&#8221;, I set up my alias to be rmi. However, I started using rm (without expecting it to be interactive) and just ignored the alias.</p>
<p>Problem is that I ran a more command with a pattern, saw that the files were empty, then deleted them with rm. Next, I wanted to check a different pattern, used the up arrow key and instead of editing the more command, I edited the rm command. When I noticed it, it was too late.</p>
<p>Luckily, I only deleted some output files that I can recover. But it was a pretty basic mistake. And yes, the files were not backed up.</p>
<p>Anyhow, I will now stick to my rmi alias and hopefully avoid running into this kind of pitfall <em>ever</em> again.</p>
