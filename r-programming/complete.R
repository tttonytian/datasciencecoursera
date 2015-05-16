complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory, full.name =TRUE)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  data <- data.frame()
  comp_case <- data.frame()
  nobs <- data.frame()
  for (i in id){
    data <- read.csv(files[i])
    nobs <- sum(complete.cases(data))
    comp_case <- rbind(comp_case, data.frame(i,nobs))
  }
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  comp_case
  }
