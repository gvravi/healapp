library(xml2)
library(rvest)

#Declare null vector to get final data table

toxicity <- NULL

# loop through all page numbers

for( page in 1:2) {
  url <- paste("http://www.medguideindia.com/show_toxication_details.php?generic_id=",page,"")
  link<- read_html(url)
  
  # Find the html/css class under which all elements to be extracted occcur
  tox <- html_nodes(link, ".middlepanelborder")
  
  
  #complete with NAs when tag is not present by looping through tags using lappy and do call
  
      toxic <-  do.call(rbind, lapply(tox, function(x) {
#     Generic <- tryCatch(xml_text(xml_node(x, "strong.red-txt")),
#                          error=function(err) {NA})
    
    Indication <- tryCatch(xml_text(xml_node(x, "tr:nth-child(1) .mosttext")),
                      error=function(err) {NA})
    C_indication <- tryCatch(xml_text(xml_node(x, "tr:nth-child(3) .mosttext")),
                         error=function(err) {NA})
    Caution <- tryCatch(xml_text(xml_node(x, "tr:nth-child(5) .mosttext")),
                             error=function(err) {NA})
    Side_effect <- tryCatch(xml_text(xml_node(x, "tr:nth-child(7) .mosttext")),
                             error=function(err) {NA})
    
    data.frame(Indication, C_indication,Caution,Side_effect, stringsAsFactors=FALSE)
    
    
  }))
  
  # Bind ambulances rows to empty ambulances dataframe
  toxicity <- rbind(toxicity, toxic)
}

# # Finally write results to empty csv file
# write.csv(ambulances, file = "ambulances.csv",row.names=FALSE)
# 
# #     library(knitr)
# #    a <- kable(ambulances, format = "html")
