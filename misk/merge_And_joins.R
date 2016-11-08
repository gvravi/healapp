# Tutorial on Working with Data Frames in R - Joins and Merging

# We will first create two data frame which will consist the following:
# Data frame 1 (DataFrame1) will have fields:
# 1. Student Id
# 2. Subject (in which they scored highest marks out of 100 max marks each)
# 3. CGPA (upto last semester)
# 4. Race (of student)

df1 <- data.frame(StudentId = c(1:20), 
                  Subject = c(rep("Physics", 4),rep("Chemistry",4),rep("Biology",4),rep("Maths",4),rep("Arts",4)),
                  CPGA = c(random::randomNumbers(20,70,100,1)),
                  Race = c(rep("White",4),rep("Black",4),rep("Asian",4),rep("Latin",4),rep("Indian",4)))


# Data frame 2 (DataFrame2) will have fields:
# 1. Student Id
# 2. State (native)
# 3. Age
# 4. Gender

df2 <-  data.frame(StudentId = c(1:10), 
                   State = c(rep("Arizona", 2), rep("New York", 2), rep("Florida", 2), rep("California", 2), rep("Texas", 2)), 
                   Age = c(random::randomNumbers(10, 16, 20, 1)), 
                   Gender = c(rep("Male", 3), rep("Female", 3), rep("Male", 2), rep("Female", 2)))

#Example 1 : Merge Using Inner Join
#This method joins two tables as long as all the columns has same numbers of rows.
merge(df1, df2)
merge(df2, df1)

#Example 2 : Merge Using Outer Join
# Outer join method joins all the rows and if there is a match in no. of rows, 
#the rows are created and filled with NAs.
merge(x = df1, y = df2, by = "StudentId", all = TRUE)

# Example 3 : Merge Using Left Outer Join
# A left outer join retains all of the rows of the left table, regardless of whether 
# there is a row that matches on the right table. All empty rows, if any, 
# on the right table will be filled with NA's.

merge(x = df1, y = df2, by = "StudentId", all.x = TRUE)
merge(y = df1, x = df2, by = "StudentId", all.x = TRUE)

#Example 4 : Merge Using Right Outer Join
#A 'Right Outer Join' retains all of the rows of the right table, regardless of whether 
# there is a row that matches on the left table. All empty rows, if any, 
# on the right table will be filled with NA's.



