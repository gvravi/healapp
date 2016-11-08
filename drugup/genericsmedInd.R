genericsF <- NULL

page <- letters[1:3]
for( i in page ){
  url <- paste("http://www.medindia.net/drug-price/index.asp?alpha=",i,sep="")
  
  doc1 <- read_html(url)
  
  generics <-  doc1%>% html_nodes(".content-table")  %>% .[[1]] %>% html_table(fill = TRUE)
  generics <- tail(generics, -1)
  
  genericsF <- rbind(genericsF, generics)
  print(url)
 
}

write.csv(genericsF, file = "medindiaGeneric.csv",row.names=FALSE)