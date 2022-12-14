% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genescore_analysis.R
\name{userScore}
\alias{userScore}
\title{userScore}
\usage{
userScore(data)
}
\arguments{
\item{data}{containing individual data set}
}
\value{
a genetic score on a scale of 0 to 100 of athletic performance
ability and an individual's genetic profile, using 23 gene polymorphisms.
}
\description{
This function is used to calculate a genetic score on a scale of
0 to 100 of an individual genetic profile of 23 gene polymorphisms, using an
algorithm proposed by Williams and Folland in 2008. The algorithm is based
on researched associations between certain variants and athletic endurance
performance. A score of 0, means every gene in the individual genetic profile
is unfavourable for athletic endurance performance, whereas a score
of 100 means every gene in the genetic profile is optimal for athletic
endurance performance.
}
\examples{
# Example:

# First load the individual dataset included in the package
ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
data <- readxl::read_excel(ds)

# Generate histogram using dataset
userScore(data)

}
\references{
Kambouris, M., Ntalouka, F., Ziogas, G., & Maffulli, N. (2012).
Predictive Genomics DNA Profiling for Athletic Performance. Recent patents
on DNA & gene sequences, 6. doi:10.2174/187221512802717321

Petr M, Thiel D, Kateřina K, Brož P, Malý T, Zahálka F, Vostatková P,
Wilk M, Chycki J, Stastny P. Speed and power-related gene polymorphisms
associated with playing position in elite soccer players. Biol Sport.
2022 Mar;39(2):355-366. doi: 10.5114/biolsport.2022.105333.
Epub 2021 Apr 21. PMID: 35309536; PMCID: PMC8919892.
}
