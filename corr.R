corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  comp <- complete(directory)
  id <- comp$id[comp$nobs > threshold]
  
  correlations <- numeric(0)

  for(monitor in id) {
    air <- read.csv(filename(directory, monitor))
    air <- air[complete.cases(air), ]
    end = length(correlations) + 1
    correlations[end] <- cor(air$nitrate, air$sulfate)
  }
  
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  correlations
}