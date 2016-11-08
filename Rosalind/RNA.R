dna <- "GATGGAACTTGACTACGTAAATT"
dna1 <- strsplit(dna,"")
dna1 <- unlist(dna1)
tc <- length(dna1)
tc


for (i in 1:tc){
  
  
  if(dna1[i]=="T"){
    dna1[i]<- "U"
    
  }
  
 
}

#list(dna1)
toString(dna1)
paste(dna1,sep="",collapse="")
paste0(dna1,collapse = "")

