drugUpdate <- NULL
url <- paste("http://www.drugsupdate.com/brand/listing/618")

link <- read_html(url)
Brand <- link %>%  html_nodes("span.enhanced_text") %>% html_text()
Company <- link %>%  html_nodes(".company .brand_generic") %>% html_text() 
Company <- gsub("^-", "", Company)
Generic <-link %>% html_nodes(".company+ a .brand_generic") %>% html_text()
Generic <- gsub('^.', '', Generic) 
Generic <- gsub('.{1}$', '', Generic)
Combination <- tryCatch(link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(1)") %>% html_text(),
               error=function(err) {NA})

Volume <- tryCatch(link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(2)") %>% html_text(),
           error=function(err) {NA})

Presentation <- tryCatch(link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(3)") %>% html_text(),
                error=function(err) {NA})
Price <- tryCatch(link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(4)") %>% html_text(),
         error=function(err) {NA})

Price <- gsub('.{6}$', '', Price)  

#drugU <- data.frame(Brand,Company, Generic, stringsAsFactors=FALSE) 

drug1 <- data.frame(Brand,Company, Generic,Combination,Volume,Presentation,Price, stringsAsFactors=FALSE) 

# Bind ambulances rows to empty ambulances dataframe
drugUpdate <- rbind(drugUpdate, drug1)
# Finally write results to csv file
write.csv(drugUpdate, file = "C:/Users/avon/Documents/R/drugupdate/drugUpdate617.csv",row.names=FALSE)

