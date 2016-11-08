#load data from package
data(Boston, package = 'MASS')
myData <- Boston
names(myData)
summary(myData)
cor(myData)

#Principal Component Analysis
pcaData <- princomp(myData, scores = TRUE, cor = TRUE)

#check that var comp1 > comp2 and so on. And we find that Comp 1, Comp 2  
#and Comp3 have values higher than 1
summary(pcaData) 


#loadings - This represents the contribution of variables in each factor. Higher the
#number higher is the contribution of a particular variable in a factor
loadings(pcaData)

#screeplot of eigen values ( Value of standard deviation is considered as eigen values)
screeplot(pcaData, type = 'line', main = 'Screeplot')

#Biplot of score variables
biplot(pcaData)

#Scores of the components
pcaData$scores[1:10,]
