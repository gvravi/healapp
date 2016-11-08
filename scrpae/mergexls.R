mergexls <- function(directory)  {
  
  #creates a list of files
  files_list <- list.files("drugupdate", full.names=TRUE)   
  med_drug <- data.frame()                             #creates an empty data frame
  for (file in files_list) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[file]))
  }
  
}