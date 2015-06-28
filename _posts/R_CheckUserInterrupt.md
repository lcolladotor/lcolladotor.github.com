# PERFORMANCE: Calling R_CheckUserInterrupt() every 256 iteration is actually faster than ever 1,000,000 iteration

If your native code takes more than a few seconds to finish, it is a nice courtesy to the user to check for user interrupts (Ctrl-C) once in a while, say, every 1,000 or 1,000,000 iteration.  The C-level API of R provides `R_CheckUserInterrupt()` for this (see 'Writing R Extensions' for more information on this function).  Here's what the code would typically look like:
```c
for (int ii = 0; ii < n; ii++) {
  /* Some computational expensive code */
  if (ii % 1000 == 0) R_CheckUserInterrupt()
}
```
This uses the modulo operator `%` and tests when it is zero, which happens every 1,000 iteration.  When this occurs, it calls `R_CheckUserInterrupt()`, which will interrupt the processing and "return to R" whenever an interrupt is detected.

Interestingly, it turns out that, it is _significantly faster to do this check every $k=2^m$ iteration_, e.g. instead of doing it every 1,000 iteration, it is faster to do it every 1,024 iteration.  Similarly, instead of, say, doing it every 1,000,000 iteration, do it every 1,048,576 - not one less (1,048,575) or one more (1,048,577).  The difference is so large that it is even 2-3 times faster to call `R_CheckUserInterrupt()` every 256 iteration rather than, say, every 1,000,000 iteration, which at least to me was a bit counter intuitive the first time I observed it.

Below are some benchmark statistics supporting the claim that testing / calculating `ii % k == 0` is faster for $k=2^m$ (blue) than for other choices of $k$ (red).

![Boxplot showing that testing every 2^k:th iteration is faster](figures/boxplot.png)

Note that the times are on the log scale (the results are also tabulated at the end of this post).  Now, will it make a big difference to the overall performance of you code if you choose, say, 1,048,576 instead of 1,000,000?  Probably not, but on the other hand, it does not hurt to pick an interval that is a $2^m$ integer.  This observation may also be useful in algorithms that make lots of use of the modulo operator.

So why is `ii % k == 0` a faster test when $k=2^m$?  I can only speculate.  For instance, the integer $2^m$ is a binary number with all bits but one set to zero.  It might be that this is faster to test for than other bit patterns, but I don't know if this is because of how the native code is optimized by the compiler and/or if it goes down to the hardware/CPU level.  I'd be interested in feedback and hear your thoughts on this.


## Details on how the benchmarking was done
I used the [inline] package to generate a set of C-level functions with varying interrupt intervals ($k$).   I'm not passing $k$ as a parameter to these functions.  Instead, I use it as a constant value so that the compiler can optimize as far as possible, but also in order to imitate how most code is written.  This is why I generate multiple C functions.
I benchmarked across a wide range of interval choices using the [microbenchmark] package.  The C functions (with corresponding R functions calling them) and the corresponding benchmark expressions to be called were generated as follows:
```r
## The interrupt intervals to benchmark
## (a) Classical values
ks <- c(1, 10, 100, 1000, 10e3, 100e3, 1e6)
## (b) 2^k values and the ones before and after
ms <- c(2, 5, 8, 10, 16, 20)
as <- c(-1, 0, +1) + rep(2^ms, each=3)

## List of unevaluated expressions to benchmark
mbexpr <- list()

for (k in sort(c(ks, as))) {
  name <- sprintf("every_%d", k)

  ## The C function
  assign(name, inline::cfunction(c(length="integer"), body=sprintf("
    int i, n = asInteger(length);
    for (i=0; i < n; i++) {
      if (i %% %d == 0) R_CheckUserInterrupt();
    }
    return ScalarInteger(n);
  ", k)))

  ## The corresponding expression to benchmark
  mbexpr <- c(mbexpr, substitute(every(n), list(every=as.symbol(name))))
}
```
The actual benchmarking of the 25 cases was then done by calling:
```r
n <- 10e6  ## Number of iterations
stats <- microbenchmark::microbenchmark(list=mbexpr)
```


|expr             |     min|      lq|    mean|  median|      uq|     max|
|:----------------|-------:|-------:|-------:|-------:|-------:|-------:|
|every_1(n)       | 1977.41| 2109.83| 2495.52| 2412.86| 2733.91| 3932.09|
|every_3(n)       |  658.88|  691.41|  843.91|  724.29|  970.83| 1365.67|
|every_4(n)       |  495.78|  520.03|  621.94|  538.70|  692.91| 1061.11|
|every_5(n)       |  403.45|  425.86|  526.47|  443.48|  658.85|  880.86|
|every_10(n)      |  209.04|  218.80|  282.02|  228.81|  339.77|  497.27|
|every_31(n)      |   79.79|   83.03|  106.87|   86.21|  101.30|  229.72|
|every_32(n)      |   71.04|   73.47|   89.74|   75.79|   81.69|  177.11|
|every_33(n)      |   74.14|   78.20|  103.27|   79.66|  137.80|  195.52|
|every_100(n)     |   38.53|   40.42|   50.07|   41.10|   46.64|  101.62|
|every_255(n)     |   25.53|   26.70|   33.49|   27.23|   29.42|   77.94|
|every_256(n)     |   15.56|   15.99|   22.03|   16.67|   31.29|   44.71|
|every_257(n)     |   24.03|   24.71|   31.23|   25.76|   27.92|   57.42|
|every_1000(n)    |   18.16|   19.09|   22.49|   19.50|   20.38|   45.02|
|every_1023(n)    |   19.34|   20.02|   24.18|   20.72|   21.75|   46.10|
|every_1024(n)    |    9.32|    9.67|   12.39|   10.04|   10.83|   36.87|
|every_1025(n)    |   19.43|   20.37|   24.04|   20.77|   22.29|   50.48|
|every_10000(n)   |   16.22|   17.05|   22.11|   17.43|   20.87|   43.56|
|every_65535(n)   |   17.47|   18.12|   21.91|   18.69|   19.22|   45.65|
|every_65536(n)   |    7.29|    7.63|    9.69|    7.84|    8.04|   21.37|
|every_65537(n)   |   18.79|   19.30|   24.37|   20.16|   21.18|   61.36|
|every_100000(n)  |   16.02|   16.69|   21.60|   17.16|   20.04|   39.97|
|every_1000000(n) |   15.94|   16.84|   21.34|   17.13|   19.85|   48.35|
|every_1048575(n) |   17.40|   18.55|   23.43|   18.73|   20.55|   55.00|
|every_1048576(n) |    7.23|    7.60|    9.56|    7.80|    8.45|   19.98|
|every_1048577(n) |   18.81|   19.39|   23.40|   20.08|   20.60|   46.81|

I get similar results across various operating systems (Windows, OS X and Linux) all using GNU Compiler Collection (GCC).


Feedback and comments are apprecated!


To reproduce these results, do:
```r
> path <- 'https://raw.githubusercontent.com/HenrikBengtsson/jottr.org/master/blog/20150604%2CR_CheckUserInterrupt'
> html <- R.rsp::rfile('R_CheckUserInterrupt.md.rsp', path=path)
> !html  ## Open in browser
```

[inline]: http://cran.r-project.org/package=inline
[microbenchmark]: http://cran.r-project.org/package=microbenchmark

