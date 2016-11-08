x <- c(1, 2, 3, 4, 5, 6)
y <- c(20, 30, 40, 50, 60, 70)
cbind(x, y)
rbind(x, y)
library(data.table)
df <- data.frame(name = c("ash","jane","paul","mark"), score = c(67,56,87,91))
df1 <- data.table(names = c("ash","jane","paul","mark"),score = c(67,56,87,91))
dim(df)
dim(df1)
str(df)
nrow(df)
#load data
data <- data.frame(state.x77)
head(data)

# qplot synatax
# qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, 
#       facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)
