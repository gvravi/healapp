
Bprices <- read.csv("boston_prices.csv", header = T)

### Replacing Missing Values(NAs) of single column with column mean
Bprices$MEDV[is.na(Bprices$MEDV)]<-mean(Bprices$MEDV,na.rm=TRUE)

par(mfrow=c(2,4))
lapply(names(Bprices[,-4]), function(x) {
boxplot(Bprices[x], main = x) 
})


Bprices[] <- apply(Bprices,2, function(x) {
  box <- boxplot(x)
  index <- which(x %in% box$out)
  x[index] <- mean(x[-index],na.rm=T)
  return(x)
})

Bprices[index,] <- mean(Bprices[,x])

#Restore the par parameters to normal
dev.off()

lapply(seq_along(Bprices), function(x) names(Bprices[x]))

Bprices[] <- lapply(names(Bprices), function(x) {
  box <- boxplot(Bprices[,x])
  #out<-box$out
  index <- which(Bprices[,x] %in% box$out)
  Bprices[index,] <- mean(Bprices[,x])
  #   rm(x)
  #   rm(out)
  return(x)
} )


sort(Bprices$LSTAT) 
y<-boxplot(Bprices$LSTAT)
y
out<-y$out
out
index<-Bprices$LSTAT %in% y$out
index
index <- which(Bprices[,13] %in% y$out)
index
Bprices[index,]


index <- which(x %in% box$out)
x[index] <- mean(x[-index],na.rm=T)









A <- Bprices[index,13] 
Bprices[index,13] <- mean(Bprices[,13])
B <-  mean(Bprices[,13])
A <- B
write.csv(Bprices, file = "Bprices2.csv", row.names = FALSE)


Bprices[] <- lapply(names(Bprices), function(x) {
  box <- boxplot(Bprices[,x])
  index <- which(Bprices[,x] %in% box$out)
  Bprices[index,] <- mean(Bprices[,x])
  #   rm(x)
  #   rm(out)
  #return(x)
} )




sort(Bprices$LSTAT) 
y<-boxplot(Bprices$LSTAT)
y
out<-y$out
out
index<-Bprices$LSTAT %in% y$out
index
index <- which(Bprices[,13] %in% y$out)
index
A <- Bprices[index,13] 
Bprices[index,13] <- mean(Bprices[,13])
B <-  mean(Bprices[,13])
A <- B
