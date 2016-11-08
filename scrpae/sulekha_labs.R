library(xml2)
library(rvest)
setwd("C:/Users/avon/Documents/R/labs")

labs <- NULL

# loop through all page numbers

for( page in 1:5) {
  
  url <- paste("http://yellowpages.sulekha.com/diagnostic-centers_hyderabad_",page,sep = "")
  link <- read_html(url)

  labname <- link %>%  html_nodes(".GAQ_C_BUSL span") %>% html_text()
  labadd <- link %>%  html_nodes("[itemprop = address]") %>% html_text() 
  labph <- link %>%  html_nodes(".contact-number") %>% html_text()

  lab_get <- data.frame(labname, labadd, labph, stringsAsFactors=FALSE)

  # Bind ambulances rows to empty drug_update dataframe
  labs <- rbind(labs, lab_get)
  print(page)
}


# Finally write results to csv file
write.csv(labs, file = "C:/Users/avon/Documents/R/labs/labs1.csv",row.names=FALSE)


