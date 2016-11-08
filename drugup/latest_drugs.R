library(xml2)
library(rvest)

#Declare null vector to get final data table

drug_update <- NULL

# loop through all page numbers

for( page in 1:50) {
  url <- paste("http://www.drugsupdate.com/brand/latest_drugs/",page,sep="")
  link<- read_html(url)
  
  # Find the html/css class under which all elements to be extracted occcur
  
  html_file <- html_nodes(link,"div.brand_row")
  
  #complete with NAs when tag is not present by looping through tags using lappy and do call
  
  drug_get <-  do.call(rbind, lapply(html_file, function(x) {
    Brand <- tryCatch(xml_text(xml_node(x, "span.enhanced_text")),
                      error=function(err) {NA})
    
    Company <- tryCatch(xml_text(xml_node(x, ".company .brand_generic")),
                        error=function(err) {NA})
    
    Company <- gsub("^-", "", Company)
    
    Generic <- tryCatch(xml_text(xml_node(x, ".company+ a .brand_generic")),
                        error=function(err) {NA})
    
    Generic <- gsub('^.', '', Generic)  #Removes 1 character at the start of string
    Generic <- gsub('.{1}$', '', Generic) #Removes 1 character at the end of string
    
    Combination <- tryCatch(xml_text(xml_node(x, ".strengthlisting:nth-child(5) td:nth-child(1)")),
                            error=function(err) {NA})
    
    Volume  <- tryCatch(xml_text(xml_node(x, ".strengthlisting:nth-child(5) td:nth-child(2)")),
                        error=function(err) {NA})
    
    Presentation <- tryCatch(xml_text(xml_node(x, ".strengthlisting:nth-child(5) td:nth-child(3)")),
                             error=function(err) {NA})
    
    Price <- tryCatch(xml_text(xml_node(x, ".strengthlisting:nth-child(5) td:nth-child(4)")),
                      error=function(err) {NA})
    
    Price <- gsub('.{6}$', '', Price)  #Removes 6 characters at the end of string
    
    data.frame(Brand, Company, Generic, Combination, Volume, Presentation, Price,
               stringsAsFactors=FALSE)
    
    
    
  }))
  
  # Bind ambulances rows to empty drug_update dataframe
  drug_update <- rbind(drug_update, drug_get)
  print(page)
}

# Finally write results to csv file
write.csv(drug_update, file = "C:/Users/avon/Documents/R/drugupdate/latestdrugs1_50.csv",row.names=FALSE)


