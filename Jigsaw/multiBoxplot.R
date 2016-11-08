#------------------------------------- Boxplot example 1----------------------------------
#Multiplot of variables var1 and var2.
par(mfrow = c(1,2))
lapply(names(my.data[ , 1:2]), function(y) {
  #quartz()
  boxplot(my.data[, y],main = y)
})

#---------------------------------- Boxplot example 2-------------------------------------

#Multiplot of variables var1 and var2 against categories of variable TimePeriod.

var1 = rnorm(1000) 
var2 = rnorm(1000) 
TimePeriod = rep((LETTERS[1:4]), 250) 
my.data = data.frame(var1,var2,TimePeriod) 

#Using formula within boxplot
par(mfrow = c(1,2))
lapply(names(my.data)[1:2], function(y)
  boxplot(formula(paste(y,'TimePeriod',sep='~')), 
          main=y,data=my.data)) 

## Without using formula within boxplot
par(mfrow = c(1,2))
lapply(names(my.data[ , 1:2]), function(y) {
  boxplot(my.data[, y] ~ my.data[, "TimePeriod"], main = y)
})


#---------------------------------- Boxplot example 3-------------------------------------

#Add the variable name (i.e., x, y, and z) as the title for each boxplot:
  
bpdf = data.frame(group=c("A","A","A","B","B","B","C","C","C"),
                    x=c(1,1,2,2,3,3,3,4,4),
                    y=c(7,5,2,9,7,6,3,1,2),
                    z=c(4,5,2,9,8,9,7,6,7))

#The problem is that, when looping over the columns (data.frame/list items), the 
#column names themselves are lost, as shown by

devnull <- lapply(bpdf[-1], print)


#So instead of looping over the columns, you could loop over the variable names:

par(mfrow = c(1, ncol(bpdf) - 1))

lapply(names(bpdf)[-1], function(var){
        x <- bpdf[[var]]
        y <- sort(tapply(x, bpdf$group, median), decreasing = TRUE)
        boxplot(x ~ factor(bpdf$group,levels=names(y)), main = var)
      })

#---------------------------------- ggplot example 4-------------------------------------

plotHistFunc <- function(x, na.rm = TRUE,...) {
  nm <- names(Bprices)
  for (i in seq_along(nm)) {
    ggplot(x,aes_string(x = nm[i])) + geom_histogram(alpha = .5,fill = "dodgerblue")
    #ggsave(plots,filename=paste("myplot",nm[i],".png",sep=""))
  }
}
ggplot(prices,aes(x=MEDV,y=AGE)) +geom_point()

install.packages("cowplot")
library("cowplot")

ggplot(Bprices, aes(x = cty, y = hwy, colour = factor(cyl)))+ 
  geom_point(size=2.5)
plotHistFunc(Bprices) ## execute function