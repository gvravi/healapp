#How to calculate the number of occurrence of a given character in each row of a column of strings?
# Load your example data
q.data<-data.frame(number=1:3, string=c("greatgreat", "magic", "not"), stringsAsFactors = F)
library(stringr)

# Count the number of 'a's in each element of string
q.data$number.of.a <- str_count(q.data$string, "a")
q.data