This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you
execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk
or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*.

``` r
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)
library(rpart)
library(rpart.plot)
library(Amelia)
```

    ## Loading required package: Rcpp

    ## ## 
    ## ## Amelia II: Multiple Imputation
    ## ## (Version 1.7.5, built: 2018-05-07)
    ## ## Copyright (C) 2005-2018 James Honaker, Gary King and Matthew Blackwell
    ## ## Refer to http://gking.harvard.edu/amelia/ for more information
    ## ##

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or
by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output
will be saved alongside it (click the *Preview* button or press
*Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the
editor. Consequently, unlike *Knit*, *Preview* does not run any R code
chunks. Instead, the output of the chunk when it was last run in the
editor is displayed.

Nursery Data Set
----------------

Source: <http://archive.ics.uci.edu/ml/datasets/Nursery>

class values

not\_recom, recommend, very\_recom, priority, spec\_prior

attributes

parents: usual, pretentious, great\_pret. has\_nurs: proper,
less\_proper, improper, critical, very\_crit. form: complete, completed,
incomplete, foster. children: 1, 2, 3, more. housing: convenient,
less\_conv, critical. finance: convenient, inconv. social: nonprob,
slightly\_prob, problematic. health: recommended, priority, not\_recom.

``` r
nursery_data <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/nursery/nursery.data", header = FALSE, col.names = c("parents","has_nurs","form","children","housing","finance","social","health","class"))
```

### Data Set exploration

``` r
head(nursery_data)
```

    ##   parents has_nurs     form children    housing    finance        social
    ## 1   usual   proper complete        1 convenient convenient       nonprob
    ## 2   usual   proper complete        1 convenient convenient       nonprob
    ## 3   usual   proper complete        1 convenient convenient       nonprob
    ## 4   usual   proper complete        1 convenient convenient slightly_prob
    ## 5   usual   proper complete        1 convenient convenient slightly_prob
    ## 6   usual   proper complete        1 convenient convenient slightly_prob
    ##        health     class
    ## 1 recommended recommend
    ## 2    priority  priority
    ## 3   not_recom not_recom
    ## 4 recommended recommend
    ## 5    priority  priority
    ## 6   not_recom not_recom

``` r
str(nursery_data)
```

    ## 'data.frame':    12960 obs. of  9 variables:
    ##  $ parents : Factor w/ 3 levels "great_pret","pretentious",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ has_nurs: Factor w/ 5 levels "critical","improper",..: 4 4 4 4 4 4 4 4 4 4 ...
    ##  $ form    : Factor w/ 4 levels "complete","completed",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ children: Factor w/ 4 levels "1","2","3","more": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ housing : Factor w/ 3 levels "convenient","critical",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ finance : Factor w/ 2 levels "convenient","inconv": 1 1 1 1 1 1 1 1 1 2 ...
    ##  $ social  : Factor w/ 3 levels "nonprob","problematic",..: 1 1 1 3 3 3 2 2 2 1 ...
    ##  $ health  : Factor w/ 3 levels "not_recom","priority",..: 3 2 1 3 2 1 3 2 1 3 ...
    ##  $ class   : Factor w/ 5 levels "not_recom","priority",..: 3 2 1 3 2 1 2 2 1 5 ...
