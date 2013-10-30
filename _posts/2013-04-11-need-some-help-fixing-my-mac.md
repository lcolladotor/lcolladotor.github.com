---
layout: post
title: Need some help fixing my Mac...
tags:
- Mac
- Problem
- Freeze
- RAM
- help
categories:
- Computing
---
<p>2 days ago I was writing some R code for <a href="https://twitter.com/search?q=%23jhsph753&amp;src=typd">#jhsph753</a> in an Rmd file. I was careless and didn&#8217;t realize that one computation would be very RAM intensive until I was running <a href="https://twitter.com/search?q=%23knitr&amp;src=typd">#knitr</a> (as a &#8216;silent&#8217; process from <a href="https://github.com/textmate/textmate">TextMate2</a>). My computer started swapping and became unresponsive, without being able to force quit. So I did a hard restart: aka, I shut it down by holding the power button.</p>
<p>The problem is that since that happened, my MacBook Pro Early 2011 <span>version</span><span> with a 2.7Ghz i7 procession freezes every 40-80 min. It&#8217;s the <a href="http://mmlweb.rutgers.edu/music127/basic/crash_freeze.htm">bad kind of freeze</a> because the mouse becomes unresponsive and all the usual force quit hotkeys don&#8217;t work. </span></p>
<p>From what I understand, that first time that it froze 2 days ago, my laptop started swapping but after the hard restart some of the swap info might have become corrupted or something related to this broke.</p>
<p>I have tried <a href="http://support.apple.com/kb/ht1379">resetting the NVRAM</a>, <a href="http://support.apple.com/kb/ht3964">resetting the System Management Controller (SMC)</a>, performed successful <a href="http://support.apple.com/kb/ht1782">verify/repair disk</a>** and verify/repair disk permissions, booted in safe mode, ran the OS-X <a href="http://www.thexlab.com/faqs/maintscripts.html">maintenance scripts manually</a>, and finally deleted the sleepimage and swapfile* in /private/var/vm Note that I&#8217;m not trying to <a href="http://forums.macrumors.com/showthread.php?t=1480259">block the OS from writing the 8Gb sleepimage file as others have done</a>.</p>
<p>So basically, I tried all the tricks I found via Google or that have so far been recommended to me.</p>
<p>I also learnt about purging (<a href="http://www.macupdate.com/app/mac/45304/ram-cleaning">either with an app </a>or <a href="http://osxdaily.com/2012/04/24/free-up-inactive-memory-in-mac-os-x-with-purge-command/">just manually</a>).</p>
<p>Despite of all these ideas failing, I still think that it&#8217;s a software issue. Maybe the disk (SSD; these are the details: CT1895178&#160;256GB Crucial m4&#160;2.5-inch SATA 6GB/s) is corrupted but for now it does pass the Disk Utility check.</p>
<p>I&#8217;m also considering updating the OS from 10.7.5 to Mountain Lion hoping for the best. But maybe that&#8217;s too hopeful.</p>
<p>Or maybe it&#8217;s RAM itself? Dunno, but this whole thing prompted me to buy an upgrade which I&#8217;ll install in a couple days.</p>
<p>But regardless of the OS/RAM upgrades, now I have to deal with the frequent freezes and hope that there is another solution out there that I haven&#8217;t found/tried. So, if you have an idea, please let me know!</p>
<p>I find it rather&#8230; well, upsetting that a rather simple issue (using too much RAM -&gt; swapping -&gt; freezing -&gt; hard reset) would cause other stuff to break so easily.</p>

<p>** It did repair something the first time, but hasn&#8217;t found anything to repair after the multiple hard resets that have followed. This is the part of the Disk Utility log of the &#8220;disk verify&#8221; that shows the error that was then fixed by &#8220;disk repair&#8221;.</p>
<p>2013-04-09&#160;13:48:47 -0400: Checking volume bitmap.</p>
<p>2013-04-09&#160;13:48:47 -0400: Volume bitmap needs minor repair for orphaned blocks</p>
<p>2013-04-09&#160;13:48:47 -0400: Checking volume information.</p>
<p>2013-04-09&#160;13:48:47 -0400: Invalid volume free block count</p>
<p>2013-04-09&#160;13:48:47 -0400: (It should be 15854995 instead of 15763025)</p>
