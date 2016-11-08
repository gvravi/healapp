###################################################################################################################################
#Sites used for this work.
#https://eight2late.wordpress.com/2015/05/27/a-gentle-introduction-to-text-mining-using-r/
#https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html

#################################################################################################
#Setting up working directory and installing required packages and loading libraries.
setwd("C:/Users/avon/Documents/R/textmining")
Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")   
install.packages(Needed, dependencies=TRUE)   
library(tm)

##################################################################################################
#Directory source or path:
cname <- file.path("C:/Users/avon/Documents/R", "textmining")   
cname   
dir(cname)   #contents of cname directory

#################################################################################################################################
#Create Corpus
#collection of documents (technically referred to as a Corpus) in the R environment
#the  Corpus() function can read from various sources including a directory. 

docs <- Corpus(DirSource("C:/Users/avon/Documents/R/textmining"))
summary(docs)
inspect(docs[2])

#inspect a particular document
writeLines(as.character(docs[[30]]))
#################################################################################################################################