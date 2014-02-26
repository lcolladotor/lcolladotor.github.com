---
layout: post
title: rMaps Mexico map
tags:
- network
categories:
- rstats
---
{% include JB/setup %}







## It's exciting when great people help each other get things done

This is a simple networking story, which might not be surprising to some but I was happily surprised by it. This is how the story goes:

Two weeks ago `rMaps` (<span class="showtooltip" title="Vaidyanathan R (2014). rMaps: Interactive Maps from R. R package version 0.1."><a href="">Vaidyanathan, 2014</a></span>) was released. After making a [blog post](http://lcolladotor.github.io/2014/02/10/rMaps-released/#.Uwz64kJdV18) about it I thought about using it to make a map of the homicide rate in Mexico over the recent years. First, I had the question of how to make custom maps with `rMaps`. [@tyokota](https://github.com/tyokota) had the same question and started asking [Ramnath](https://github.com/ramnathv) about it in [rMaps issue 6](https://github.com/ramnathv/rMaps/issues/6). Then I realized I needed a specific file with the map information. Google lead me to [@diegovalle](https://github.com/diegovalle) who has created the map from official Mexican sources, downloaded the homicide data, cleaned it, and made several maps and analyses: all his work is very impressive! I thought that it'd be very cool if [@diegovalle](https://github.com/diegovalle) and [Ramnath](https://github.com/ramnathv) connected, and they did! I saw them interacting via Twitter ([here](https://twitter.com/diegovalle/status/433619946434596864) and [here](https://twitter.com/ramnath_vaidya/status/433813747593801728)) and via [GitHub](https://github.com/ramnathv/rMaps/issues/6). After sharing [@diegovalle](https://github.com/diegovalle)'s work with my friends, it turned out that some old friends already knew him ([here](https://twitter.com/unRob/status/433675310542749696) and high school friends). Another friend was interested in additional features and I suggested her to contact [@diegovalle](https://github.com/diegovalle) via Twitter: he quickly replied as you can see [here](https://twitter.com/diegovalle/status/434444498341347328).


Beyond how impressive `rMaps` and [@diegovalle](https://github.com/diegovalle)'s work on mexican data are, I was amazed by the willingness to help each other and how great people easily connected. I believe this is one of the great features of both GitHub and Twitter where you can share your code, ask questions, try to answer them, meet people working with your tools, etc. You can even offer to PayPal a beer like [@tyokota](https://github.com/tyokota) did.

After all their great work, now someone like me (aka, without knowing javascript, Datamaps, etc) can walk you through an example of making an interactive choropleth map showing the homicides rates in Mexico from 1997 to 2013.


## Homicides rates in Mexico 1997-2013


The first thing we need to make a custom map using `rMaps` is a [topojson](http://en.wikipedia.org/wiki/TopoJSON) file which in this case specifies the mexican states boundaries. This process is explained in more detail by [@tyokota](https://github.com/tyokota) at [custom-map](https://github.com/tyokota/custom-map) which you can view [here](https://github.com/tyokota/custom-map/blob/master/custom-map.Rmd). 

In this particular example, [INEGI](http://www.inegi.org.mx/) which is the National Institute of Statistics and Geography of Mexico has a map of the mexican states. [@diegovalle](https://github.com/diegovalle) explained how to download it [here](https://github.com/ramnathv/rMaps/issues/6#issuecomment-34942284). 

But before doing so, you might to install `topojson` like I did below following the [installation instructions](https://github.com/mbostock/topojson/wiki/Installation). In the terminal:



{% highlight bash %}
## Install node.js following instructions at https://github.com/mbostock/topojson/wiki/Installation
brew install node
## Install topojson
npm install -g topojson

## Download map info from INEGI (Mexican official source)
curl -o estados.zip http://mapserver.inegi.org.mx/MGN/mge2010v5_0.zip
## Decompress file
unzip estados.zip
## Create shapefile
ogr2ogr states.shp Entidades_2010_5.shp -t_srs "+proj=longlat +ellps=WGS84 +no_defs +towgs84=0,0,0"
## id-property needed so that DataMaps knows how to color the map
topojson -o mx_states.json -s 1e-7 -q 1e5 states.shp -p state_code=+CVE_ENT,name=NOM_ENT --id-property NOM_ENT
{% endhighlight %}


Now that we have the [topojson](http://en.wikipedia.org/wiki/TopoJSON) file __mx_states.json__ we need to get the actual homicide data. [@diegovalle](https://github.com/diegovalle) has gone through the whole process of acquiring the data from official mexican sources and cleaning it. Lets download it.


{% highlight r %}
# Download crime data
## From crimenmexico.diegovalle.net/en/csv
## All local crimes at the state level
download.file("http://crimenmexico.diegovalle.net/en/csv/fuero-comun-estados.csv.gz", 
	"fuero-comun-estados.csv.gz")
{% endhighlight %}



The data is not completely ready for us to use it and we need to reshape it a bit. In particular, we want to consider only the intentional homicides and group the data by state and date. We can get this to work by using `dplyr` (<span class="showtooltip" title="Wickham H and Francois R (2014). dplyr: dplyr: a grammar of data manipulation. R package version 0.1.1."><a href="http://CRAN.R-project.org/package=dplyr">Wickham & Francois, 2014</a></span>).



{% highlight r %}
## Load required packages
library("dplyr")

## Load the crime data
crime <- read.csv("fuero-comun-estados.csv.gz")

## Only intentional homicides
crime <- subset(crime, crime == "HOMICIDIOS" & type == "DOLOSOS")

## Sum homicides by firearm, etc and group by state and date
hom <- crime %.%
  filter(year %in% 1997:2013) %.%
  group_by(state_code, year, type) %.%
  summarise(total = sum(count, na.rm = TRUE),
            population = mean(population) ) %.%
  mutate(rate = total / population * 10^5) %.%
  arrange(state_code, year)

## How are states coded?
summary(hom$state_code)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.00    8.75   16.50   16.50   24.20   32.00
{% endhighlight %}


We have the slight inconvenience that states are coded as integers from 1 to 32 instead of using their names. Using another of the files supplied by [@diegovalle](https://github.com/diegovalle) we can merge the codes. This requires using the `foreign` (<span class="showtooltip" title="R Core Team (2014). foreign: Read Data Stored by Minitab, S, SAS, SPSS, Stata, Systat, Weka, dBase.... R package version 0.8-59."><a href="http://CRAN.R-project.org/package=foreign">R Core Team</a></span>) package for loading a _dbf_ file and then merging both data sets with `plyr` (<span class="showtooltip" title="Wickham H (2011). 'The Split-Apply-Combine Strategy for Data Analysis.' Journal of Statistical Software, 40(1), pp. 1-29. ."><a href="http://www.jstatsoft.org/v40/i01/">Wickham, 2011</a></span>).






{% highlight r %}
## Needed for read.dbf
library("foreign")

## The dbf from the state shapefile needed to merge state_code with state
## names
codes <- read.dbf("states.dbf")
codes$NOM_ENT <- iconv(codes$NOM_ENT, "windows-1252", "utf-8")
codes$CVE_ENT <- as.numeric(codes$CVE_ENT)
codes$OID <- NULL
names(codes) <- c("state_code", "name")

## Load plyr for join(). Loading it before creates a problem with the dplyr
## call above
library("plyr")

## Names needed for the map
hom <- join(hom, codes)

## Lets look at the data
head(hom)
{% endhighlight %}



{% highlight text %}
##   state_code year    type total population   rate           name
## 1          1 1997 DOLOSOS   355     958126 37.051 Aguascalientes
## 2          1 1998 DOLOSOS    66     975585  6.765 Aguascalientes
## 3          1 1999 DOLOSOS    27     992515  2.720 Aguascalientes
## 4          1 2000 DOLOSOS    14    1009215  1.387 Aguascalientes
## 5          1 2001 DOLOSOS    22    1026437  2.143 Aguascalientes
## 6          1 2002 DOLOSOS    26    1044578  2.489 Aguascalientes
{% endhighlight %}


Great! We now have state names under _name_ and the intentional homicide rate under _rate_ (in homicides per 100,000) for each specific _year_. We can thus proceed to making the interactive choropleth map using the `ichoropleth` function described by [Ramnath](https://github.com/ramnathv) [here](http://rmaps.github.io/blog/posts/animated-choropleths/index.html). This requires specifying the [topojson](http://en.wikipedia.org/wiki/TopoJSON) file which is specified via _dataUrl_, the name of the map specified via _scope_ and the most tricky part (for me at least) is that we need to specify the _setProjection_. These are all properties of the [Datamaps](https://github.com/markmarkoh/datamaps) library. In particular, the wiki describes [how to use custom maps](https://github.com/markmarkoh/datamaps/blob/master/README.md#using-custom-maps) but this requires some javascript knowledge.




{% highlight r %}
## Make the map
library("rMaps")
d1 <- ichoropleth(rate ~ name, data = hom, ncuts = 9, pal = 'YlOrRd', 
    animate = 'year',  map = 'states'
)
## Note that I am hosting the mx_states.json in Dropbox
## but if you are doing it locally, you only need
## dataUrl = "mx_states.json"
d1$set(
  geographyConfig = list(
   dataUrl = "https://dl.dropboxusercontent.com/u/10794332/mx_states.json"
  ),
 scope = 'states',
 setProjection = '#! function( element, options ) {
   var projection, path;
   projection = d3.geo.mercator()
    .center([-89, 21]).scale(element.offsetWidth)
    .translate([element.offsetWidth / 2, element.offsetHeight / 2]);

   path = d3.geo.path().projection( projection );
   return {path: path, projection: projection};
  } !#'
)
d1$save('rMaps.html', cdn = TRUE)
{% endhighlight %}


The end result is shown below:


<iframe src='
http://lcolladotor.github.io/figs/2014-02-26-excited-by-willingness-to-help-get-things-done/rMaps.html
' scrolling='no' seamless
class='rChart datamaps '
id=iframe-
chart1859838d5e973
width=100%
height=500px
 ></iframe>

You can also share the map using the _publish_ method as shown below:



{% highlight r %}
d1$publish("Intentional homicides rates for Mexico 1997-2013")
## You'll need a GitHub account
{% endhighlight %}


You will get a link to the rCharts viewer such as [this one](http://rcharts.io/viewer/?9223554#.Uw1tNEJdV18) or if you prefer, you can also view the result using Pagist as shown [here](http://www.pagist.info/9223554). 



The code presented in this post was written by [@diegovalle](https://github.com/diegovalle) which can you view [here](http://bl.ocks.org/diegovalle/8967565) and [Ramnath](https://github.com/ramnathv) which is shown [here](https://github.com/ramnathv/rMaps/issues/6#issuecomment-34946041). I also figured out the trick of hosting the [topojson](http://en.wikipedia.org/wiki/TopoJSON) file at Dropbox from [@tyokota](https://github.com/tyokota)'s [code](https://github.com/tyokota/custom-map/blob/master/custom-map.Rmd) as I was running into _Access-Control-Allow-Origin_ errors when hosting it in my academic website. Finally, but not least, [Ramnath](https://github.com/ramnathv) appropriately insists that all of this would not be possible without libraries such as [Datamaps](https://github.com/markmarkoh/datamaps).



### References

Citations made with `knitcitations` (<span class="showtooltip" title="Boettiger C (2014). knitcitations: Citations for knitr markdown files. R package version 0.5-0."><a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2014</a></span>).



- Hadley Wickham, Romain Francois,   (2014) dplyr: dplyr: a grammar of data manipulation.  [http://CRAN.R-project.org/package=dplyr](http://CRAN.R-project.org/package=dplyr)
- R Core Team ,   (2014) foreign: Read Data Stored by Minitab, S, SAS, SPSS, Stata, Systat, Weka,
dBase, ....  [http://CRAN.R-project.org/package=foreign](http://CRAN.R-project.org/package=foreign)
- Carl Boettiger,   (2014) knitcitations: Citations for knitr markdown files.  [http://CRAN.R-project.org/package=knitcitations](http://CRAN.R-project.org/package=knitcitations)
- Hadley Wickham,   (2011) The Split-Apply-Combine Strategy for Data Analysis.  *Journal of Statistical Software*  **40**  (1)   1-29  [http://www.jstatsoft.org/v40/i01/](http://www.jstatsoft.org/v40/i01/)
- Ramnath Vaidyanathan,   (2014) rMaps: Interactive Maps from R.


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
## [1] rMaps_0.1.1         plyr_1.8            foreign_0.8-59     
## [4] dplyr_0.1.1         knitcitations_0.5-0 bibtex_0.3-6       
## [7] knitr_1.5          
## 
## loaded via a namespace (and not attached):
##  [1] assertthat_0.1     digest_0.6.4       evaluate_0.5.1    
##  [4] formatR_0.10       grid_3.0.2         httr_0.2          
##  [7] lattice_0.20-24    rCharts_0.4.2      RColorBrewer_1.0-5
## [10] Rcpp_0.11.0        RCurl_1.95-4.1     RJSONIO_1.0-3     
## [13] stringr_0.6.2      tools_3.0.2        whisker_0.3-2     
## [16] XML_3.95-0.2       xtable_1.7-1       yaml_2.1.10
{% endhighlight %}


Check other topics on [#rstats](https://twitter.com/search?q=%23rstats).
