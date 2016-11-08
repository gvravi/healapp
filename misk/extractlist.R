library(RJSONIO)
#foodMarketsRaw<-fromJSON("https://data.ny.gov/api/views/9a8c-vfzj/rows.json?accessType=DOWNLOAD")
foodMarketsRaw<-fromJSON("retail_food_markets.json")
for(i in 1:length(foodMarketsRaw)){
  ##first extract the object value
  tempobj=foodMarketsRaw[[i]]
  ##now create a new variable with the original name of the list item
  eval(parse(text=paste(names(foodMarketsRaw)[[i]],"= tempobj")))
}