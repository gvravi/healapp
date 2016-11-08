library(RJSONIO)
setwd("~/R/xmlR")

kiva = fromJSON("loans.json")

names(kiva)
kiva$loans[[1]]
