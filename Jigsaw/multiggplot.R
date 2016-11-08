#---------------------ggplot2 with for DV vs IDV without looping-----------------------------

### ggplot for DV against each IDV for boston_prices.csv data

library(ggplot2)
ggplot(Bprices,aes(x=MEDV,y=LSTAT))+geom_point()
ggplot(Bprices,aes(x=MEDV,y=DIS)) +geom_point()
ggplot(Bprices,aes(x=MEDV,y=AGE)) +geom_point()

#---------------------General synatax for Looping over ggplot2 with columns----------------------

#Inside of aes_string(), all variables need to be represented as character. 
#Add quotes around "response".
library(ggplot2)
lapply(list("value1","value2"), 
       function(i) ggplot(df1, aes_string(x=i, y="response")) + geom_point())

#---------------------Looping over ggplot2 with columns using lapply----------------------------------------

### Using lapply to create ggplot for a DV(MEDV) against all IDVs(i)
### best option is seems lapply

lapply(names(Bprices), function(i)
  ggplot(data = Bprices, aes_string(x = i, y = "MEDV")) + geom_point())


#---------------------Looping over ggplot2 with columns using apply----------------------------------------
### Using apply to create ggplot for a DV against all IDV 

par(mfrow=c(2,4))
apply(Bprices,2, function(i){
  ggplot(data = Bprices, aes(x = MEDV, y = i)) + geom_point()
})



#---------------------Looping over ggplot2 with columns using for loop----------------------------------------
### This code did not work

plots1 <- list()
for(nm in names(Bprices)) {
  ggplot(data = Bprices, aes(x = Bprices[nm]), y = Bprices[,14]) + geom_point()
}
plots1










