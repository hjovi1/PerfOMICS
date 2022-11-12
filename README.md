
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PerfOMICS

PerfOMICS is an R package that predicts athletic performance scores
using user-provided data on major genetic variants known to be
associated with specific aspects of sports performance to help profile
athletes in terms of endurance, power and speed ability, predict and
forecast effects of training programs and provide genetic insights into
sports-related injury susceptibility and corrective action.

## Description

The goal of PerfOMICS is to…

1.  Profile athletes in terms of endurance, power and speed.

2.  Predict and forecasting the effects of training programs and
    strategies.

3.  Provide genetic insights into injury susceptibility, prevention and
    disease management.

    This tool can further assist in helping athletes decide their choice
    of sport or athletic activity, maximize athletic potential through
    tailoring of athletic programs, provide guidelines on preventive
    measures and corrective action for athletes susceptible to
    sports-related injuries.

    Genes and genomic variant selection for predicting athletic
    performance depends upon the individual's interpretation of the
    association studies and the strength of each association. This
    package should not be taken as real medical advice. The development
    of the algorithms that take into account genotypes of selected
    genes, assign "weight" values, threshold levels and take into
    account variant to variant interactions in a DNA-profile-to-trait
    relation, are proprietary and should be amendable to patent
    protection, as are the gene and variant selection itself and the
    individual genotype DNA profiles-to-trait interpretations.

ls(“package:TestingPackage”)

data(package = “TestingPackage”)

browseVignettes(“TestingPackage”)

## Installation

You can install the development version of PerfOMICS like so:

``` r
require("devtools")
devtools::install_github("hjovi1/PerfOMICS", build_vignettes = TRUE)
library("PerfOMICS")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(PerfOMICS)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
