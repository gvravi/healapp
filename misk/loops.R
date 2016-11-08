#https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r#gs.p9dLMmw

getwd()
setwd("C:/Users/avon/Documents/R/brfss")
library(SASxport)
a <- read.xport(file = "LLCP2014.XPT")
my_int <- 10
nr <- as.integer(my_int)
nr
mymat <- matrix(0,nr,nr)
mymat
if (nr > 10){
  mymat[1:10,1:10]
}

readinteger <- function(){
  n <- readline(prompt="Please, enter your ANSWER: ")
}

response <- as.integer(readinteger())


while (response!=42) {   
  print("Sorry, the answer to whaterver the question MUST be 42");
  print(response);
  response <- as.integer(response);
  response = response + 1;
  
} 


readinteger <- function(){
  n <- readline(prompt="Please, enter your ANSWER: ") 

}

response <- as.integer(readinteger())

repeat {   
#   response <- as.integer(response);
#   response = response + 1;
  
  if (response == 42) {
    print("Well done!");
    break
  } else print("Sorry, the answer to whaterver the question MUST be 42");
 # response <- as.integer(response);
  response = response + 1;

   print(response);
} 

#Create the data frame 'student.df' with the data provided below:

student.df = data.frame( name = c("Sue", "Eva", "Henry", "Jan"),
                         sex = c("f", "f", "m", "m"), 
                         years = c(21,31,29,19))
student.df

# This is giving TRUE and FALSE
student.df$male.teen <- ifelse(student.df$years < 20,T,F)

# This is giving T and F
student.df$male.teen = ifelse(student.df$sex == "m" & 
                                student.df$years < 20, "T", "F")
student.df

for (i in 1:length(1:3)) { 
  for (j in 1:10) {
    print(j+i-1)
  }}

for (i in 1:10){
  for (j in 0:9){
    print(i+j)
  }
}

x <- rnorm(3)
for(i in 1:10){
  print(i)
  print(x)
}

set.seed(23)
randomnr <- rnorm(3)
reps <- 1

repeat {
  print(randomnr)
  reps <- reps + 1
  
  if(reps > 10) {
    break
  }}

library(datasets)
data(mtcars)
mtcars

for (i in mtcars$disp){
  if (i >= 160) {
    print(i)
    
  } 
  
}


for (i in mtcars$disp){
  if(i<160)
    next
  print (i)}


for (i in mtcars$disp){
  if(i<160)
    break
  print (i)
}


x <- 0

while(x <= 34) {
  x = x+1
  if(x == 7) next
  
  print(x)
}


x <- 1:5

for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}