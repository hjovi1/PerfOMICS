#' Purpose: Calculate the Total Genetic Score using the genotypes of 23
#' polymorphims of genes associated with endurance athletic ability.
#' Author: Helena Jovic
#' Date: November 11, 2022
#' Version: 1.0
#' Bugs and Issues:
#'
#' Before each session run this in console
#' library(devtools)
#' library(roxygen2)
#' library(testthat)
#' library(knitr)
#'
#' A function that compiles genetic information of 23 genes associated with
#' endurance athletic ability. The function using researched statistical data
#' on the frequencies of the genotypes of each gene. Each genotype is paired
#' with a respective genetic score, revealing how favourable it is for athletic
#' ability.
#'
#' @return a dataframe containing a column of genes associated with athletic
#' ability and a corresponding column of scores paired with each gene for one
#' individual.
#'
#' @examples
#' # Using airwayCounts and airwayMetadata available with package
#'
#' # perform DGE analysis with DESeq2
#' dds <- DESeq2::DESeqDataSetFromMatrix(countData=airwayCounts,
#'                                       colData=airwayMetadata,
#'                                       design=~dex,
#'                                       tidy=TRUE)
#' dds <- DESeq2::estimateSizeFactors(dds)
#'
#' dds@colData$dex <- relevel(dds@colData$dex, ref = "control")
#' dds <- DESeq2::DESeq(dds)
#'
#' res <- DESeq2::results(dds, tidy=TRUE)
#' deseq2Res <- DESeq2::lfcShrink(dds, coef = "dex_treated_vs_control",
#'                                   type = "apeglm")
#'
#' # perform DGE analysis with edgeR
#' counts <- data.frame(airwayCounts[,-1], row.names = airwayCounts$ensgene)
#'
#' diffList <- edgeR::DGEList(counts, samples = airwayMetadata)
#'
#' dex <- factor(rep(c("control", "treated"), 4))
#' design <- model.matrix(~dex)
#' rownames(design) <- colnames(diffList)
#'
#' diffList <- edgeR::estimateDisp(diffList, design, robust = TRUE)
#' fit <- edgeR::glmFit(diffList, design)
#' lrt <- edgeR::glmLRT(fit)
#' edgerRes <- edgeR::topTags(lrt, n = dim(lrt)[1])$table
#'
#' # make the Volcano plots
#' compVolcano(deseq2Result = deseq2Res,
#'        edgerResult = edgerRes)
#'
#' @references
#'
#' Kambouris, M., Ntalouka, F., Ziogas, G., & Maffulli, N. (2012).
#' Predictive Genomics DNA Profiling for Athletic Performance. Recent patents
#' on DNA & gene sequences, 6. doi:10.2174/187221512802717321
#'
#' Petr M, Thiel D, Kateřina K, Brož P, Malý T, Zahálka F, Vostatková P,
#' Wilk M, Chycki J, Stastny P. Speed and power-related gene polymorphisms
#' associated with playing position in elite soccer players. Biol Sport.
#' 2022 Mar;39(2):355-366. doi: 10.5114/biolsport.2022.105333.
#' Epub 2021 Apr 21. PMID: 35309536; PMCID: PMC8919892.
#'
#' @export
#' @import ggplot2

genotypeProb <- function(){
gene <- c("ACE2", "ACTN3","ADRA2A","ADRB2","AMPD1","APOE","ATP1A2","ATP1A2x",
          "BDKRB2","CKM","EPAS1","EPAS1x","HFE","HIF1A","HLAA","MTND5","MTND5x",
          "MTND5y", "MTTT","PPARA","PPARGC1A","UCP2","VEGFA")
score <- c(sample(c(0,1,2), 1, replace=TRUE, prob = c(0.29,0.50, 0.21)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.15,0.50, 0.35)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.19, 0.80)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.12,0.64, 0.24)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.18, 0.81)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.63,0.32, 0.05)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.55, 0.15)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.07,0.44, 0.49)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.18,0.49, 0.33)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.33,0.48, 0.19)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.71,0.25, 0.04)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.02,0.21, 0.77)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.84,0.14, 0.02)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.07,0.93)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.03,0.27, 0.70)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.09,0.51, 0.40)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.35,0.48, 0.17)),
                   sample(c(0,1,2), 1, replace=TRUE, prob = c(0.25,0.45, 0.30)))

df <- data.frame(gene, score)
return(df)
}

#'Helper function: calculateTGS()
#'
#'Purpose: Total genotype score (TGS) reflects the additive effect of genotypes
#'on predicting a complex trait such as athletic performance. It is an algorithm
#'introduced by Williams and Folland and is also known as a genetic
#'predisposition score using synthetic data of 23 genetic markers.
#'
#'@references
#'Williams, A. G., & Folland, J. P. (2008). Similarity of polygenic profiles
#'limits the potential for elite human physical performance. The Journal of
#'physiology, 586(1), 113–121. https://doi.org/10.1113/jphysiol.2007.141887
#'
#'@return Returns the total genotype score (TGS) of one polygenic profile.
#'
calculateTGS <- function(){
  genes <- genotypeProb()
  scores <- genotypeProb()["score"]
  TGS <- ((100/46)*sum(scores))
  return(TGS)
}

athleteProfile <- function(){
  ind <- genotypeProb()
  scores <-ind["score"]
  TGS <- ((100/46)*sum(scores))
  scor <- ind$score

  favourable <- list()
  neutral <- list()
  unfavourable <- list()

  counter = 1
  for (s in ind$score){
    if (s == 0){
      unfavourable <- append(unfavourable,ind$gene[counter])
      counter = counter + 1
    }
    if (s == 1){
      neutral <- append(neutral,ind$gene[counter])
      counter = counter + 1
    }
    if (s == 2){
      favourable <- append(favourable,ind$gene[counter])
      counter = counter + 1
    }
  }

  if ("ACE2"%in% unfavourable){
    print("ACE Gene is unfavourable in your genetic profile. Effect on Sports
    Performance: Reduced endurance capacity / increased muscle performance.
    Training Recommendations: Training to increase anaerobic (a-lactic)
    performance. Increase progressively but fast the number of training
    sessions on weekly schedule. If required, emphasis on training to increase
    endurance. Perform training for strength in high frequency with sub-maximum
          loads.")
  }
  if ("ACTN3"%in%favourable){
  print("ACTN3 Gene is favourable in your genetic profile. Effect on Sports
  Performance: Increased slow muscle fiber metabolism
  reduced muscle power. Training Recommendations: Long term physical
  preparation to achieve technical perfection. Perform many routes of the
  competition distance / repetitive routes of similar overall distance.
  Advantage in rapid muscle contraction confers increased risk of muscle
  injury when performing exercises with maximum intensity. Perform exercises
  in sub maximum intensity or increase progressively the intensity of the
  exercise.")
  }

  print("Your calculated Total Genetic Score out of 100 is:")
  print(TGS)
  print("These genes in your profile are favourable for athletic performance")
    print(favourable)
    print("These genes in your profile are unfavourable for athletic performance")
    print(unfavourable)
    print("These genes in your profile are neutral for athletic performance")
    print(neutral)
  print("Refer to the gene glossary in geneInfo.R for more insights on your
        genetic profile.")
}

#'Helper function: generateDataSet(n)
#'
#'Purpose: To generate a large dataset in the form of a data fram of n
#'polygenic total genotype scores to be used for analysis and (potential)
#'plotting purposes.
#'
#'@param n for the number of polygenic profiles to be generated and their
#'respective calculated total genotype scores to be included in the dataset.
#'
#'@return Returns a dataframe of n individuals and their respective TGS.
#'
generateDataSet <- function(n) {
  df = data.frame()
  for (x in 1:n){
    output = calculateTGS()
    df = rbind(df, output)
  }
  colnames(df)<-c("TGS")
  return(df)
}

#'Plot function: generateFreqPlot(n)
#'
#'Purpose: To generate a frequency plot of n polygenic total genotype scores to
#'be used for analysis and plotting purposes.
#'
#'@param n for the number of polygenic profiles to be generated and their
#'respective calculated total genotype scores to be included in the dataset.
#'
#'@return Returns a frequency plot of n individuals and their respective TGS.
#'@import Hmisc
#'
generateFreqPlot <- function(n=100){
  # install.packages("Hmisc")
  library("Hmisc")
  plot <- hist.data.frame(generateDataSet(n))
}

