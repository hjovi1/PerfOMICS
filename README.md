
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PerfOMICS

PerfOMICS is an R package that predicts athletic performance scores
using user-provided data on major genetic variants known to be
associated with specific aspects of sports performance to help profile
athletes in terms of endurance, power and speed ability, predict and
forecast effects of training programs and provide genetic insights into
sports-related injury susceptibility and corrective action.

## Description

The goal of PerfOMICS is to:

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

    The \`PerfOMICS\` package was developed using \`R version 4.1.1
    (2021-08-10)\`,

    \`Platform: x86_64-apple-darwin17.0 (64-bit)\` and \`Running under:
    macOS Big Sur 11.2\`

## Installation

You can install the development version of PerfOMICS like so:

``` r
require("devtools")
devtools::install_github("hjovi1/PerfOMICS", build_vignettes = TRUE)
library("PerfOMICS")
```

## Overview

\`PerfOMICS\` contains 4 functions to demonstrate features of an
athletic performance predictor R package. The \*EndurancePredictor\*
function uses genetic variants associated with athletic ability to
compute and output a genetic performance prediction score using the
studied Total Genetic Score ‘TGS’ algorithm. Specifically, the function
provides greater contexts to an individual’s athletic strengths and
weakness’. The function outputs a brief description of the name and
function of the genes used to calculate the score. The
\*EnduranceFreqPlot\* function generates a frequency plot of a large
dataset of TGS. Each genotype of the 23 polymorphism used to calculate
the TGS has a frequency, which is used to generate the large randomized
dataset. \*TrainingRecommendation\* is a function that provides
individualized and general training and health recommendations such as
preventive measures and corrective action for individuals at increased
risk of soft tissue injury as well as guidelines for preventing fat
accumulation and muscle mass increase and nutritional guidelines. The
\*runTestingPackage\* is the function that launches the shiny app for
this package. The package also contains two datasets of genetic data,
called LargeDataset and PersonalDataset. Refer to package vignettes for
more details. An overview of the package is illustrated below.

``` r
# ls("package:PerfOMICS")
# data(package = "PerfOMICS") 
# browseVignettes("PerfOMICS")
```

## Assumptions

Genes and genomic variant selection for predicting athletic performance
depends upon the individual's interpretation of the association studies
and the strength of each association. This package should not be taken
as real medical advice. The development of the algorithms that take into
account genotypes of selected genes, assign "weight" values, threshold
levels and take into account variant to variant interactions in a
DNA-profile-to-trait relation, are proprietary and should be amendable
to patent protection, as are the gene and variant selection itself and
the individual genotype DNA profiles-to-trait interpretations.

## Contritbutions

The author of the package is Helena Jovic.

The generateFreqPlot function makes use of the ggplot R package to plot
the frequency distribution of the TGS for n individual polygenic
profiles.

## References

\[1\] Kambouris, M., Ntalouka, F., Ziogas, G., & Maffulli, N. (2012).
Predictive Genomics DNA Profiling for Athletic Performance. Recent
patents on DNA & gene sequences, 6. <doi:10.2174/187221512802717321>

\[2\] Petr M, Thiel D, Kateřina K, Brož P, Malý T, Zahálka F, Vostatková
P, Wilk M, Chycki J, Stastny P. Speed and power-related gene
polymorphisms associated with playing position in elite soccer players.
Biol Sport. 2022 Mar;39(2):355-366. doi: 10.5114/biolsport.2022.105333.
Epub 2021 Apr 21. PMID: 35309536; PMCID: PMC8919892.

\[3\] Williams AG, Folland JP. Similarity of polygenic profiles limits
the potential for elite human physical performance. J Physiol. 2008 Jan
1;586(1):113-21. doi: 10.1113/jphysiol.2007.141887. Epub 2007 Sep 27.
PMID: 17901117; PMCID: PMC2375556.

\[4\] Ruiz, J. R., Arteta, D., Buxens, A., Artieda, M., Gómez-Gallego,
F., Santiago, C., ... Lucia, A. (2010). Can we identify a power-oriented
polygenic profile? Journal of Applied Physiology, 108(3), 561–566.
<doi:10.1152/japplphysiol.01242.2009>

## **Acknowledgements**

This package was developed as part of an assessment for BCB410H: Applied
Bioinformatics course at the University of Toronto, Toronto, CANADA.
`PerfOMICS` welcomes issues, enhancement requests, and other
contributions. To submit an issue, use the [GitHub
issues](https://github.com/hjovi1/PerfOMICS/issues). Many thanks to
those who provided feedback to improve this package.  

``` r
knitr::include_graphics("man/figures/bcb410.jpg")
```

<img src="man/figures/bcb410.jpg" width="100%" />
