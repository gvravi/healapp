setwd("C:/Users/avon/Documents/R/generics")

cmp_d2 <- read.csv(file = "healmedin.csv", header = TRUE,stringsAsFactors = FALSE)

column1 <- nrow(cmp_d2)
column2 <- nrow(cmp_d2)

for (i in 1:column1){
  
  
  for (j in 1:column2){
    
    if (cmp_d2$Dsalt2[j] == cmp_d2$Dsalt1[i])
      
      
    {
      cmp_d2$Dsalt3[i] <- cmp_d2$Dsalt1[i]
      
     break;
      
    }
    
    else{
      cmp_d2$Dsalt3[i] <- NA
     
    }
    
    
    
  }
}
  
 
write.csv(cmp_d2, file = "healmedincmp.csv",row.names=FALSE)
