---
layout: post
title: How to upload files to Dropbox and Google Docs from R
tags:
- rstats
- Google
- Dropbox
categories:
- rstats
---
{% include JB/setup %}







Have you ever wondered whether you can upload files from `R` to [Dropbox](https://www.dropbox.com/) and/or [Google Docs](docs.google.com)? I recently asked myself this question while making my most recent [Shiny](http://www.rstudio.com/shiny/) app (more later). 

The answer is yes, you can upload files from `R` to these cloud services! 

## Dropbox

As far as I know, the best `R` package for uploading files to Dropbox is `rDrop` (<span class="showtooltip" title="Ram K and Temple Lang D (2012). rDrop: Dropbox R interface.. R package version 0.3-0."><a href="http://github.com/karthikram/rDrop">Ram & Temple Lang, 2012</a></span>). The whole setup is very well explained in it's GitHub repository (<span class="showtooltip" title="karthik (2014). 'karthik/rDrop.' ."><a href="https://github.com/karthik/rDrop">Karthik</a></span>). Basically you have to:

* Install the package and it's dependencies (some are only on GitHub).
* Create a Dropbox app in your account.
* Get the credentials info.
* Authorize your access to the Dropbox app from `R`.
* Save that info for later use.


### dropbox_save()

Then uploading any type of `R` object to Dropbox becomes as easy as using the `dropbox_save()` function. 

For example, lets save a simple vector with random data.



{% highlight r %}
suppressMessages(library("rDrop"))

## Define credentials or load them if you defined them already
## dropbox_credentials <- dropbox_auth('Your app key', 'Your app secret')
load("dropbox_credentials.Rdata")

## Lets create some random data
set.seed(20140205)
x <- rnorm(1000)

## Lets check the args of the uploading function
args(dropbox_save)
{% endhighlight %}



{% highlight text %}
## function (cred, ..., list = character(), file = stop("'file' must be specified"), 
##     envir = parent.frame(), precheck = TRUE, verbose = FALSE, 
##     curl = getCurlHandle(), ext = ".rda", .opts = list()) 
## NULL
{% endhighlight %}



{% highlight r %}

## Then lets upload it to dropbox on the public folder
done <- dropbox_save(dropbox_credentials, x, file = "public/x")

## The result has some information, like the path of where you upload the
## file
names(done)
{% endhighlight %}



{% highlight text %}
##  [1] "revision"     "rev"          "thumb_exists" "bytes"       
##  [5] "modified"     "client_mtime" "path"         "is_dir"      
##  [9] "icon"         "root"         "mime_type"    "size"
{% endhighlight %}



{% highlight r %}
done$path
{% endhighlight %}



{% highlight text %}
## [1] "/public/x.rda"
{% endhighlight %}


You can now actually download the "x.rda" file from [here](https://dl.dropboxusercontent.com/u/261002456/x.rda). That's in case that you also wanted to share the file, and is obviously optional.

Note that you can get the link from withing `R` and don't even need to use the Dropbox site.


{% highlight r %}
dropbox_share(dropbox_credentials, file = "public/x.rda")
{% endhighlight %}



{% highlight text %}
## $url
## [1] "https://db.tt/xzf3huXf"
## 
## $expires
## [1] "Tue, 01 Jan 2030 00:00:00 +0000"
{% endhighlight %}




### dropbox_put()

What if you want to upload an actual file and not only `R` objects? That's where `dropbox_put()` shines. Below is an example where we create an image, save it as a pdf file, and upload it to Dropbox.


{% highlight r %}
## Lets create a sample file, in this case a pdf file
pdf("dropboxFig.pdf")
hist(x, freq = FALSE, col = "light blue")
tmp <- dev.off()

## Lets check the args for the uploading function
args(dropbox_put)
{% endhighlight %}



{% highlight text %}
## function (cred, what, filename = what, curl = getCurlHandle(), 
##     ..., verbose = FALSE, contentType = "application/octet-stream") 
## NULL
{% endhighlight %}



{% highlight r %}

## Now, lets upload the file
done <- dropbox_put(dropbox_credentials, what = "dropboxFig.pdf", filename = "public/dropboxFig.pdf")

## Again, the result contains some information about the file
names(done)
{% endhighlight %}



{% highlight text %}
##  [1] "revision"     "rev"          "thumb_exists" "bytes"       
##  [5] "modified"     "client_mtime" "path"         "is_dir"      
##  [9] "icon"         "root"         "mime_type"    "size"
{% endhighlight %}


You can view the result [here](https://dl.dropboxusercontent.com/u/261002456/dropboxFig.pdf).


## Google Docs

From what I found, it seems to me that `RGoogleDocs` (<span class="showtooltip" title="Lang DT (2014). RGoogleDocs: Primitive interface to Google Documents from R. R package version 0.7-0."><a href="">Temple Lang</a></span>) is the package you'll want to use for interacting with Google Docs from R. The manual (<span class="showtooltip" title="(2014). 'An simple R interface to Google Documents.' ."><a href="http://www.omegahat.org/RGoogleDocs/run.html">Temple Lang</a></span>) explains all what you pretty much need to know. You should know though that you can only upload certain types of files. 

For example, you can upload a text file as shown below.


{% highlight r %}
suppressMessages(library("RGoogleDocs"))

## Load password
load("gpasswd.Rdata")

## Something to write
text <- "Hello world!\n"

## Authentificate
auth <- getGoogleAuth("fellgernon@gmail.com", gpasswd)

## Connect to Google
con <- getGoogleDocsConnection(auth)

## Check the args for the uploading function
args(uploadDoc)
{% endhighlight %}



{% highlight text %}
## function (content, con, name, type = as.character(findType(content)), 
##     binary = FALSE, asText = FALSE, folder = NULL, replace = TRUE, 
##     ...) 
## NULL
{% endhighlight %}



{% highlight r %}

## Upload the file
done <- uploadDoc(content = text, con = con, name = "testFile.txt", type = "txt")
{% endhighlight %}


You can view the file [here](https://docs.google.com/document/d/1QCInrPitTJrmXiyA6TlNuQIEhi344MQl1C3zqqoqAVY/edit?usp=sharing).


## Conclusions

`rDrop` (<span class="showtooltip" title="Ram K and Temple Lang D (2012). rDrop: Dropbox R interface.. R package version 0.3-0."><a href="http://github.com/karthikram/rDrop">Ram & Temple Lang, 2012</a></span>) is very cool and easy to use. Compared to Google Docs, you have much greater flexibility on the type of files you can upload. I guess that will change in the future if there is a Google Drive from `R` package.

### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2014). knitcitations: Citations for knitr markdown files. R package version 0.5-0."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2014</a></span>).



-  karthik,  karthik/rDrop.  *GitHub*  [https://github.com/karthik/rDrop](https://github.com/karthik/rDrop)
-  An simple R interface to Google Documents.  [http://www.omegahat.org/RGoogleDocs/run.html](http://www.omegahat.org/RGoogleDocs/run.html)
- Carl Boettiger,   (2014) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)
- Karthik Ram, Duncan  Temple Lang,   (2012) rDrop: Dropbox R interface..  [http://github.com/karthikram/rDrop](http://github.com/karthikram/rDrop)
- Duncan Lang,  RGoogleDocs: Primitive interface to Google Documents from R.


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
##  [1] RGoogleDocs_0.7-0   rDrop_0.3-0         stringr_0.6.2      
##  [4] plyr_1.8            ROAuth_0.92.0       digest_0.6.4       
##  [7] RCurl_1.95-4.1      bitops_1.0-6        RJSONIO_1.0-3      
## [10] knitcitations_0.5-0 bibtex_0.3-6        knitr_1.5          
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   httr_0.2       tools_3.0.2   
## [5] XML_3.95-0.2   xtable_1.7-1
{% endhighlight %}

Check other topics on [#rstats](https://twitter.com/search?q=%23rstats).
