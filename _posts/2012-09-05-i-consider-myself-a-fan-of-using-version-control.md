---
layout: post
title: 'Version control: need to learn Git'
tags:
- Version control
- Mercurial
- Git
categories:
- Computing
---
<iframe width="400" height="225" src="http://www.youtube.com/embed/4fsSyLkBdB4?rel0" frameborder="0" ></iframe><br/><p>I consider myself a fan of using version control for bioinformatics/biostatistics (or any text based, like code) project. Yet my knowledge of version control systems is quite limited. I&#8217;ve used Mercurial for some time, but I haven&#8217;t ventured much beyond the basic commands and some GUIs for merging.</p>
<p>I don&#8217;t recall how it all went, but I remember reading that <a href="http://subversion.apache.org/">Subversion</a> (SVN) was much better than <a href="http://www.nongnu.org/cvs/">CVS</a>. Also, the <a href="http://www.bioconductor.org/">Bioconductor project</a> uses SVN. Before that I really learnt how to use SVN, someone from the Bioconductor devel list pointed me to <a href="http://git-scm.com/">Git</a>/<a href="http://mercurial.selenic.com/">Mercurial</a>. Around the same time I read &#8220;<a href="http://www.ncbi.nlm.nih.gov/pubmed/19649301">A quick guide to organizing computational biology projects</a>" by William Noble, which further convinced me to start using a version control system. I "educated" (a tiny bit) myself on the topic with Wikipedia&#8217;s entries on <a href="http://en.wikipedia.org/wiki/Revision_control">revision control</a> and <a href="http://en.wikipedia.org/wiki/Distributed_revision_control">distributed revision control</a>.</p>
<p>I wasn&#8217;t sure whether to use Mercurial or Git, but at the time <a href="https://bitbucket.org/">Bitbucket</a> only supported Mercurial repositories. It felt pretty easy to use, specially after reading the <a href="http://mercurial.selenic.com/guide/">guide</a> whose examples covered pretty much all I needed. By the way, I highly recommend using Bitbucket now (whether for Mercurial or Git repositories) as they offer unlimited private repositories to anyone with an academic email account.</p>
<p>Now for my Advanced Methods class by <a href="http://www.bcaffo.com/">Brian Caffo</a> (check out his <a href="https://www.coursera.org/course/biostats">Mathematical Biostatistics Boot Camp</a> Coursera free online course) I need to learn how to use Git. That lead me to check some Git vs Mercurial posts such as:</p>
<ul><li><a href="http://blogs.atlassian.com/2012/03/git-vs-mercurial-why-git/">Git vs Mercurial: Why Git?</a></li>
<li><a href="http://blogs.atlassian.com/2012/02/mercurial-vs-git-why-mercurial/?utm_source=wac-dvcs&amp;utm_medium=text&amp;utm_content=dvcs-options-git-or-mercurial">Git vs Mercurial: Why Mercurial?</a></li>
</ul><p>Curiosity and another reason lead me to watch the <a href="http://youtu.be/4fsSyLkBdB4">video</a> from above. It helped me to understand the basic differences between Git and Mercurial, plus it reassured me that skipping SVN was a good thing. I might still need to learn SVN properly, but at least through Git-SVN or HgSubversion it seems that I can dodge the bullet.</p>
<p>I&#8217;ll come back once I&#8217;ve tried out Git, but for now it seems that <a href="http://sourcetreeapp.com/">SourceTree</a> will be a great tool to have. It works with Bitbucket and <a href="https://github.com/">Github</a> (free for open source, gotta pay for private repositories).</p>
<p>To finish this post, if you are new to the topic you should check out:</p>
<ul><li><a href="http://blogs.atlassian.com/2012/02/version-control-diffs-patches/?utm_source=wac-dvcs&amp;utm_medium=text&amp;utm_content=what-is-version-control">What is Version Control: Diff and Patches</a></li>
<li><a href="http://blogs.atlassian.com/2012/02/version-control-centralized-dvcs/?utm_source=wac-dvcs&amp;utm_medium=text&amp;utm_content=what-is-version-control">What is Version Control: Centralized vs DVCS</a></li>
</ul><p>Well, even without knowing much about these tools you probably already use some kind of version history thanks to Dropbox and Google Docs. </p>
<p>PS I found lots of stuff <a href="http://www.atlassian.com/dvcs/overview/what-is-version-control">here</a>.</p>
