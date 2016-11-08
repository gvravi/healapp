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
sapply(Bprices, function(x) sum(is.na(x)))

#Treating for missing values
### Finding out NA in a column
Bprices$MEDV[is.na(Bprices$MEDV)]

### Finding out NA for all varaibles in data frame?
Bprices[is.na(Bprices)]

### Replacing Missing Values(NAs) of single column with column mean
Bprices$MEDV[is.na(Bprices$MEDV)]<-mean(Bprices$MEDV,na.rm=TRUE)

### Replacing Missing Values of all columns with each column mean using for loop

###Column1[is.na(Column1)] <- mean(Column1, na.rm = TRUE))

for(i in 1:ncol(Bprices)){
  Bprices[is.na(Bprices[,i]), i] <- mean(Bprices[,i], na.rm = TRUE)
}

### Replacing Missing Values of all columns with each column mean using lapply
### and affecting change in data frame 

Bprices[] <- lapply(Bprices, function(x) { 
  x[is.na(x)] <- mean(x, na.rm = TRUE)
  x
})

###--------------------------------------------------------------------------------------------
### Replacing Missing Values for all columns with each column mean using lapply
### and affecting change in data frame 
###the logic here is to return the whole vector x, rather than just 
### the replacement values, and then overwrite the whole data frame d1 
### (per the open brackets []),rather than overwriting only the NAs
### 
### d1[] <- lapply(d1, function(x) { 
###  x[is.na(x)] <- mean(x, na.rm = TRUE)
###   x
### })
### d1
###--------------------------------------------------------------------------------------------

### Replacing Missing Values of all columns with each column mean using sapply
### But this code is not able to replace NA in data frame.
Bprices <- sapply(Bprices, function(x){
 x[is.na(x)] <- mean(x, na.rm = TRUE)
}) 



#----------------------------------Finding outliers for each variable-----------------------

###Plot the boxplots of all variables and shortlist which ones need outlier treatment.

# ###Using 'for loop' for multi boxplotting of all variables

#This allows you to plot 14 charts on a single page; It is optional.
par(mfrow=c(2,4)) 

#Store the names of the dataset in a list format
list<-names(Bprices) 
list<-list[-4]

for(i in 1:length(list)) 
{
  boxplot(Bprices[,list[i]],main=list[i])
}

#Restore the par parameters to normal
dev.off()


###Using lapply for multi boxplotting of all variables

par(mfrow=c(2,4))
lapply(names(Bprices[,-4]), function(x) {
boxplot(Bprices[x], main = x) 
})
#Restore the par parameters to normal
dev.off()

###Using apply for multi boxplotting of all variables
par(mfrow=c(2,4))
apply(Bprices,2, function(x) {
  boxplot(x, main = x) 
 })

#--------------------------------Outlier treatment -------------------------------------

##For loop to replace all the outlier values with the mean value ; 
##if you want you can replace with median value as well.
list<-names(Bprices) 
list<-list[-4]

for(i in 1:length(list)) {
  x<-boxplot(Bprices[ ,list[i]])
  out<-x$out
  index<-which(Bprices[,list[i]] %in% x$out)
  Bprices[index,list[i]]<-mean(Bprices[,list[i]])
  rm(x)
  rm(out)
}


## Tried with sapply to replace all the outlier values with the mean value;
## This code is not working

#  Bprices[] <- lapply(names(Bprices), function(x) {
#   box <- boxplot(Bprices[,x])
#   #out<-box$out
#   index <- which(Bprices[,x] %in% box$out)
#   Bprices[index,x] <- mean(Bprices[,x])
# #   rm(x)
# #   rm(out)
#   
# } )

## Tried with apply to replace all the outlier values with the mean value;
## This code is  working

Bprices[] <- apply(Bprices,2, function(x) {
  box <- boxplot(x)
  index <- which(x %in% box$out)
  x[index] <- mean(x[-index],na.rm=T)
  return(x)
})

#----------------------------------------Exploratory analysis----------------------------------------------
library(ggplot2) 

#Study the histogram of the given DV MEDV(Median value of owner-occupied homes in $1000's)

hist(Bprices$MEDV)


#You can look at the correlation between each IDV and the DV
#An eg :
ggplot(Bprices,aes(x=MEDV,y=LSTAT)) +geom_point()
ggplot(Bprices,aes(x=MEDV,y=DIS)) +geom_point()
ggplot(Bprices,aes(x=MEDV,y=AGE)) +geom_point()

# looping ggplot between each IDV and the DV

library(ggplot2)
lapply(names(Bprices), function(i)
  ggplot(data = Bprices, aes_string(x = i, y = "MEDV")) + geom_point())

# Simple commands to get correlation
cor(Bprices)
pairs(Bprices)
cor(Bprices$MEDV,Bprices)

#Function to get the list of correlations between : DV and the IDV's
list1<-list[-13]
for(i in 1:length(list1))
{
  x<-cor(Bprices$MEDV,Bprices[list[i]])
  print(x)
}

#Using apply to get the list of correlations between : DV and the IDV's
apply(Bprices,2, function(col) cor(col, Bprices$MEDV))

#Using arrange & melt to get the list of correlations between : DV and the IDV's
library(dplyr)
library(reshape2)
d_cor <- as.matrix(cor(Bprices))
d_cor
d_cor_melt <- arrange(melt(d_cor), -abs(value))
dplyr::filter(d_cor_melt, value > .5) 


#A custom function for cor to get cor and p values :

# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

#Example of usage  of function:

library(Hmisc)
res2<-rcorr(as.matrix(Bprices[,-c(4,13)]))
flattenCorrMatrix(res2$r, res2$P)













write.csv(Bprices, file = "Bprices2.csv", row.names = FALSE)
