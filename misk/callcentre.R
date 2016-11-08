setwd("C:/Users/avon/Documents/R/avidya")
data <- read.csv("Case_Level2.csv")
summary(data)
str(data)

#Creating a matrix syntax
# A = matrix( 
#      c(2, 4, 3, 1, 5, 7), # the data elements 
#      nrow=2,              # number of rows 
#      ncol=3,              # number of columns 
#      byrow = TRUE)        # fill matrix by rows 

#Create a matrix where we will store the maximum waiting time for each value 
#of the number of callers
caller_opt <- matrix(0,100,2)

number_of_callers <- 1:100
number_of_callers
caller <- rep(0,number_of_callers)
