---
layout: post
title: ! 'userR2013 data analysis contest: data exploration'
tags:
- useR2013
- dataanalysis
- contest
- rstats
categories:
- rstats
---
<h1>Description</h1>
<p>The useR2013 conference is organizing a data analysis contest, check the <a href="http://www.edii.uclm.es/%7EuseR-2013/docs/announce.pdf">rules here</a>.</p>
<p>They have a package called <strong>useR2013DAC</strong> with two data sets: one from La Liga and the other one from the Formula 1. Once you download and install the package (<a href="http://www.edii.uclm.es/%7EuseR-2013/#contest">available here</a>), you can quickly explore the data using the following R commands:</p>
<h1>Data exploration</h1>

{% highlight r %}
## Load the package
library(useR2013DAC)

## Explore laliga data
data(laliga)
head(laliga)
{% endhighlight %}

{% highlight r %}##    Season Week               HomeTeam                    AwayTeam
## 1 2008/09    1   Athletic Club Bilbao     Union Deportiva Almeria
## 2 2008/09    1        Atlético Madrid                   Málaga CF
## 3 2008/09    1          Betis Sevilla Real Club Recreativo Huelva
## 4 2008/09    1             CA Osasuna               Villarreal CF
## 5 2008/09    1            CD Numancia                FC Barcelona
## 6 2008/09    1 Deportivo de La Coruña              Real Madrid CF
##   HomeGoals AwayGoals
## 1         1         3
## 2         4         0
## 3         0         1
## 4         1         1
## 5         1         0
## 6         2         1
{% endhighlight %}
{% highlight r %}summary(laliga)
{% endhighlight %}
{% highlight r %}##     Season               Week        HomeTeam           AwayTeam        
##  Length:1900        Min.   : 1.0   Length:1900        Length:1900       
##  Class :character   1st Qu.:10.0   Class :character   Class :character  
##  Mode  :character   Median :19.5   Mode  :character   Mode  :character  
##                     Mean   :19.5                                        
##                     3rd Qu.:29.0                                        
##                     Max.   :38.0                                        
##                                                                         
##    HomeGoals      AwayGoals   
##  Min.   :0.00   Min.   :0.00  
##  1st Qu.:1.00   1st Qu.:0.00  
##  Median :1.00   Median :1.00  
##  Mean   :1.65   Mean   :1.14  
##  3rd Qu.:2.00   3rd Qu.:2.00  
##  Max.   :8.00   Max.   :8.00  
##  NA's   :50     NA's   :50
{% endhighlight %}
{% highlight r %}lapply(laliga, class)
{% endhighlight %}
{% highlight r %}## $Season
## [1] "character"
## 
## $Week
## [1] "integer"
## 
## $HomeTeam
## [1] "character"
## 
## $AwayTeam
## [1] "character"
## 
## $HomeGoals
## [1] "integer"
## 
## $AwayGoals
## [1] "integer"
{% endhighlight %}
{% highlight r %}
## Explore formula1 data
data(formula1)
head(formula1)
{% endhighlight %}
{% highlight r %}##   Pos No             Driver             Team Laps        Time Grid Pts
## 1   1  8    Fernando Alonso          Ferrari   49 1:39:20.396    3  25
## 2   2  7       Felipe Massa          Ferrari   49  +16.0 secs    2  18
## 3   3  2     Lewis Hamilton McLaren-Mercedes   49  +23.1 secs    4  15
## 4   4  5   Sebastian Vettel      RBR-Renault   49  +38.7 secs    1  12
## 5   5  4       Nico Rosberg      Mercedes GP   49  +40.2 secs    5  10
## 6   6  3 Michael Schumacher      Mercedes GP   49  +44.1 secs    7   8
##                                         Race Season
## 1 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
## 2 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
## 3 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
## 4 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
## 5 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
## 6 2010 FORMULA 1 GULF AIR BAHRAIN GRAND PRIX   2010
{% endhighlight %}
{% highlight r %}summary(formula1)
{% endhighlight %}
{% highlight r %}##       Pos            No                     Driver    
##  Ret    :254   1      :  58   Felipe Massa     :  58  
##  1      : 58   10     :  58   Fernando Alonso  :  58  
##  10     : 58   11     :  58   Heikki Kovalainen:  58  
##  11     : 58   12     :  58   Jenson Button    :  58  
##  12     : 58   14     :  58   Kamui Kobayashi  :  58  
##  13     : 58   15     :  58   Lewis Hamilton   :  58  
##  (Other):848   (Other):1044   (Other)          :1044  
##                    Team          Laps             Time          Grid     
##  Ferrari             :116   55     :125   +1 Lap    :268   1      :  58  
##  Force India-Mercedes:116   56     :121   +2 Laps   :102   10     :  58  
##  HRT-Cosworth        :116   53     : 92   Accident  : 93   11     :  58  
##  McLaren-Mercedes    :116   57     : 80   +3 Laps   : 41   12     :  58  
##  STR-Ferrari         :116   70     : 75   Hydraulics: 26   13     :  58  
##  Lotus-Renault       : 78   52     : 69   Gearbox   : 24   14     :  58  
##  (Other)             :734   (Other):830   (Other)   :838   (Other):1044  
##       Pts          Race               Season    
##         :812   Length:1392        Min.   :2010  
##  1      : 58   Class :character   1st Qu.:2010  
##  10     : 58   Mode  :character   Median :2011  
##  12     : 58                      Mean   :2011  
##  15     : 58                      3rd Qu.:2012  
##  18     : 58                      Max.   :2012  
##  (Other):290
{% endhighlight %}
{% highlight r %}lapply(formula1, class)
{% endhighlight %}
{% highlight r %}## $Pos
## [1] "factor"
## 
## $No
## [1] "factor"
## 
## $Driver
## [1] "factor"
## 
## $Team
## [1] "factor"
## 
## $Laps
## [1] "factor"
## 
## $Time
## [1] "factor"
## 
## $Grid
## [1] "factor"
## 
## $Pts
## [1] "factor"
## 
## $Race
## [1] "character"
## 
## $Season
## [1] "numeric"
{% endhighlight %}
<p>I don&#8217;t see a specific question that they want you to answer with this data, but if you find one related to data analysis or visualization then join the competition!</p>
<p>Note that you must be attending the conference in order to be eligible to compete.</p>
<h1>Reproducibility</h1>
{% highlight r %}sessionInfo()
{% endhighlight %}
{% highlight r %}## R version 3.0.0 (2013-04-03)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] useR2013DAC_0.1-1 knitr_1.2        
## 
## loaded via a namespace (and not attached):
## [1] digest_0.6.3   evaluate_0.4.3 formatR_0.7    stringr_0.6.2 
## [5] tools_3.0.0
{% endhighlight %}
