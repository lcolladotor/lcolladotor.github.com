---
layout: post
title: Laptop fixed =)
tags:
- Mac
- Problem
- Freeze
- RAM
- help
categories:
- Computing
---
<p>I just want to thank everyone that gave me ideas of what to try and whom to ask for solving the issue I was having with my laptop.</p>
<p>For future reference and to complement my <a href="http://fellgernon.tumblr.com/post/47680956215/need-some-help-fixing-my-mac#.UWs_gSvF0b0">previous post</a>, here&#8217;s a list of other things I tried.</p>
<ul><li><span>I ran a memory test using </span><span></span><a href="http://osxdaily.com/2011/05/03/memtest-mac-ram-test/">memtest from here</a><span>. </span></li>
<li><span>I updated my OS-X to 10.8.3 from 10.7.5, and although it froze the first time it was installing, it did pick up from where it had left after rebooting and finished successfully the second time. </span></li>
<li><span>The Mac IT support at the university ran a hidden test (I think that it&#8217;s from booting up by pressing alt and then another shortcut which I missed) that verified that the memory and disk are fine. He did notice that I&#8217;m eligible for a battery replacement, which I&#8217;ll apply for soon and use the AppleCare Protection Plan. </span></li>
<li><span>Changed the HD back to the original one to boot up (up to the recovery screen which you can get to using cmd + R when booting up), and then changed back to my SSD HD. The hope was to re-establish the OS-drive connection (or whatever it&#8217;s called).</span></li>
<li><span>I ran a file system check (fsck -fy) in single user mode with the Mac IT person. I had done one before, but this one was after upgrading the OS. Plus, he told me it&#8217;s slightly different from the check using the Disk Utility. More <a href="http://reviews.cnet.com/8301-13727_7-20028609-263.html">here</a>.</span></li>
</ul><p>What worked?</p>
<p>I finally updated the firmware version of my Crucial m4&#160;2.5 inch SSD drive (<a href="http://www.crucial.com/support/ssd/index.aspx?source=web&amp;cpe=m4firmware_us">available here</a>) to version 070H from version 009 using a <a href="http://forum.crucial.com/t5/Solid-State-Drives-SSD/How-to-update-M4-SSD-firmware-for-Mac-Os-X-users/td-p/59000">bootable CD</a>. I tried multiple ways to do so using a bootable USB but failed and eventually bought a CD to try this option. I do remember upgrading from 002 to 009 using a bootable USB, but I think that I made it with a PC and not a Mac. Crucial has to seriously improve the instructions on how to upgrade the firmware using a bootable USB for Mac users!!</p>
<p>Anyhow, I wasn&#8217;t expecting this to work but it did. According to the description, the 070H version was made to solve bugs for Windows 8 users. What I think that made it work is that it re-made the OS-drive connection (or whoever it&#8217;s called) as the Mac IT guy said. The next options were to reformat the disk completely and complain abou the drive with the manufacturer.</p>
<p>So, now I&#8217;m keeping that 070H firmware disk in case I have to do something like this again.</p>
<p>And&#8230; now I have Mountain Lion :P and a RAM upgrade on the mail.</p>
<p>Thanks again everyone for the help!</p>
