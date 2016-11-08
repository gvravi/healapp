library("XML")
library("methods")
library(RCurl)
fileURL <- "https://rxnav.nlm.nih.gov/REST/drugs?name=paracetamol"
xData <- getURL(fileURL)
result <- xmlParse(xData)

print(result)
rootnode <- xmlRoot(result)
rootnode
rootsize <- xmlSize(rootnode)
print(rootsize)
print(rootnode[2])
print(rootnode[[1]][[3]][[3]][[1]])
xmldataframe <- xmlToDataFrame("result")


