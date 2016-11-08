library(RJSONIO)
#foodMarketsRaw<-fromJSON("https://data.ny.gov/api/views/9a8c-vfzj/rows.json?accessType=DOWNLOAD")
foodMarketsRaw<-fromJSON("retail_food_markets.json")
foodMarkets<-foodMarketsRaw[['data']]
foodMarkets[[1]]
length(foodMarkets[[1]])
foodMarkets[[1]][[14]]
fmNames<-sapply(foodMarkets, function(x) x[[14]])
head(fmNames)

library(gdata) # for the trim function
grabInfo<-function(var){
 # print(paste("Variable", var, sep=" "))  
  sapply(foodMarkets, function(x) returnData( var)) 
}

grabInfo(2)
