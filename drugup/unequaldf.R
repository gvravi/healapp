#The script creates a data frame from two unequal columns in two csv files into a 
#single dataframe. It adds NA to column with less no of rows(tab1:10 rows) 
#then other Column with more rows(tab2:5)

setwd("C:/Users/avon/Documents/R/generics")
tab1 <- read.csv("gen1.csv",header = T,stringsAsFactors = FALSE)
tab2 <- read.csv("heal1.csv",header = T,stringsAsFactors = FALSE)
#tab3 <- data.frame(tab1$Dsalt,stringsAsFactors = FALSE)



len1 <- nrow(tab1)
len2 <- nrow(tab2)


for(i in 1:len1){
    #print(i)
    if (len2 >= i){
      tab1$Dsalt2[i] <- tab2$Dsalt1[i]
      print(tab2$Dsalt1)
    
    }
    else{
      tab1$Dsalt2[i] <- NA
    
    
  }
}
  

    
    
    
#   for (j in 1:len2){
#     
#     if (tab1$Dsalt[i] == healIn$Dsalt[j])
#       
#     {
#       healIn$GenericNew[i] <- healIn$Generic[i]
# }