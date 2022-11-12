calculateTGS <- function(){
  ACE2 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.29,0.50, 0.21))
  ACTN3 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.52, 0.18))
  ADRA2A <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.04,0.34, 0.62))
  ADRB2 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.15,0.50, 0.35))
  AMPD1 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.19, 0.80))
  APOE  <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.12,0.64, 0.24))
  ATP1A2 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.01,0.18, 0.81))
  ATP1A2x <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.63,0.32, 0.05))
  BDKRB2 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.30,0.55, 0.15))
  CKM <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.07,0.44, 0.49))
  EPAS1 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.18,0.49, 0.33))
  EPAS1x <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.33,0.48, 0.19))
  HFE <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.71,0.25, 0.04))
  HIF1A <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.02,0.21, 0.77))
  HLAA <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.84,0.14, 0.02))
  MTND5 <- sample(c(0,2), 1, replace=TRUE, prob = c(0.07,0.93))
  MTND5x <- sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07))
  MTND5y <- sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07))
  MTTT <- sample(c(0,2), 1, replace=TRUE, prob = c(0.93,0.07))
  PPARA <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.03,0.27, 0.70))
  PPARGC1A <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.09,0.51, 0.40))
  UCP2 <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.35,0.48, 0.17))
  VEGFA <- sample(c(0,1,2), 1, replace=TRUE, prob = c(0.25,0.45, 0.30))

  TGSresult <- (100/46)*(ACE2+ACTN3+ADRA2A+ADRB2+AMPD1+APOE+ATP1A2+ATP1A2x+BDKRB2+CKM+EPAS1
                         +EPAS1x+HFE+HIF1A+HLAA+MTND5+MTND5x+MTND5y+MTTT+PPARA+PPARGC1A+
                           UCP2+VEGFA)

}

generateDataSet <- function(count=100) {
  df = data.frame()
  for (x in 1:count){
    output = calculateTGS()
    df = rbind(df, output)
  }
  colnames(df)<-c("TGS")
  return(df)

  # install.packages("ggplot2")
  library("ggplot2")

  # install.packages("tidyr")
  library("tidyr")

}

generateFreqPlot <- function(count=100){
  # install.packages("Hmisc")
  library("Hmisc")
  plot <- hist.data.frame(generateDataSet(count))
}

