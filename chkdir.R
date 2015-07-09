chkdir <- function (directory) {
  if(!file.exists(directory[1])) {
    stop("chkdir.R:  ", directory, " does not exist!")
  }
  if(!file.info(directory[1])$isdir) {
    stop("chkdir.R:  ", directory, " is not a directory!")
  }
}