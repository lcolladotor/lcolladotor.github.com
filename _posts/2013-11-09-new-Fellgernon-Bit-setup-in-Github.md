---
layout: post
title: Creating your Jekyll-Bootstrap powered blog for R blogging
tags:
- Blog
categories:
- Web
- rstats
---
{% include JB/setup %}









As you might have noticed, I recently decided to move `Fellgernon Bit` from [Tumblr](http://bit.ly/FellgernonBit) to [GitHub](http://bit.ly/FellBit). There are a couple of reasons why I made this change.

1. I wanted a more professional-looking blog.
	* There are not many R blogs on Tumblr, and well, long text posts are not really meant for Tumblr.
1. Better code highlighting.
	* I had enabled R code highlighting using the highlighting instructions from Jeffrey Horner (<span class="showtooltip" title="@jeffreyhorner (2013). 'Blog with R Markdown and tumblr: Part I.' ."><a href="http://jeffreyhorner.tumblr.com/post/25804518110/blog-with-r-markdown-and-tumblr-part-i">Horner, Part I</a></span>). The instructions are great! I guess I just got lazy to tweak the CSS of my Tumblr blog to fix some things I didn't like.
	* I also want to be able to highlight code from other languages, like `bash`.
1. Make it easier to embed any HTML code.
	* Yes, you can write posts at Tumblr in pure HTML but sometimes things break as Tumblr doesn't like them.
1. Easier process of writing posts using Rmd files.
	* The steps in Horner's guide (<span class="showtooltip" title="@jeffreyhorner (2013). 'Blog with R Markdown and tumblr: Part II.' ."><a href="http://jeffreyhorner.tumblr.com/post/25943954723/blog-with-r-markdown-and-tumblr-part-ii">Horner, Part II</a></span>) are quite involved. Instead of those steps, I was just knitting my posts and then manually copying the html code in the `body` tags, then pasting it in Tumblr. 
1. Easy way to host figures and link to them.
	* I have previously hosted pictures through Picasa Web Albums, but with the push towards Google Plus they made it harder to embed solo pictures (you can embed Google+ posts though). 


I had also previously heard about [Jekyll](http://jekyllrb.com/)-powered blogs, specially thanks to Yihui Xie's blog (<span class="showtooltip" title="Xie Y (2013). 'Statistics, R, Graphics and Fun | Yihui Xie.' ."><a href="http://yihui.name/en/">Xie, English version</a></span>). At the time when I first learned about this type of blog it seemed challenging so I never dedicated the time to really learn about it. What ended up movitivating me to do so was our new student bloggers group [@jhubiostat](https://twitter.com/jhubiostat).

Let me describe how I set up [Fellgernon Bit @ GitHub](http://bit.ly/FellBit).

## Setting up [Fellgernon Bit @ GitHub](http://bit.ly/FellBit)

### Creating the Jekyll-Bootstrap blog

My main guide to setup the blog comes from a post by J. Fisher (<span class="showtooltip" title="Fisher JC (2012). 'Blog with Knitr and Jekyll.' ."><a href="http://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/">Fisher, 2012</a></span>) which points to another of his posts (<span class="showtooltip" title="Fisher JC (2012). 'Jekyll Build on Windows.' ."><a href="http://jfisher-usgs.github.io/lessons/2012/05/30/jekyll-build-on-windows/">Fisher, 2012b</a></span>).

#### Install Jekyll

Before doing anything, I first had to install [Jekyll](http://jekyllrb.com/). To do so I recommend checking the installation documentation (<span class="showtooltip" title="(2013). 'Installation.' ."><a href="http://jekyllrb.com/docs/installation/">Jekyll Installation</a></span>).

To install [Jekyll](http://jekyllrb.com/), I needed to have [Ruby](https://www.ruby-lang.org/en/downloads/) and [RubyGems](http://rubygems.org/pages/download). Since I use [MacPorts](http://www.macports.org/) these are the steps I used:



{% highlight bash %}
## Update MacPorts, can take a while!!
sudo port selfupdate
sudo port upgrade outdated

## Search for Ruby and install it
## I think that Jekyll needs 1.9+ since I had 1.8 already installed
port search ruby
sudo port install ruby19
## Set as default version
sudo port select --set ruby ruby19

## Check which version you have
ruby --version

## I manually set mine to be ruby1.9
cd /opt/local/bin
sudo ln -s ruby1.9 ruby
ruby --version 
## This is mine:
## ruby 1.9.3p448 (2013-06-27 revision 41675) [x86_64-darwin12]
{% endhighlight %}


With Ruby in place, I could then install jekyll.


{% highlight bash %}
sudo gem install jekyll
{% endhighlight %}


Note that you can also do this after initializing the blog.

### Initialize blog

Following the instructions (<span class="showtooltip" title="Fisher JC (2012). 'Jekyll Build on Windows.' ."><a href="http://jfisher-usgs.github.io/lessons/2012/05/30/jekyll-build-on-windows/">Fisher, 2012b</a></span>) I then acquired all the setup files for [Jekyll-Bootstrap](http://jekyllbootstrap.com/). The installation instructions are quite straight forward as you will see (<span class="showtooltip" title="(2013). 'Jekyll Quick Start | ruhoh universal static blog generator.' ."><a href="http://jekyllbootstrap.com/usage/jekyll-quick-start.html">JB Quick Start</a></span>). 

First, I created the `lcolladotor.github.com` repository on GitHub. As my GitHub username is `lcolladotor`, by default GitHub will consider the `lcolladotor.github.com` repository as a GitHub pages repository and publish it. Thus creating [lcolladotor.github.io/](http://lcolladotor.github.io/).

Once the repository was created, I added the Jekyll-Bootstrap files.


{% highlight bash %}
## Initialize repo with Jekyll-Bootstrap files
git clone https://github.com/plusjade/jekyll-bootstrap.git lcolladotor.github.com
cd lcolladotor.github.com/
git remote set-url origin git@github.com:lcolladotor/lcolladotor.github.com.git
git push -u origin master
{% endhighlight %}



### Change theme to Twitter-2.0

Jekyll-Bootstrap includes several themes (<span class="showtooltip" title="(2013). 'Using Themes | ruhoh universal static blog generator.' ."><a href="http://jekyllbootstrap.com/usage/jekyll-theming.html">JB Themes</a></span>) which you check on their [theme explorer](http://themes.jekyllbootstrap.com/). I think that [J. Fisher's blog](http://jfisher-usgs.github.io/) looks good with Twitter-2.0 and decided to follow his lead. Furthermore, he has customized a few things (check [his blog's history](https://github.com/jfisher-usgs/jfisher-usgs.github.com/commits/master)) which I just plan on using.


{% highlight bash %}
## Install Twitter-2.0 theme
rake theme:install git="https://github.com/gdagley/theme-twitter-2.0"
{% endhighlight %}


### Code highlighting

The default Jekyll highlighting setup uses [pygments](http://pygments.org/). I am basing my statement on the documentation for the _highlight_ argument in `?knitr::render_jekyll`:

    which code highlighting engine to use: for pygments, the Liquid syntax is used (default approach Jekyll)

So I installed Pygments.


{% highlight bash %}
## Install Pygments, assuming you have Python installed
curl -O http://python-distribute.org/distribute_setup.py
sudo python distribute_setup.py
sudo easy_install Pygments
{% endhighlight %}


Note that (<span class="showtooltip" title="Fisher JC (2012). 'Jekyll Build on Windows.' ."><a href="http://jfisher-usgs.github.io/lessons/2012/05/30/jekyll-build-on-windows/">Fisher, 2012b</a></span>) details some other steps. I basically copied his [syntax.css](https://github.com/jfisher-usgs/jfisher-usgs.github.com/blob/master/assets/themes/twitter-2.0/css/syntax.css) file and saved it as `/assets/themes/twitter-2.0/css/syntax.css` 

Note that you do have to add to `_includes/themes/twitter-2.0/default.html` the following line:

```{html}
<link href="/assets/themes/twitter-2.0/css/syntax.css" rel="stylesheet" type="text/css">
```

As you can see [on my own file](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/_includes/themes/twitter-2.0/default.html) in line 23 (currently) I am using a Liquid syntax instead of specifying the full path.

### Import posts

Next I had to import my posts from Tumblr. Jekyll has a varied set of tools that allow you to quickly import posts which I recommend using if you are migrating your blog (<span class="showtooltip" title="(2013). 'Blog migrations.' ."><a href="http://jekyllrb.com/docs/migrations/">Blog Migrations</a></span>).


The Tumblr importer allows you to either import them into HTML format or Markdown format. I first tried Markdown, but ran into some problems. So I decided to import them into HTML format, and rename them to Markdown. 


{% highlight bash %}
## Install importing tools
sudo gem install jekyll-import --pre

## Import the posts
cd ~/
mkdir tmp
/opt/local/bin/ruby1.9 -rubygems -e 'require "jekyll/jekyll-import/tumblr"; JekyllImport::Tumblr.process("http://fellgernon.tumblr.com", "html", true, false, false)'
## There is a post that the converter didn't like, so I had to set to "private" mode


## Rename from HTML to Markdown
cd _posts/tumblr/
for i in *html; do echo $i; filename=$(basename "$i"); filename2="${filename%.*}"; echo $filename2; mv $i ${filename2}.md; done

## Move the posts to _posts
mv ~/tmp/_posts/tumblr/*md ~/WhereYouHaveYourLocalGitRepoCopy/lcollado.github.com/_posts/
{% endhighlight %}


I then had to do some manual edits on the posts, specially for code chunks. For example, [this post](https://raw.github.com/lcolladotor/lcolladotor.github.com/master/_posts/2013-05-09-reading-an-r-file-from-github.md) has R chunks which I had to surround by:

<script src="https://gist.github.com/lcolladotor/7388043.js"></script>

To complete the posts, I made sure the YAML front matter was correct and defined categories since I only had tags in Tumblr.

### Viewing your blog locally

Once you have the posts, you can use Jekyll to view your blog locally. 


{% highlight bash %}
## Go to your directory
~/WhereYouHaveYourLocalGitRepoCopy/lcollado.github.com/

## Generate the static view of your blog
jekyll serve
{% endhighlight %}


In my case, `jekyll serve` prompted a couple of errors which I had to go to the posts and edit. For example, some HTML tag that I opened but didn't close. Stuff like that.

Once you run the previous command, you can then view your site on your browser at http://localhost:4000/


### Customizing

The very first thing you must change is the _config.yml file. The file you copied from Jekyll-Bootstrap includes instructions on how to do so. If you learn by example, take a peek at [mine](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/_config.yml). 

In my case, I use [Disqus](http://disqus.com/) for comments and [Google Analytics](http://www.google.com/analytics) for tracking visits. Since I was also using [Disqus](http://disqus.com/) for my Tumblr blog, I used [Disqus](http://disqus.com/)' tools to migrate the comments. Finally, I use [FeedBurner](http://feedburner.google.com/) for my RSS feed, which I was able to update to the new [RSS generated by Fellgernon Bit @ GitHub](http://lcolladotor.github.io/rss.xml). Thus, the subscribers to [feeds.feedburner.com/FellgernonBit](http://feeds.feedburner.com/FellgernonBit) didn't have to change anything.

I also added [AddThis Smart Layers](https://www.addthis.com/get/smart-layers#.Un5oIpTF2Ql) with [bit.ly](https://bitly.com/) shortening to the site and a [ClustrMap](http://www.clustrmaps.com/) as you can see in [_layouts/page.html](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/_layouts/page.html).

As for math, I am currently using the rdiscount flavor of Markdown and loading the MathJax script as you can see in [_layouts/default.html](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/_layouts/default.html). However, note that we shoudn't ask too much power out of Markdown for math (<span class="showtooltip" title="Xie Y (2013). 'Markdown or LaTeX? | Yihui Xie.' ."><a href="http://yihui.name/en/2013/10/markdown-or-latex/">Xie, 2013</a></span>).

To use rdiscount locally, I also had to install it. I have also tried out kramdown.


{% highlight bash %}
## Markdown flavors
sudo gem install rdiscount
sudo gem install kramdown

## I don't remember why I also installed this:
sudo gem install nokogiri
{% endhighlight %}


I then customized the index and added other pages:

* [index.html](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/index.html)
	* Used code from Jason Fisher to add the pagination.
* [about.html](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/about.html)
	* Simple description
* [_includes/themes/twitter-2.0/default.html](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/_includes/themes/twitter-2.0/default.html)
	* I added a CSS drop down menu (constructed with [CSS Menu Maker](http://cssmenumaker.com/builder/1044267)) with the blogs I follow. For this I also had to modify [_assets/themes/twitter-2.0/css/style.css](https://github.com/lcolladotor/lcolladotor.github.com/commit/15e03fdc317399b37521f130269adf3e7da7efb3).
	* I modified the footer to mention that my posts are under the Creative Commons License version 3 BY-NC-SA. An idea I took from Yihui Xie's blog.
	

Since I am interested in getting my blog to be a part of [R-bloggers](http://www.r-bloggers.com/), I created an RSS specific for the posts under the `rstats` category to comply with their requirements (<span class="showtooltip" title="Galili T (2013). 'add your blog!' ."><a href="http://www.r-bloggers.com/add-your-blog/">Add your blog!</a></span>). 

For the category-specific RSS I used `feed.category.xml` (<span class="showtooltip" title="(2013). 'jekyll-rss-feeds.' ."><a href="https://github.com/snaptortoise/jekyll-rss-feeds">Jekyll RSS Feed Templates</a></span>) and created [rss-rstats.xml](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/rss-rstats.xml) [see [atom-rstats.xml](https://github.com/lcolladotor/lcolladotor.github.com/blob/master/atom-rstats.xml) if you prefer Atom RSS] which is then processed and converted to [feeds.feedburner.com/FellgernonBit-rstats](http://feeds.feedburner.com/FellgernonBit-rstats). 

Note that I use [FeedBurner](http://feedburner.google.com/) to then create [Twitter updates](https://twitter.com/fellgernon) linking to back to the posts. Also, for the rstats one I add the [#rstats](https://twitter.com/search?q=%23rstats) hashtag to the post. 


### Writing an R post

J. Fisher again explains in detail how to blog using Knitr and Jekyll (<span class="showtooltip" title="Fisher JC (2012). 'Blog with Knitr and Jekyll.' ."><a href="http://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/">Fisher, 2012</a></span>). Since I use [TextMate2](https://github.com/textmate/textmate) as my text editor, I went ahead and modified his code and created a command to do so.

Basically, I modified the `knit` command from the `SWeave` TextMate bundle and added J. Fisher's code. I saved it under the `Menu Actions` of the `SWeave` bundle and linked it to `alt + e`.

For this to work, I use Google Chrome with the [Markdown Preview](https://chrome.google.com/webstore/detail/jmchmkecamhbiokiopfpnfgbidieafmd) extension installed.

This is the [code for the TextMate command](https://gist.github.com/lcolladotor/7388033). You could certainly make it much more concise and drop things, but I like to see a quick preview of the post. However, I still recommend using `jekyll serve` for a final thorough preview of the post before pushing it to GitHub.

<script src="https://gist.github.com/lcolladotor/7388033.js"></script>



### Things I might add

Carl Boettiger has a great site --specially the [Lab Notebook](http://carlboettiger.info/lab-notebook.html) part-- and he describes all the tools he used for making it (<span class="showtooltip" title="Boettiger C (2013). 'About this site.' ."><a href="http://carlboettiger.info/README.html">Boettiger, 2013</a></span>). One of the features I would like to add to my site is the `history` button on the right sidebar he has on his posts which link to the GitHub history of the post. For example check [this post](http://carlboettiger.info/2013/09/25/mozilla-software-review.html) and its [history](https://github.com/cboettig/labnotebook/commits/master/_posts/2013-09-25-mozilla-software-review.md). I think that it can be very useful for those interested in any edits made to the posts. For example, I had to fix a couple of things on one of my recent posts as you can see [here](https://github.com/lcolladotor/lcolladotor.github.com/commits/master/_posts/2013-11-07-bmorebiostats.md).

Looking around, I found the code needed for this to work in Carl's repository: [_includes/sidebar.html](https://github.com/cboettig/labnotebook/blob/master/_includes/sidebar.html), [_plugins/jekyll-labnotebook-plugins](https://github.com/cboettig/labnotebook/tree/master/_plugins/jekyll-labnotebook-plugins).

However, GitHub currently does not support Jekyll plugins. Meaning that if you use any plugins, you have to create the site locally and then push it to GitHub instead of just pushing the new posts and letting GitHub handle creating the site. It's not a huge deal, but for now I'll rely on GitHub and keep things simple for me.



## If I were to do it again


Once you install Jekyll, I think the easiest way to set up your own blog is to fork another person's blog

* [J. Fisher's](https://github.com/jfisher-usgs/jfisher-usgs.github.com), 
* [Yihui Xie's](https://github.com/yihui/en),
* [Carl Boettiger's](https://github.com/cboettig/labnotebook),
* [mine](https://github.com/lcolladotor/lcolladotor.github.com),
* or someone else blog you like.
	
Then delete their posts, give attribution, and customize things like the blog title and other things you would have to customize on any blogging platform (RSS, comments provider, etc). 

Obviously Jekyll gives you much more control over your site, but at the same time, you must also dedicate enough time to learn what to change and make sure that things don't break.


### Post template

To finish describing my setup, [here is my post template](https://gist.github.com/lcolladotor/7387745).

<script src="https://gist.github.com/lcolladotor/7387745.js"></script>

## Wrap up

I hope that you will find some of this information useful if you are thinking of starting your `R` blog powered by Jekyll-Bootstrap and hosted by GitHub. 

Note that since the blog is hosted in GitHub, others can send you pull requests to fix things and/or create guest posts. Just as easily you can make it a multi-author blog by changing the collaborators setting of the GitHub repository.

This wouldn't have been possible without J. Fisher's posts and many other resources available online.




### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2013). knitcitations: Citations for knitr markdown files. R package version 0.4-7."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2013b</a></span>).



-  @jeffreyhorner,  Blog with R Markdown and tumblr: Part I.  *Jeffrey Horner*  [http://jeffreyhorner.tumblr.com/post/25804518110/blog-with-r-markdown-and-tumblr-part-i](http://jeffreyhorner.tumblr.com/post/25804518110/blog-with-r-markdown-and-tumblr-part-i)
-  @jeffreyhorner,  Blog with R Markdown and tumblr: Part II.  *Jeffrey Horner*  [http://jeffreyhorner.tumblr.com/post/25943954723/blog-with-r-markdown-and-tumblr-part-ii](http://jeffreyhorner.tumblr.com/post/25943954723/blog-with-r-markdown-and-tumblr-part-ii)
- Yihui Xie,  Statistics, R, Graphics and Fun | Yihui Xie.  [http://yihui.name/en/](http://yihui.name/en/)
- Jason Fisher,   (2012) Blog with Knitr and Jekyll.  [http://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/](http://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/)
- Jason Fisher,   (2012) Jekyll Build on Windows.  [http://jfisher-usgs.github.io/lessons/2012/05/30/jekyll-build-on-windows/](http://jfisher-usgs.github.io/lessons/2012/05/30/jekyll-build-on-windows/)
-  Installation.  *Jekyll â¢ Simple, blog-aware, static sites*  [http://jekyllrb.com/docs/installation/](http://jekyllrb.com/docs/installation/)
-  Jekyll Quick Start | ruhoh universal static blog generator.  [http://jekyllbootstrap.com/usage/jekyll-quick-start.html](http://jekyllbootstrap.com/usage/jekyll-quick-start.html)
-  Using Themes | ruhoh universal static blog generator.  [http://jekyllbootstrap.com/usage/jekyll-theming.html](http://jekyllbootstrap.com/usage/jekyll-theming.html)
-  Blog migrations.  *Jekyll â¢ Simple, blog-aware, static sites*  [http://jekyllrb.com/docs/migrations/](http://jekyllrb.com/docs/migrations/)
- Tal Galili,  add your blog!.  *R-bloggers*  [http://www.r-bloggers.com/add-your-blog/](http://www.r-bloggers.com/add-your-blog/)
-  jekyll-rss-feeds.  *GitHub*  [https://github.com/snaptortoise/jekyll-rss-feeds](https://github.com/snaptortoise/jekyll-rss-feeds)
- Yihui Xie,   (2013) Markdown or LaTeX? | Yihui Xie.  [http://yihui.name/en/2013/10/markdown-or-latex/](http://yihui.name/en/2013/10/markdown-or-latex/)
- Carl Boettiger,   (2013) About this site.  *Lab Notebook*  [http://carlboettiger.info/README.html](http://carlboettiger.info/README.html)
- Carl Boettiger,   (2013) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)


### Reproducibility


{% highlight r %}
sessionInfo()
{% endhighlight %}



{% highlight text %}
## R version 3.0.2 (2013-09-25)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitcitations_0.4-7 bibtex_0.3-6        knitr_1.5          
## 
## loaded via a namespace (and not attached):
##  [1] codetools_0.2-8 digest_0.6.4    evaluate_0.5.1  formatR_0.10   
##  [5] httr_0.2        RCurl_1.95-4.1  stringr_0.6.2   tools_3.0.2    
##  [9] XML_3.95-0.2    xtable_1.7-1
{% endhighlight %}


