## THe code is not working it is repeating same values
Mydrugs <- NULL
url <- "http://www.drugsupdate.com/brand/listing/618"
#drugs <- read_html(url)
drugs <- read_html(url) %>% xml2::xml_find_all(xpath='//*[@id="middle_menus"]/div/div/div/div/div/div/table[1]')%>%html_text()
#drugs <- read_html(url) %>% html_nodes("div.brand_row")

get_drugs <-  do.call(rbind, lapply(drugs, function(x) {

Bran <- drugs %>%  html_nodes("span.enhanced_text") %>% html_text()
Comp <- drugs %>%  html_nodes(".company .brand_generic") %>% html_text() 
Comp <- gsub("^-", "", Comp)
Gen <-drugs %>% html_nodes(".company+ a .brand_generic") %>% html_text()
Gen <- gsub('^.', '', Gen) 
Gen <- gsub('.{1}$', '', Gen)

Comb <- drugs %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(1)") %>% html_text()

Vol <- drugs %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(2)") %>% html_text()


Pres <- drugs %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(3)") %>% html_text()

Pri <- drugs %>% html_nodes(".strengthlisting:nth-child(5) td:nth-child(4)") %>% html_text()
Pri <- gsub('.{6}$', '', Pri)
#drug1 <- data.frame(Brand,Company, Generic,Combination,Volume,Presentation,Price, stringsAsFactors=FALSE)

  data.frame(Brand = ifelse(length(Bran)==0, NA, Bran),
 
  Company = ifelse(length(Comp)==0, NA, Comp),
  Generic = ifelse(length(Gen)==0, NA, Gen),
  Combination = ifelse(length(Comb)==0, NA, Comb),
  Volume = ifelse(length(Vol)==0, NA, Vol), 
  Presentation = ifelse(length(Pres)==0, NA, Pres), 
  Price = ifelse(length(Pri)==0, NA, Pri), 
  stringsAsFactors=FALSE)
}))
# Bind ambulances rows to empty ambulances dataframe
Mydrugs <- rbind(Mydrugs, get_drugs)
