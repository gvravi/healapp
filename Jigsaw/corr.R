#-----------------------------Compute correlation matrix in R-----------------------------------

#cor() can be used to compute a correlation matrix

#Syntax
#cor(x, method = c("pearson", "kendall", "spearman"))
#cor(my_data, use = "complete.obs")


#Compute correlation matrix
cor(Bprices$MEDV,Bprices)
res <- cor(Bprices)
pairs(res)
round(res, 2)

#Correlation plot DV with each IDV
apply(Bprices,2, function(col) cor(col, Bprices$MEDV))


#Correlation matrix with significance levels (p-value)
install.packages("Hmisc")
library("Hmisc")
res2 <- rcorr(as.matrix(Bprices))
res2

# Extract the correlation coefficients
res2$r
ut <- upper.tri(res2$r)
x <- rownames(res2$r)


row = rownames(res2$r)[row(res2$r)[ut]]
row
# Extract p-values
res2$P


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
    cor = (cormat)[ut],p = pmat[ut])
}

flattenCorrMatrix(res2$r, res2$P)

#Correlation matrix with significance levels (p-value) using dplyr & reshape
library(dplyr)
library(reshape2)
d_cor <- as.matrix(cor(Bprices))
d_cor
d_cor_melt <- arrange(melt(d_cor), -abs(value))
dplyr::filter(d_cor_melt, value > .5) 


#Visualize correlation matrix

install.packages("corrplot")
library(corrplot)
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

# Insignificant correlation are crossed
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01, insig = "blank")

# Insignificant correlations are leaved blank
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01, insig = "blank")

#Use chart.Correlation(): Draw scatter plots
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)


#Use heatmap()
# Get some colors
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)