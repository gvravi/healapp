#https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r#gs.p9dLMmw

getwd()
setwd("C:/Users/avon/Documents/R/ndc")
list.files()
data <- read.csv("dummy2.csv")
data$Dsalt3<-cbind(data,ifelse(data$Dsalt1==data$Dsalt2,1,ifelse(data$Dsalt1==data$Dsalt2,0,NA)))

map <- function(){
  
  ifelse(data$Dsalt1==data$Dsalt2,1,ifelse(data$Dsalt1==data$Dsalt2,0,NA))

}

lapply(data[,c('Dsalt1','Dsalt2')], map)


newdat<-as.data.frame(cbind(dat,ifelse(dat$Genotype==dat$S288C,1,ifelse(dat$Genotype==dat$SK1,0,NA))))

common.names <- intersect(Dsalt1(data), Dsalt2(data))
