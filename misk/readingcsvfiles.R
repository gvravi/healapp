head(read.csv(files[1]))
files_full <- list.files("diet_data",full.names = TRUE)
dat <- data.frame()
for(i in 1:5){
  dat <- rbind(dat,read.csv(files_full[i]))
}
median(dat$Weight)
median(dat$Weight, na.rm = TRUE)
