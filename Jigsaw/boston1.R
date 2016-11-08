# Setting up working directory
getwd()
setwd("~/R/Jigsaw")

#Reading data
Boston <- read.csv("Boston.csv", header = TRUE)
Boston

##Checking Data Characteristics
dim(Boston)
str(Boston)
head(Boston)
names(Boston)


# Remaking Boston.csv file to jigsaw boston_prices.csv

Boston[c(368,374:377,379:382,385:389,393,395,399,401,402,404:408,410:421,423,426:428,432,435:439,
         441,445,446,469,470,478:480),15] <- NA

which(is.na(Boston$medv))
Boston <- Boston[-1]


#Renaming to capitals as in jigsaw  boston_prices.csv
names(Boston) <- c("CRIM","ZN","INDUS","Charles.River.dummy.variable", "nitric.oxides.concentration","X.rooms.dwelling",
                   "AGE","DIS","RAD","TAX","PTRATIO","B","LSTAT","MEDV")

# Write csv file
write.csv(Boston, file = "boston_prices.csv",row.names=FALSE)

##Summary statistics

which(is.na(Boston$medv))

