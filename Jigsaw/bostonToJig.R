#--------------------------------Linear Regression Assignment 2-------------------------------------
#Set working directory
setwd("~\\R\\Jigsaw")

###------------------------------Read boston housing prices data------------------------ ####

Bprices <- read.csv("boston_prices.csv", header = T)

##--------------------------------Checking Data Characteristics----------------------------
dim(Bprices)
str(Bprices)
head(Bprices)
names(Bprices)

#summary statistics
summary(Bprices)
summary(Bprices$MEDV)

#------------------------------------Finding for missing values-------------------------------

#checking missing values for all columns
colSums(is.na(Bprices))

### Replacing Missing Values of all columns 

Bprices[] <- lapply(Bprices, function(x) { 
  x[is.na(x)] <- mean(x, na.rm = TRUE)
  x
})


#----------------------------------Finding outliers for each variable-----------------------

###Using lapply for multi boxplotting of all variables

par(mfrow=c(2,4))
lapply(names(Bprices[,-4]), function(x) {
  boxplot(Bprices[x], main = x) 
})


#--------------------------------Outlier treatment -------------------------------------

## Tried with sapply to replace all the outlier values with the mean value;
## This code is not working and write the mean value of each column throught that column.
## This happens for all the columns.

Bprices[] <- lapply(names(Bprices), function(x) {
  box <- boxplot(Bprices[,x])
  index <- which(Bprices[,x] %in% box$out)
  Bprices[index,x] <- mean(Bprices[,x])
  
} )

