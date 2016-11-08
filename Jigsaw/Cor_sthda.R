#Import your data into R

data("mtcars")
my_data <- mtcars[, c(1,3,4,5,6,7)]
# print the first 6 rows
head(my_data, 6)

#Compute correlation matrix
res <- cor(my_data)
round(res, 2)

#if your data contain missing values
cor(my_data, use = "complete.obs")

#Correlation matrix with significance levels (p-value)
#Syntax
#rcorr(x, type = c("pearson","spearman"))

#Use rcorr() function
install.packages("Hmisc")
library("Hmisc")

res2 <- rcorr(as.matrix(my_data))
res2

# The output of the function rcorr() 
# is a list containing the following elements : - r : the correlation matrix 
# - n : the matrix of the number of observations used in analyzing each pair of variables
# - P : the p-values corresponding to the significance levels of correlations.

# If you want to extract the p-values or the correlation coefficients from the output, 
# use this:

# Extract the correlation coefficients
res2$r
res2[[1]]
# Extract p-values
res2$P
res2[[3]]

#A simple function to format the correlation matrix
# This section provides a simple function for formatting a correlation matrix into 
# a table with 4 columns containing :
# Column 1 : row names (variable 1 for the correlation test)
# Column 2 : column names (variable 2 for the correlation test)
# Column 3 : the correlation coefficients
# Column 4 : the p-values of the correlations

# Gives upper triangle of cor values of list res
ut <- upper.tri(res2$r)
ut

# Gives upper triangle of P values of list res
ut1 <-  upper.tri(res2$P)
ut1

#Row names of upper triangle by row 
row = rownames(res2$r)[row(res2$r)[ut]]
row
#Column names of upper triangle by column 
column = rownames(res2$r)[col(res2$r)[ut]]
cor  =(res2$r)[ut]
p = res2$P[ut]

#A custom function based on above code :
  
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
res2<-rcorr(as.matrix(mtcars[,1:7]))
flattenCorrMatrix(res2$r, res2$P)
  
#Visualize correlation matrix
#Use corrplot() to create a correlogram:

install.packages("corrplot")
library(corrplot)

corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

#Positive correlations are displayed in blue and negative correlations in red color.
#Color intensity and the size of the circle are proportional to the correlation coefficients. 
#In the right side of the correlogram, the legend color shows the correlation coefficients
#and the corresponding colors.

# Insignificant correlations are leaved blank
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01, insig = "blank")

#Use chart.Correlation(): Draw scatter plots
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)

#Use heatmap()
#Get some colors
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)