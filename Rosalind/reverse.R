dna <- "AAAACCCGGT"
dna1 <- strsplit(dna,"")
dna1 <- unlist(dna1)

tc <- length(dna1)


for (i in tc:1){
  
  print(dna1[i])
  
}


paste0(dna2,collapse = "")