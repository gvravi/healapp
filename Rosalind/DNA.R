A = 0
T = 0
G = 0
C = 0

# For count always give 0, null means empty and cant add

dna <- "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
dna1 <- strsplit(dna,"")
dna1 <- unlist(dna1)
tc <- length(dna1)
tc


for (i in 1:tc){
  if(dna1[i]=="A"){
    A <- A + 1
  }
  
  if(dna1[i]=="T"){
    T <- T + 1
  }
  
  if(dna1[i]=="G"){
    G <- G + 1
  }
  
  if(dna1[i]=="C"){
    C <- C + 1
  }
    
}


cat("The count of A:",A)
cat("The count of T:",T)
cat("The count of G:",G)
cat("The count of C:",C)

#Alternately you can use this command to print count of each base
table(unlist(strsplit(dna, ""), use.names=FALSE))

#Alternately you can use this command to print count of each base
library(stringr)
str_count(dna, "A")
str_count(dna, "T")
str_count(dna, "G")
str_count(dna, "C")