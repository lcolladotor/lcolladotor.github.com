---
layout: post
title: Where do I start using Bioconductor?
tags:
- Bioconductor
categories:
- rstats
---
{% include JB/setup %}








I was recently asked _where do I get started with Bioconductor?_ and thought this would be a good short post.

## What is BioC?

Briefly, Bioconductor <a id='cite-bioc'></a>(<a href='http://genomebiology.com/2004/5/10/R80'>Gentleman, Carey, Bates, and others, 2004</a>) is an open source project that hosts a wide range of tools for analyzing biological data with `R` <a id='cite-R'></a>(<a href='http://www.R-project.org/'>R Core Team, 2014</a>). These analysis tools are bundled into packages which are designed to answer specific questions or to provide key infrastructure. If this sounds like something you are interested in, visit [bioconductor.org](http://www.bioconductor.org/).

Obviously, you need to know the basics about `R` in order to use Bioconductor.

## Getting started

[bioconductor.org](http://www.bioconductor.org/) has a section in it's front page titled _get started with Bioconductor_. There you will find links that explain how to install it or to explore the available packages. 

### You have a use case

If you have a particular use case in mind, I recommend [browsing the software packages](http://www.bioconductor.org/packages/release/BiocViews.html#___Software) and searching for some key words. For example, you might be interested in _high throughput sequencing of RNAs_ and if you search _RNAseq_ or _RNA-seq_ you can find a good set of packages to start. Alternatively, use the _biocViews_ tree menu to explore specific categories of packages.

Once you find a set of packages that have descriptions that appeal to you, explore their [vignettes](http://www.bioconductor.org/help/package-vignettes/). These are either PDF or HTML documents that explain what the package does to new users. They also exemplify how to tie together the different functions in the package, which is a key piece of information. For example, in the _RNA-seq_ example you will find the [DEXSeq](http://www.bioconductor.org/packages/release/bioc/html/DEXSeq.html) package. `DEXseq` <a id='cite-DEXseq'></a>(<a href='http://dx.doi.org/10.1101/gr.133744.111'>Anders, Reyes, and Huber, 2012</a>) has a vignette called _Analyzing RNA-seq data for differential exon usage with the "DEXSeq" package_ and from the page of the package you can access the [PDF vignette](http://www.bioconductor.org/packages/release/bioc/vignettes/DEXSeq/inst/doc/DEXSeq.pdf). 

Then it's just a matter of exploring other packages, checking the vignettes and learning as you go.


### You don't have a use case

If you don't have a specific use case in mind, it might pay off to start by exploring the [Bioconductor workflows](http://www.bioconductor.org/help/workflows/). These documents explain how to use different packages to accomplish specific type of analyses. They are great to learn what you can do with Bioconductor!

Another option is to look at the previous [courses](http://www.bioconductor.org/help/course-materials/). For example, under the [2008 courses](http://www.bioconductor.org/help/course-materials/2008/) you'll find to the course [R/Bioconductor Curso Intensivo (Spanish)](http://www.lcg.unam.mx/~lcollado/R/) which I taught back in the day. As much as I would like to self promote myself, the best starting point is the most recent BioC20XX course: [BioC2014](http://www.bioconductor.org/help/course-materials/2014/BioC2014/). It has slides showcasing some of the newest packages and tutorials on how to use them.

An alternative is to look at some of the [Bioconductor publications](http://www.bioconductor.org/help/publications/) which includes books about Bioconductor and research papers describing some of the packages.

Once you find a set of packages that catch your eye, go look at their vignettes just like I explained in the _you have a use case_ scenario.


## Help tips

It's not a matter of whether you will need help learning how to use Bioconductor. It's just a matter of when. So don't feel bad about having to ask for help!!

The very first place to start is to look at [bioconductor.org](http://www.bioconductor.org/) at the _Help_ section in the bottom. For example, you can find youtube videos contributed under the [community](http://www.bioconductor.org/help/community/) section. There you can also find links to other blog posts explaining how to use Bioconductor. Take a peak at the other sections under _Help_ before using the [Bioconductor support site](https://support.bioconductor.org/): it's where you can ask very specific questions and interact with the maintainers of the packages you are using.

Finally, if you are interested in new developments, then check the _latest newsletter_, for example the [October 2014](http://www.bioconductor.org/help/newsletters/2014_October/) one.


Good luck using Bioconductor!



### References

Citations made with `knitcitations` <a id='cite-knitcitations'></a>(<a href='https://github.com/cboettig/knitcitations'>Boettiger, 2014</a>).


<p><a id='bib-DEXseq'></a><a href="#cite-DEXseq">[1]</a><cite>
S. Anders, A. Reyes and W. Huber.
&ldquo;Detecting differential usage of exons from RNA-seq data.&rdquo;
In: <EM>Genome Research</EM> 22 (2012), p. 4025.
DOI: <a href="http://dx.doi.org/10.1101/gr.133744.111">10.1101/gr.133744.111</a>.</cite></p>

<p><a id='bib-knitcitations'></a><a href="#cite-knitcitations">[2]</a><cite>
C. Boettiger.
<EM>knitcitations: Citations for knitr markdown files</EM>.
R package version 1.0.2.
2014.
URL: <a href="https://github.com/cboettig/knitcitations">https://github.com/cboettig/knitcitations</a>.</cite></p>

<p><a id='bib-bioc'></a><a href="#cite-bioc">[3]</a><cite>
R. C. Gentleman, V. J. Carey, D. M. Bates and others.
&ldquo;Bioconductor: Open software development for computational biology and bioinformatics&rdquo;.
In: <EM>Genome Biology</EM> 5 (2004), p. R80.
URL: <a href="http://genomebiology.com/2004/5/10/R80">http://genomebiology.com/2004/5/10/R80</a>.</cite></p>

<p><a id='bib-R'></a><a href="#cite-R">[4]</a><cite>
R Core Team.
<EM>R: A Language and Environment for Statistical Computing</EM>.
R Foundation for Statistical Computing.
Vienna, Austria, 2014.
URL: <a href="http://www.R-project.org/">http://www.R-project.org/</a>.</cite></p>




### Want more?

Check other [@jhubiostat](https://twitter.com/jhubiostat) student blogs at [Bmore Biostats](http://bmorebiostat.com/) as well as topics on [#rstats](https://twitter.com/search?q=%23rstats).
