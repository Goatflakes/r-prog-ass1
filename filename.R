filename <- function (directory, id) {
  chkdir(directory)
  # build a file name from the given monitor id
  filename <- file.path(directory[1], sprintf("%03d.csv", id))
  # check if the file exists, stop otherwise
  #if(!file.exists(filename)) {
  #  stop("filename.R:  ", filename, " does not exist!")
  #}
  filename
}