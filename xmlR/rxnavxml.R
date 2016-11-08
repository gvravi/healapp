library("XML")
library("methods")
library(RCurl)
fileURL <- "https://rxnav.nlm.nih.gov/REST/drugs?name=paracetamol"
xData <- getURL(fileURL)
xmlfile <- xmlParse(xData)

xmltop = xmlRoot(xmlfile) #gives content of root

df <- NULL
for(i in 2:50)
{
  
  for(j in 1:2){
 dfx<- xmltop[[1]][[3]][[i]][[j]]
 class(dfx)
  
  print(dfx)
  print(i,j)


  }
  
  
  
}

class(dfx)
