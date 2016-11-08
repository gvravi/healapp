#http://www.r-bloggers.com/basics-of-lists/
#http://rforpublichealth.blogspot.in/2015/03/basics-of-lists.html

#STEP1 Constructing a list
#create three different classes of objects
vec <- 1:4
df <- data.frame(y = c(1:3), x = c("m", "m", "f"))
char <- "Hello!"

# add all three objects to one list using list() function
list1 <- list(vec, df, char)

# print list
list1
#We can also turn an object into a list by using the as.list() function. 
# coerce vector into a list
as.list(vec)

############################ STEP 2: Naming a list########################################
# We can put names on the components of a list using the names() function. 
# This is useful for extracting components.
# We could have also named the components when we created the list.

# name the components of the list
names(list1) <- c("Numbers", "Some.data", "Letters")
list1

# could have named them when we created list
another.list <- list(Numbers = vec, Letters = char)


####################### STEP 3: Manipulating a list ######################################
# Extract components from a list (many ways): the first is using the [[ ]] operator 
#(notice two brackets, not just one). Note that we can use the single [ ] operator 
#on a list, but it will return a list rather than the data structure that is the 
#component of the list, which is normally not what we would want to do. 
#See what I mean here:

## extract 3rd component using [[]] -> this returns a *string*
list1[[3]]

# print a list containing the 3rd component -> this returns a *list*
list1[3]

# It is also possible to extract components using the component's name as we see below.
# Again, be careful about the [ ] vs [[ ]] operator in the second way. 
# You need the [[ ]] to return the data structure of the component.

# extract 3rd component using $
list1$Letters

# extract 3rd component using [[ ]] and the name of the component
list1[["Letters"]]
list1["Letters"]   #See the difference between [[]] and []


# Extracting elements from a list containing multiple lists.
list1
# The below two commands extract all elements in 1st list, but note the 
#difference of [[]] & []
list1[[1]]
list1[1]

# TO get first element in first list use [[]], the same cannot be done with [].
list1[[1]][1] #Give 1st data element of list1 of all lists available in list1 with no name/[[]].
list1[1][1]   #Give all data elements of list1 of all lists available in list1.
list1[1]      #Give all data elements of list1 of all lists available in list1.
list1[[1]]    #Give all data elements of list1 of all lists available in list1 with no name/[[]].

#Subsetting a list - use the single [ ] operator and c() to choose the components
# subset the first and third components
list1[c(1, 3)] # Gives first and 3rd list

#We can also add a new component to the list or replace a component using the $ or [[ ]] 
#operators.This time I'll add a linear model to the list (remember we can put anything 
#into a list).

# add new component to existing list using $
list1$newthing <- lm(y ~ x, data = df)
list1








