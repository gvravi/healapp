#Repeating things: looping and the apply family
#temperatures over the last few days for the cities

cities <- c("Melbourne", "Sydney", "Brisbane", "Cairns")

#Getting urls
urls <- sprintf("http://nicercode.github.io/guides/repeating-things/data/%s.csv",cities)
urls

#write a function to download a file if it does not exist
download.maybe <- function(url, refetch=FALSE, path=".") {
  dest <- file.path(path, basename(url))
  if (refetch || !file.exists(dest))
    download.file(url, dest)
  dest
}

path <- "data"
dir.create(path, showWarnings=FALSE)
files <- sapply(urls, download.maybe, path=path)
names(files) <- cities


#time of each file is a string representing date and time, 
#which needs processing into R's native time format.

load.file <- function(filename) {
  d <- read.csv(filename, stringsAsFactors=FALSE)
  d$time <- as.POSIXlt(d$time)
  d
}

data <- lapply(files, load.file)
names(data) <- cities
