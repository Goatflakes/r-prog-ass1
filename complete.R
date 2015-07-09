complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  if(!file.exists(directory[1])) {
    stop("complete.R:  ", directory, " does not exist!")
  }
  if(!file.info(directory[1])$isdir) {
    stop("complete.R:  ", directory, " is not a directory!")
  }

  nobs <- numeric(0)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for(monitor in id) {
    # build a file name from the given monitor id
    filename <- file.path(directory[1], sprintf("%03d.csv", monitor))
    # check if the file exists, stop otherwise
    if(!file.exists(filename)) {
      stop("pollutantmean.R:  ", filename, " does not exist!")
    }

    nobs <- c(nobs, sum(complete.cases(read.csv(filename))))
  }  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  data.frame(id, nobs)
}