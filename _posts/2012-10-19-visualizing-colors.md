---
layout: post
title: Visualizing colors()
tags:
- rstats
- Color
categories:
- rstats
---
<p>The other day I learnt about the existance of the colors() vector in R which specifies all the character-based colors like &#8220;light blue&#8221;, &#8220;black&#8221;, etc. So I made a simple plot to visualize them all. Here&#8217;s the code:</p>


<div>
<div class="geshifilter">
<pre class="r geshifilter-R">mat <span>&lt;-</span> <a href="http://inside-r.org/r-doc/base/matrix"><span>matrix</span></a><span>(</span><span>1</span><span>:</span><a href="http://inside-r.org/r-doc/base/length"><span>length</span></a><span>(</span><a href="http://inside-r.org/r-doc/grDevices/colors"><span>colors</span></a><span>(</span><span>)</span><span>)</span><span>,</span> <a href="http://inside-r.org/r-doc/base/ncol"><span>ncol</span></a> = <span>9</span><span>,</span> byrow= <span>TRUE</span><span>)</span>
<a href="http://inside-r.org/r-doc/stats/df"><span>df</span></a> <span>&lt;-</span> <a href="http://inside-r.org/r-doc/base/data.frame"><span>data.frame</span></a><span>(</span><a href="http://inside-r.org/r-doc/base/col"><span>col</span></a> = <a href="http://inside-r.org/r-doc/grDevices/colors"><span>colors</span></a><span>(</span><span>)</span><span>,</span> 
	x = <a href="http://inside-r.org/r-doc/base/as.integer"><span>as.integer</span></a><span>(</span><a href="http://inside-r.org/r-doc/base/cut"><span>cut</span></a><span>(</span><span>1</span><span>:</span><a href="http://inside-r.org/r-doc/base/length"><span>length</span></a><span>(</span><a href="http://inside-r.org/r-doc/grDevices/colors"><span>colors</span></a><span>(</span><span>)</span><span>)</span><span>,</span> <span>9</span><span>)</span><span>)</span><span>,</span>
	y = <a href="http://inside-r.org/r-doc/base/rep"><span>rep</span></a><span>(</span><span>1</span><span>:</span><span>73</span><span>,</span> <span>9</span><span>)</span><span>,</span> stringsAsFactors=<span>FALSE</span><span>)</span>
<a href="http://inside-r.org/r-doc/graphics/plot"><span>plot</span></a><span>(</span>y <span>~</span> <a href="http://inside-r.org/r-doc/base/jitter"><span>jitter</span></a><span>(</span>x<span>)</span><span>,</span> <a href="http://inside-r.org/r-doc/utils/data"><span>data</span></a> = <a href="http://inside-r.org/r-doc/stats/df"><span>df</span></a><span>,</span> <a href="http://inside-r.org/r-doc/base/col"><span>col</span></a> = <a href="http://inside-r.org/r-doc/stats/df"><span>df</span></a><span>$</span>col<span>,</span>
 	pch=<span>16</span><span>,</span> main = <span>"Visualizing colors() split in 9 groups"</span><span>,</span>
 	xlab = <span>"Group"</span><span>,</span> 
	ylab = <span>"Element of the group (min = 1, max = 73)"</span><span>,</span>
	<a href="http://inside-r.org/r-doc/base/sub"><span>sub</span></a> = <span>"x = 3, y = 1 means that it's the 2 * 73 + 1 = 147th color"</span><span>)</span></pre>
</div>
</div>
<p><a href="http://www.inside-r.org/pretty-r" title="Created by Pretty R at inside-R.org">Created by Pretty R at inside-R.org</a></p>

<p>And the plot:</p>
<p><img src="http://media.tumblr.com/tumblr_mc5ovbt4uQ1qfs0hy.png"/></p>

<p>Hm&#8230; the code should look more pretty (see screenshot below), but Tumblr edits the html code. If you know how to deal with this, let me know.</p>
<p><img src="http://media.tumblr.com/tumblr_mc5ozbBs9h1qfs0hy.png"/></p>
