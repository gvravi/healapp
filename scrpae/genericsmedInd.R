library(xml2)
library(rvest)
library(stringr)
setwd("C:/Users/avon/Documents/R/scrape")
 
genericsF <- NULL
page <- letters[1:26]
for( i in page ){
  url <- paste("http://www.medindia.net/drug-price/index.asp?alpha=",i,sep="")
  
  doc1 <- read_html(url)
  
  generics <-  doc1%>% html_nodes(".content-table")  %>% .[[1]] %>% html_table(fill = TRUE)
  generics <- tail(generics, -1)
  names(generics)<- c("SNo.","generic","Combination","Price1","Price2")
  genericsF <- rbind(genericsF, generics)
  
  #Renumbering a column
  genericsF$SNo. <- 1:nrow(genericsF)
 
  print(url)
 
}

write.csv(genericsF, file = "medindiaGeneric.csv",row.names=FALSE)