pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  # the running total of the means of all monitors
  total = 0
  # the number monitors read
  count = 0
  
  if(file.exists(directory[1]) & file.info(directory[1])$isdir) {
    for(monitor in id) {
      # build a file name from the given monitor id
      filename <- file.path(directory[1], sprintf("%03d.csv", monitor))
      # check if the file exists, stop otherwise
      if(!file.exists(filename)) {
        stop("pollutantmean.R:  ", filename, " does not exist!")
      }
      # read.csv the file in
      air <- read.csv(filename)
      # subset that to get the pollutant column of interest
      pol <- air[[pollutant]]
      # create a boolean vector that shows where the NAs are
      nas <- is.na(pol)
      # invert that & index the subset getting the non-NAs
      pol <- pol[!nas]
      # find the mean, add it to the total
      total <- total + mean(pol)
      # inc the count
      count <- count + 1
    }
  } else {
    stop( "pollutantmean.R:  ", directory, " does not exist!" )
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  # divide the total by the count
  total / count  
  
}