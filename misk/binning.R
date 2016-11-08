library(ggplot2)
library(data.table)
setwd("C:/Users/avon/Documents/R/vidhya")
#Binning continuous variable
#load data.Let's take up the inbuilt data set state.x77 in R 
data <- data.frame(state.x77)
head(data)
colnames(data)
# qplot synatax
# qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, 
#       facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)

#plot Frost variable and check the data points are all over
qplot(y = Frost, data = data, color = 'blue')

#use cut() to create bins of equal sizes
bins <- cut(data$Frost, 3, include.lowest = TRUE)
bins

#add labels to bins
bins <- cut(data$Frost, 3, include.lowest = TRUE, labels = c('Low','Medium','High'))
bins

#load data from package
data(Boston, package = 'MASS')
myData <- Boston
names(myData)
summary(myData)
cor(myData)

#Principal Component Analysis
pcaData <- princomp(myData, scores = TRUE, cor = TRUE)
summary(pcaData) 
#check that var comp1 > comp2 and so on. And we find that Comp 1, Comp 2  
#and Comp3 have values higher than 1
