---
layout: post
title: Correctly synching AddThis and Google Analytics social stats
tags:
- Blog
categories:
- Web
---
<p>As a minor addition to my previous posts about setting up a blog, I want to detail a bit more how to synchronize your <a href="http://www.addthis.com/analytics">AddThis social sharing statistics</a> (AddThis Analytics) with <a href="http://www.google.com/analytics/">Google Analytics</a>.</p>
<p>The <a href="http://www.addthis.com/help/google-analytics-integration#social">main help file explaining how to do</a> so has been a bit confusing for me. Though, in part that&#8217;s because I didn&#8217;t read it completely. Plus there were a few things I didn&#8217;t know.</p>
<p>First, Google Analytics (GA) has two ways in which you can add it to your site: synchronous and asynchronous. There are a few posts around, <a href="http://blog.httpwatch.com/2010/07/29/asynchronous-google-analytics-is-better-but-not-faster/">like this one</a>, explaining the difference. Basically, the asynchronous mode is supposed to give your site faster load times (negligible normally) and most importantly more complete data in cases where people close your site before it finishes loading.</p>
<p>I prefer the asynchronous mode, and the recommendation is to include the script tage before the end of the head tag. In a few cases in Tumblr&#8217;s free blog themes, this script is included at the bottom of the html code. So, you might be interested in changing this otherwise the great advantage of the asynchronous mode is lost: the page has to load entirely to report stuff to GA.</p>
<p>Once you do so, note how the AddThis manual has a note that the AddThis script has to go after the GA script. I didn&#8217;t read this the first time and I was quite puzzled when no social events were showing up in the GA report.</p>
<p>Next, compared to ShareThis, AddThis social events will be shown in your GA report as &#8220;facebook&#8221;, &#8220;twitter&#8221;, etc instead of &#8220;ShareThis: facebook&#8221; (or something like that). That&#8217;s only true if you included the &#8220;data_ga_social&#160;: true&#8221; part in the code. Otherwise GA will only shown under the &#8220;Social&#8221; tab the Google +1 clicks. </p>
<p>In short: use the GA asynchronous code before the end of the head tag. Add the AddThis script tags below it. Happy social sync :)</p>
<p>I have to say that so far I like the AddThis Analytics way more than Google Analytics for the social stats. Part of it is the &#8220;viral lift&#8221; percent that AddThis shows. The other part is that it seems to contain more data. Though it might be because I just fixed the sync.</p>
<p>You might want to read the:</p>
<ul><li><a href="http://www.addthis.com/blog/2011/10/28/addthis-integrates-with-google-social-plugin-analytics/#.Tx9Ms-POzIw">AddThis GA sync announcement at AddThis.com</a></li>
<li><a href="http://www.addthis.com/blog/2011/09/13/add-google-social-tracking/#.Tx9Mt-POzIw">Another AddThis tip about how to do the sync</a></li>
<li><a href="http://analytics.blogspot.com/2011/10/optimize-engagement-with-addthis-and.html">The post on GA&#8217;s blog explaining a tiny bit about the difference between ShareThis and AddThis sync to GA.</a></li>
</ul>
