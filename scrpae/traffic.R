library(rvest)

url <- "http://tripurapolice.gov.in/apscontact"
  
doc1 <- read_html(url)
  
traffic <-  doc1%>% html_nodes("table")  %>% .[[1]] %>% html_table(fill = TRUE)
  
write.csv(traffic, file = "traffic.csv",row.names=FALSE)
