dna <- "AAAACCCGGT"
dna1 <- strsplit(dna,"")
dna1 <- unlist(dna1)
dna1 <- rev(dna1)
dna1
tc <- length(dna1)
tc
dna2 <- NULL


for (i in 1:tc){
  
  
  if(dna1[i]=="A"){
    dna2[i]<- "T"
    
  }
  
  if(dna1[i]=="T"){
    dna2[i]<- "A"
    
  }
  
   if(dna1[i]=="G"){
    dna2[i]<- "C"
    
  }
  
    if(dna1[i]=="C"){
    dna2[i]<- "G"
    
  }
}


paste0(dna2,collapse = "")




# Alternately with  if and else if code
# for (i in 1:tc){
#   
#   
#   if(dna1[i]=="A"){
#     dna2[i]<- "T"
#     
#   }
#   else if(dna1[i]=="T"){
#     dna2[i]<- "A"
#    
#   }
#   
#   else if(dna1[i]=="G"){
#     dna2[i]<- "C"
#    
#   }
#   
#   else if(dna1[i]=="C"){
#     dna2[i]<- "G"
#    
#   }
# }
