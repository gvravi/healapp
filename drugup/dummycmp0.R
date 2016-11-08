getwd()
setwd("C:/Users/avon/Documents/R/ndc")
cmp1 <- read.csv(file = "saltcmp1.csv", header = TRUE, na.strings=c("","NA"), stringsAsFactors = FALSE)
cmp_d2 <- read.csv(file = "dummy2.csv", header = TRUE, na.strings=c("","NA"), stringsAsFactors = FALSE)
cmp_d1 <- read.csv(file = "dummy.csv", header = TRUE, na.strings=c("","NA"), stringsAsFactors = FALSE)
cmp2 <- cmp1[1:15,]
a <- cmp1$Dsalt1
a
 column1 <- nrow(cmp_d2)
 column2 <- nrow(cmp_d2)

for (i in 1:column1){
  
  
  for (j in 1:column2){
   
    if (cmp_d2$Dsalt1[i] == cmp_d2$Dsalt2[j])
      
      
    {
      cmp_d2$Dsalt3[i] <- cmp_d2$Dsalt1[j]
      
      break
    }
    
    else{
      cmp_d2$Dsalt3[i] <- NA
      
    }
      
    
  }
  
  
}
