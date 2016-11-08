bases <- c('T','A','G','C')
bases <- sort(bases)

dist <- length(bases)
for(i in 1:dist)
  {
  for(j in 1:dist)
    {
    combination <- paste0(bases[i],bases[j])
    print(combination)
    
    
    }
 
}