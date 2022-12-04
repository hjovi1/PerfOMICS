plots <-function(file){
  # read excel file with user provided genetic profile
  data <- read_excel(file)
  p <- plot(data$"Score", data$"Fitness", pch = 19, col = "lightblue")

  # Regression line
  abline(lm(y ~ x), col = "red", lwd = 3)

  # Pearson correlation
  text(paste("Correlation:", round(cor(x, y), 2)), x = 25, y = 95)
  return(p)

  #library("ggpubr")
  #plot <- ggscatter(df, x = "Score", y = "Fitness",
  #add = "reg.line", conf.int = TRUE,
  #cor.coef = TRUE, cor.method = "kendall",
  #xlab = "Athletic Endurance Score", ylab = "Cardiovascular Fitness (VO2 Max)")
  #return(plot)


  freplot <- hist(data, main = "Frequency of Scores", # Title
                  sub = "Based on 23-polymorphisms", # Subtitle
                  xlab = "Genetic Score",           # X-axis label
                  ylab = "Frequency",
                  color = 'blue')           # Y-axis label

  return(freplot)
}

#[END] Written by Helena Jovic
