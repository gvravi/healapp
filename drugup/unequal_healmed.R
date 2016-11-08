#The script creates a data frame from two unequal columns in two csv files into a 
#single dataframe. It adds NA to column with less no of rows(healGen:1164 rows) 
#then other Column with more rows(medInd:1836)


setwd("C:/Users/avon/Documents/R/generics")

healGen <- read.csv("healGenerics.csv", header = T, stringsAsFactors = FALSE)
healGenF <- healGen[-c(1,3:6)]


medInd <- read.csv("medindiaGenerics.csv", header = T, stringsAsFactors = FALSE)
medIndF <- medInd[-c(1,3:5)]
names(medIndF) <- c("Dsalt1")

len1 <- nrow(medIndF)
len2 <- nrow(healGenF)

for(i in 1:len1){
  #print(i)
  if (len2 >= i){
    medIndF$Dsalt2[i] <- healGenF$Dsalt[i]
    #print(tab2$Dsalt1)
    
  }
  else{
    medIndF$Dsalt2[i] <- "a1a2a3"
    
    
  }
}

write.csv(medIndF, file = "uneqHealMed.csv",row.names=FALSE)
