###The apply function

#Applies a function to sections of an array and returns the results in an array.

###apply syntax:
#apply(object, margin, function, ...)

#object:matrix, array, df; 
#margin: 1=row, 2=col,both=c(1,2)
#function:  function we want to apply and can be any R function(ex:mean), 
#including a User Defined Function(f(x))
#... this ellipses indicate function arguments(for mean FUN, argument is na.rm=T)
#output we get, a line vector 

mat1 <- matrix(rep(seq(4), 4), ncol = 4)
mat1


#row sums of mat1
apply(mat1, 1, sum)


#column sums of mat1
apply(mat1, 2, sum)

#using a user defined function
sum.plus.2 <- function(x){
  sum(x) + 2
}

#using the sum.plus.2 function on the rows of mat1
apply(mat1, 1, sum.plus.2)


#the function can be defined inside the apply function
#note the lack of curly brackets 
apply(mat1, 1, function(x) sum(x) + 2)

#generalizing the function to add any number to the sum
#add 3 to the row sums 
apply(mat1, 1, function(x, y) sum(x) + y, y=3)


#add 5 to the column sums
apply(mat1, 2, function(x, y) sum(x) + y, y=5)
#############################################################################################

###The lapply function
                    # lapply(list, function, ...)

# Applies a function to elements in a list or a vector and returns the results in a list.
# The lapply function becomes especially useful when dealing with data frames. 
# In R the data frame is considered a list and the variables in the data frame are 
# the elements of the list. We can therefore apply a function to all the variables 
# in a data frame by using the lapply function.
# Note that unlike in the apply function there is no margin argument since we are just 
# applying the function to each component of the list.

#creating a data frame using mat1
mat1.df <- data.frame(mat1)
mat1.df


#in the data frame mat1.df the variables mat1.1 - mat1.4 are elements of the list mat1.df
#these variables can thus be accessed by lapply
is.list(mat1.df)


#obtaining the sum of each variable in mat1.df
lapply(mat1.df, sum)


#Verifying that the results are stored in a list, obtaining the names of the elements 
#in the result list and displaying the first element of the result list.

#storing the results of the lapply function in the list y
y <- lapply(mat1.df, sum)

#verifying that y is a list
is.list(y)


#names of the elements in y
names(y)


#displaying the first element
y[[1]]


y$X1

#Just like in the apply function we can use any built in or user defined function and we can define the function to be used inside the lapply function.

#user defined function with multiple arguments 
#function defined inside the lapply function
#displaying the first two results in the list
y1 <- lapply(mat1.df, function(x, y) sum(x) + y, y = 5)
y1[1:2]

#Another useful application of the lapply function is with a "dummy sequence". 
#The list argument is the dummy sequence and it is only used to specify how many 
#iterations we would like to have the function executed.
#When the lapply functions is used in this way it can replace a for loop very easily.

#using the lapply function instead of the for loop
unlist(lapply(1:5, function(i) print(i) ))


#using the for loop
for(i in 1:5) print(i)
###############################################################################################

###The sapply function

#Applies a function to elements in a list and returns the results in a vector, matrix 
#or a list.

###sapply(list, function, ..., simplify)

#When the argument simplify=F then the sapply function returns the results in a list
#just like the lapply function. However, when the argument simplify=T, the default, 
#then the sapply function returns the results in a simplified form if at all possible. 
#If the results are all scalars then sapply returns a vector. If the results are all of 
#the same length then sapply will return a matrix with a column for each element in list
#to which function was applied.

y2 <- sapply(mat1.df, function(x, y) sum(x) + y, y = 5)
y2

is.vector(y2)
###############################################################################################
###The tapply function

#Applies a function to each cell of a ragged array.

###tapply(array, indicies, function, ..., simplify)

#The function is applied to each of the cells which are defined by the categorical
#variables listed in argument indicies. If the results of applying function to 
#each cell is a single number then the results are returned in a multi-way array 
#which has as many dimensions as there are components in the argument indicies. 
#For example, if the argument indicies = c(gender, employed) then the result will
#be a 2 by 2 matrix with rows defined by male, female and columns defined by employed,
#unemployed. If the results are not a single value then the results are in a list 
#with an dim attribute which means that it prints like a list but the user access the 
#components by using subscripts like in an array.

#creating the data set with two categorical variables
x1 <- runif(16)
x1

cat1 <- rep(1:4, 4)
cat1

cat2 <- c(rep(1, 8), rep(2, 8))
cat2

mat2.df <- data.frame(x1)
names(mat2.df) <- c("x1")
mat2.df$cat1 <- cat1
mat2.df$cat2 <- cat2
mat2.df

tapply(mat2.df$x1, mat2.df$cat1, mean)


tapply(mat2.df$x1, list(mat2.df$cat1, mat2.df$cat2), mean)
#########################################################################################

###The sweep function

#The sweep function returns an array like the input array with stats swept out.

###sweep(array, margin, stats, function, ...)
#The input array can be any dimensional array. The stats argument is a vector containing
#the summary statistics of array which are to be "swept" out. The argument margin 
#specifies which dimensions of array corresponds to the summary statistics in stats.
#If array is a matrix then margin=1 refers to the rows and stats has to contain row 
#summary statistics; margin=2 refers to the columns and stats then has to contain 
#column summary statistics. The function argument specifies which function is to be 
#used in the "sweep" operation; most often this is either "/" or "-".

#creating the data set
a <- matrix(runif(100, 1, 2),20)
a.df <- data.frame(a)
#subtract column means from each column
#centering each column around mean
colMeans(a)

a1 <- sweep(a, 2, colMeans(a), "-")
a1[1:5,  ]

colMeans(a1)


#dividing each column by sum
a2 <- sweep(a, 2, colSums(a), "/")
a2[1:5,  ]


#centering each row around the mean of the row
rowMeans(a)[1:5]

a3 <- sweep(a, 1, rowMeans(a), "-")
a3[1:5,  ]

rowMeans(a3)[1:5]
##########################################################################################
###The column functions

# There are a suite of functions whose sole purpose is to compute summary statistics over
# columns of vectors, matrices, arrays and data frames. These functions include: 
colMeans
colSums

#creating the data set
a <- matrix(runif(100, 1, 2), 20)
a.df[1:5, ]


#Get columns means using columns function
#input is the matrix a, results in a vector
col.means <- colMeans(a)
col.means

is.vector(col.means)
##########################################################################################
###The row functions

#There are a suite of functions whose sole purpose is to compute summary statistics over rows of vectors, matrices, arrays and data frames. These functions include: 
rowMeans
rowSums

#Get row means using row functions
#input is the matrix a, results are in a vector
row.means <- rowMeans(a)
row.means[1:5]
is.vector(row.means)
############################################################################################
###Miscellaneous

#It is important to realize that there are usually many different ways of obtaining 
#the same results and that these methods do differ in efficiency and other details. 
#The following examples shows three different methods for obtaining the column means 
#and how the results differ.

#Get columns means using columns function
#input is the matrix a, results in a vector
col.means1 <- colMeans(a)
col.means1

is.vector(col.means1)

#get column means using apply 
#input is a matrix, results in a vector
col.means2 <- apply(a, 2, mean)
col.means2

is.vector(col.means2)

#get column means using lapply 
#input is the data frame which is a list, results are in a list
col.means3 <- lapply(a.df, mean)
col.means3
is.list(col.means3)

#The following examples shows three different methods for obtaining the row means 
#and how the results differ.

#Get row means using row functions
#input is the matrix a, results are in a vector
row.means1 <- rowMeans(a)
row.means1[1:5]

is.vector(row.means1)

#using apply, input is a matrix, results are in a vector
row.means2 <- apply(a, 1, mean)
row.means2[1:5]

is.vector(row.means2)

#we can transpose the data frame and create a new data frame
ta.df <- data.frame(t(a.df))

#use lapply on the data frame since it is a list 
#results are in a list
row.means3 <- lapply(ta.df, mean)
row.means3[1:5]

is.list(row.means3)

# Any of the functions that have been mentioned above can be used inside a user 
# defined function. In the following example the function f1 multiply the 
# sequence 1-x by y by using the lapply function instead of a for loop.

f1 <- function(x, y) {
  return(lapply(1:x, function(a, b) b*a, b=y ))
}

#multiplying the sequence 1:3 by 2
f1(3, 2)

#multiplying the sequence 1:4 by 10
f1(4, 10)

####Cool use of the lapply function which can be used in many clever ways.

list1 <- lapply(1:6, runif)
list1

list2 <- lapply(1:6, runif)
list2

lapply(1:6, function(i, x, y) x[[i]] + y[[i]],
       x = list1, y = list2)

# rnorm(n, mean = , sd = ) is used to generate n normal random numbers with arguments mean
# and sd; while runif(n, min = , max = ) is used to generate n uniform random numbers lie 
# in the interval (min, max).
