###Using apply in R 

###apply syntax:
                #apply(object, margin, function, ...)

#object:matrix, array, df; 
#margin: 1=row, 2=col,both=c(1,2)
#function:  function we want to apply and can be any R function(ex:mean), 
            #including a User Defined Function(f(x))
#... this ellipses indicate function arguments(for mean FUN, argument is na.rm=T)

#output we get, a line vector 

###Example of apply
X<-matrix(rnorm(30), nrow=5, ncol=6)
X
apply(X,2 ,sum)
#############################################################################################
###Using lapply in R 
###lapply syntax:
                  #lapply(object, function, ...)

#object: it can be df, list, vector; 
#margin: margin is not there
#function:  function we want to apply and can be any R function(ex:mean), 
#including a User Defined Function(f(x))
#... this ellipses indicate function arguments(for mean FUN, argument is na.rm=T)

#The output returned is a list (thus the l in the function name) which has the 
#same number of elements as the object passed to it. 

###Example of lapply
#create a list of matrices:
A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C) 
MyList

# extract the second column from the list of matrices, using the selection operator "["
lapply(MyList,"[", ,2) 

# Another example: we now  extract the first row from the list of matrices, using the selection operator "["
lapply(MyList,"[", 1, )

# Another example:extract a single element for each matrice
lapply(MyList,"[", 1, 2) 
################################################################################################
###Using sapply in R 
###lapply syntax:
                #sapply(object, function, ..., simplify)

#object: it can be df, list, vector; 
#margin: margin is not there
#function:  function we want to apply and can be any R function(ex:mean), 
#including a User Defined Function(f(x))
#... this ellipses indicate function arguments(for mean FUN, argument is na.rm=T)

#As we know, lapply would give us a list
lapply(MyList,"[", 2,1 )

#but sapply returns a vector instead.

sapply(MyList,"[", 2,1 ) 

#unless we tell simplify=FALSE as parameter to sapply,
#in which case a list will be returned:
  
sapply(MyList,"[", 2,1, simplify=F)

#Conversely, a function like unlist, can tell lappy to give us a vector:
  
unlist(lapply(MyList,"[", 2,1 )) 
#############################################################################################
###The tapply function
#Applies a function to each cell of a ragged array.
###tapply syntax:
                #tapply(object, index, function, ..., simplify)
#object is vector, element of a list, col of DF
#index is factor or category used to subset object
#name of function/defining function
#elipses are arguments of a function
#simplify

## generate data for medical example
medical.example <- data.frame(patient = 1:100,
             age = rnorm(100, mean = 60, sd = 12),
             treatment = gl(2, 50,labels = c("Treatment", "Control")))
medical.example

## Generic Example
## tapply(Summary Variable, Group Variable, Function)
#mean of age by treatment column.
tapply(medical.example$age, medical.example$treatment, mean)

#To calculate the mean of the Sepal Length but broken by the Species, so we will 
#use the tapply() function
tapply(iris$Sepal.Length, iris$Species, mean)

#We are interested in seeing the avg mpg for the various transmission types and number 
#of cylinders in car. This is nothing but avg mpg grouped by transmission type and the 
#number of cylinders in car.
tapply(mtcars$mpg, list(mtcars$cyl, mtcars$am), mean)
#############################################################################################
###Using mapply in R
Q=matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
Q 

#where we bind the results of the rep function with c (for "column bind"), 
#and ask for a 4 x 4 matrix). We could have done, more concisely:
  
Q=mapply(rep,1:4,4)
Q 
############################################################################################
###The Aggregate function in R 

#Syntax:
aggregate(x, by, FUN, ..., simplify = TRUE) 

Mydf <- data.frame(DepPC=c("90","91","92","93","94","75"), DProgr=c(1:120), 
                   Qty=c(7:31,9:23,99:124,2:28,14:19,21:29,4,3,1:9,66), 
                   Delivered=ifelse(rnorm(120)>0,TRUE,FALSE))
Mydf

#So looking at the first 15 records or the last 5 (a bit of 'data exploration'):
# show first 15 records  
head(Mydf,15) 
tail(Mydf,5) # ...or last 5 

#Looking at the type of variables the dataset is made of (a rather common use of sapply!):
# show data types for each column using sapply 
sapply(Mydf, class)

#how many rows (records) and columns
dim( Mydf) 

# the same as dim, but separately 
nrow(Mydf); ncol(Mydf) 

#Listing all the departments:
#how many departments are there?
unique(Mydf$DepPC)

#Here we are interested in knowing where the product sells best, e.g. 
#in which department. Therefore we regroup the data by department, 
#summing up the sales, Qty, for each department (DepPC):
aggregate(Mydf$Qty,by=Mydf["DepPC"],FUN=sum) 
