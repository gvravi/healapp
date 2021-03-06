library(xml2)
library(rvest)
setwd("C:/Users/avon/Documents/R/labs")

#Declare null vector to get final data table

labs <- NULL

# loop through all page numbers

for( page in 1:2) {
  url <- paste("https://www.practo.com/hyderabad/diagnostics?sort_by=relevance&/",page,sep="")
  link<- read_html(url)
  
  # Find the html/css class under which all elements to be extracted occcur
  
   html_file <- html_nodes(link,".diagnostic-listing-row")
   
   lab_get <-  do.call(rbind, lapply(html_file, function(x) {
     
     labname <- tryCatch(xml_text(xml_node(x, "h2.selectorgadget_selected")),
                       error=function(err) {NA})
     
     labadd<- tryCatch(xml_text(xml_node(x, "#resultsContainer :nth-child(1)")),
                         error=function(err) {NA})
     
  
     
     labph <- tryCatch(xml_text(xml_node(x, "span.prac-number.number")),
                         error=function(err) {NA})
     
   
     data.frame(labname, labadd, labph, stringsAsFactors=FALSE)
     
     
     
   }))
   
   # Bind ambulances rows to empty drug_update dataframe
  labs <- rbind(labs, lab_get)
   print(page)
}

# Finally write results to csv file
write.csv(labs, file = "C:/Users/avon/Documents/R//drugupdate687_1000.csv",row.names=FALSE)


