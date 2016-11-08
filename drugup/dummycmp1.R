getwd()
setwd("C:/Users/avon/Documents/R/ndc")
cmp_d1 <- read.csv(file = "dummy.csv", header = TRUE, na.strings=c("","NA"), stringsAsFactors = FALSE)

column1 <- nrow(cmp_d1)
column2 <- nrow(cmp_d1)

for (i in 1:column1){
  
  
  for (j in 1:column2){
    
    if (cmp_d1$Dsalt1[i] == cmp_d1$Dsalt2[j])
      
      
    {
      cmp_d1$Dsalt3[i] <- cmp_d1$Dsalt1[1]
      
      break
    }
    
    else{
      cmp_d1$Dsalt3[i] <- NA
      
    }
    
    
  }
  
  
}
