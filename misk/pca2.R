#This tutorial is from 
#https://tgmstat.wordpress.com/2013/11/28/computing-and-visualizing-pca-in-r/

install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")

# Load data
data(iris)
head(iris, 3)

# log transform 
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]

# apply PCA - scale. = TRUE is highly advisable, but default is FALSE. 
ir.pca <- prcomp(log.ir,center = TRUE, scale. = TRUE) 

##Analyzing the results

# print method
print(ir.pca)

# plot method
plot(ir.pca, type = "l")

# summary method
summary(ir.pca)

# Predict PCs
predict(ir.pca, newdata=tail(log.ir, 2))


#The code to generate this Figure by ggbiplot
library(devtools)
install_github("ggbiplot", "vqv")
library(ggbiplot)

g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.species, ellipse = TRUE, 
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)
