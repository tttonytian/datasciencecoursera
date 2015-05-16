
source("complete.R")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory, full.name =TRUE)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  comp_case <- complete(directory)
  above_thre <- comp_case[comp_case$nobs > threshold, 1]
  correlations <- rep(NA,length(above_thre))
  
  for (i in above_thre) {
    data <- read.csv(files[i])
    comp_case <- complete.cases(data)
    S <- data[comp_case, 2]
    N <- data[comp_case, 3]
    correlations[i] <- cor(x = S, y = N)
}
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
correlations <- correlations[complete.cases(correlations)]
}
