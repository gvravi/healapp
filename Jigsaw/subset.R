hsb2.small <- read.csv("http://www.ats.ucla.edu/stat/data/hsb2_small.csv")

write.csv(hsb2.small, "hsb2_small.csv", row.names = FALSE)

# using the names function to see names of the variables and which column of
# data to which they correspond
hsb2.small <- read.csv("hsb2_small.csv", header = TRUE)
names(hsb2.small)

#################################
#1. Subsetting variables/columns#
#################################

# Selecting id, read, write columns.
#All rows of 1,7,8 columns
hsb3 <- hsb2.small[, c(1, 7, 8)]
hsb3

#If the variables we want are in consecutive columns, 
#we can use the colon notation rather than list them using the c function. 
#In the next example we create the data frame hsb4 containing the first 
#four variables of hsb2.small.

#All rows of 1,2,3,4 columns.
hsb4 <- hsb2.small[, 1:4]


#################################
#2. Subsetting observations/rows#
#################################

#We subset observations by also using the bracket notation but now we use 
#the first index and leave the second index blank. This indicates that we want 
#all the variables for specific observations. In the first example we create 
#the data frame hsb5, which contains the first 10 observations of hsb2.small.

hsb5 <- hsb2.small[1:10, ]
hsb5

#We can also subset observations based on logical tests. In the following example 
#we create the data frame hsb6, which contains only the observations for which ses=1.
#For a logical equality we need to use the double equal sign notation. 
#We also need to refer to the variable, ses in the data frame hsb2.small, 
#which we do using $.

hsb6 <- hsb2.small[hsb2.small$ses == 1, ]
hsb6

#In the previous example we used a logical test to subset the observations, 
#but we only tested for one variable being equal to a single value. We can 
#also subset using a logical test that will test a single variable being equal 
#to the elements in a list, and we do this by using the %in% function. 
#In the following example we create the data frame hsb7, which contains 
#the observations where id is equal to 11, 12, 20, 48, 86 or 195.

hsb7 <- hsb2.small[hsb2.small$id %in% c(12, 48, 86, 11, 20, 195), ]
hsb7

# It is also possible to combine logical tests. In the following example we create 
# the data frame hsb8, which contains only the observations where ses=3 and female=0. 
# Here to avoid having to type hsb2.small multiple times, we use the with function
# to let R know that it should look for ses and female inside the hsb2.small data frame.

hsb8 <- hsb2.small[with(hsb2.small, ses == 3 & female == 0), ]
hsb8

#Without with 
hsb81 <- hsb2.small[hsb2.small$ses == 3 & hsb2.small$female == 0, ]
hsb81


# The subset function with a logical statement will let you subset the data frame
# by observations. In the following example the write.50 data frame contains only
# the observations for which the values of the variable write is greater than 50. 
# Note that one convenient feature of the subset function, is R assumes variable 
# names are within the data frame being subset, so there is no need to tell R 
# where to look for write.

write.50 <- subset(hsb2.small, write > 50)

#write.50There is no limit to how many logical statements may be combined to achieve 
#the subsetting that is desired. The data frame write.1 contains only the observations 
#for which the values of the variable write is greater than 50 and for which the variable 
#read is greater than 60.

write.1 <- subset(hsb2.small, write > 50 & read > 60)
write.1

#In the data frame write.3 contains only the observations in variables read through 
#science for which the values in the variable science are less than 55.

write.3 <- subset(hsb2.small, science < 55, select = read:science)

###########################################################
#3.Subsetting both variables(cols) and observations(rows) #
###########################################################

# We can subset variables and observations by simply combining the two above methods 
# of subsetting. We accomplish this by subsetting using both indices at the same time. 
# In the following example we create the data frame hsb9 in which we keep only the 
# variables id, female, race, ses and read and only the observations where ses=3. 
# Note again that because we are not using subset, we have to let R know where to 
# find the variable ses by explicitly pointing to hsb2.small.

# using the names function to see names of the variables and which column of
# data to which they correspond
names(hsb2.small)
hsb9 <- hsb2.small[hsb2.small$ses == 3, c(1:4, 7)]
hsb9
