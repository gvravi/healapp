### THis script also repeating same values
pacman::p_load("rvest", "dplyr")

get_drugs <- function(node){
  Comb <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(1)") %>% html_text()
  
  Vol <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(2)") %>% html_text()
  
  
  Pres <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(3)") %>% html_text()
  
  Pri <- link %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(4)") %>% html_text()
  
data.frame(
    Combination = ifelse(length(Comb)==0, NA, Comb),
    Volume = ifelse(length(Vol)==0, NA, Vol), 
    Presentation = ifelse(length(Pres)==0, NA, Pres), 
    Price = ifelse(length(Pri)==0, NA, Pri), 
    stringsAsFactors=F)
  
}

url <- "http://www.drugsupdate.com/brand/listing/618"
link <- read_html(url) %>% html_nodes(".brand_row table")
lapply(link, get_drugs) %>%  rbind_all