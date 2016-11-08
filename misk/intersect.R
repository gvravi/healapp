#Using intersect to find common drugs between two vectors/columns

setwd("C:/Users/avon/Documents/R/generics")
healGen <- read.csv("healGenerics.csv", header = T, stringsAsFactors = FALSE)
healGenF <- healGen[-c(1,3:6)]
names(healGenF) <- ("Dsalt1")

medInd <- read.csv("medindiaGenerics.csv", header = T, stringsAsFactors = FALSE)
medIndX <- medInd[-c(1,3:5)]
names(medIndX) <- ("Dsalt2")


com <- intersect(medIndX$Dsalt2, healGenF$Dsalt1)
com <- as.data.frame(com)

write.csv(com, file = "healmedin_intersect.csv",row.names=FALSE)














# Using merge to add two enqual columns into a dataframe.
# healInd1 <- merge(medIndF,healGenF,all=TRUE,sort=FALSE)
# healInd2 <- data.frame(unique(healInd1$Dsalt, stringsAsFactors = FALSE))
# 
# 
# heal <- merge(medInd,healGen,by="Dsid",all.x=TRUE,sort=FALSE)


# Using plyr package to add two enqual columns into a dataframe.
# library(plyr)
# healIn <- rbind.fill(medInd["Generic"],healGen["Dsalt"], stringsAsFactors = FALSE)
# heal <- healIn[!is.na(healIn$Generic), ]
# 
# column1 <- nrow(healIn)
# column2 <- nrow(healIn)
# 
# for (i in 1:column1){
#   
#   
#   for (j in 1:column2){
#     
#     if (healIn$Generic[i] == healIn$Dsalt[j])
#       
#     {
#       healIn$GenericNew[i] <- healIn$Generic[i]
#       
#       break;
#       
#     }
#     
#     else{
#       healIn$GenericNew[i] <- NA
#     }
#     
#     
#     
#   }
#   
#   
# }
