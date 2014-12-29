Title goes here
========================================================

2014-12-29-R-preso-example.Rmd

========================================================
 
## What is R?
 
- A Domain-Specific-Language (DSL) for statistics and data analysis
- Based on the S Programming Language
- An environment for Exploratory Data Analysis (EDA)
- A quasi-functional language with IDE and REPL
- A vectorized language with BLAS support
- A collection of over 7,000+ libraries
- A large and active community across industry and academia
- Around 20 years old (Lineage dates from 1975 - almost 40 years ago)
 

```r
options("digits"=5)
options("digits.secs"=3)
```

heading
========================
## Functions {.smaller}
 

```r
square <- function(x) x^2
square(2)
[1] 4
 
pow <- function(x, p=2) x^p
pow(10)
[1] 100
pow(10,3)
[1] 1000
pow(p=3,10)
[1] 1000
```

First Slide
========================================================

For more details on authoring R presentations click the
**Help** button on the toolbar.

- Bullet 1
- Bullet 2
- Bullet 3

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist    
 Min.   : 4.0   Min.   :  2  
 1st Qu.:12.0   1st Qu.: 26  
 Median :15.0   Median : 36  
 Mean   :15.4   Mean   : 43  
 3rd Qu.:19.0   3rd Qu.: 56  
 Max.   :25.0   Max.   :120  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-4](2014-12-29-R-preso-example.Rmd-figure/unnamed-chunk-4-1.png) 


#---
#title: "2014-12-29-R-preso-example"
#author: "abc"
#date: "2 August 2014"
output:
  ioslides_presentation: default
  beamer_presentation:
    fig_height: 6
    fig_width: 8
    keep_tex: yes
logo: r_logo.png
self_contained: no
fontsize: 10pt
#---
