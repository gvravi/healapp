library(dplyr)
library(tidyr)

# Reading rrf file

conso<-read.delim(file = 'RXNCONSO.RRF', sep='|',header = F, stringsAsFactors=F)

# Check for variables and we find V3 containing lot of NA
conso$V3

#Remove variables V3 to V7 containing NA
conso[3:7] <- list(NULL)

# gives number of rows in conso
nrow(conso)

#Gives data in V2 of conso table and number of rows
table(conso$V2)

## column names are taken from https://www.nlm.nih.gov/research/umls/rxnorm/docs/2016/rxnorm_doco_full_2016-1.html#conso
#assigning nice column names
names(conso)[1] <- 'rxcui'
names(conso)[3] <- 'rxaui'
names(conso)[7] <- 'sab'  #12
names(conso)[8] <- 'tty'  #13
names(conso)[10] <- 'str' #15

#looking at the names
names(conso)

#what concept types there are
table(conso$tty)

#nicer output
as.matrix(table(conso$tty))

#get only true rxnorm terms
sconso<-subset(conso,sab=='RXNORM')
#types - what types are present
as.matrix(table(sconso$tty))
#get only ingredients and CUI and name for each intredient
ingr<-subset(conso,tty=='IN',select=c('rxcui','str'))
#only brand names
bn<-subset(conso,tty=='BN',select=c('rxcui','str'))

#nrow(unique(bn)) same as nrow of bn
nrow(unique(bn)) 

#lets create a simple lookup file for RxCUIs
codes<-subset(sconso,select=c('rxcui','str'))
codes$str<-tolower(codes$str) # converts str column strings to lowercase
codes<-unique(codes)

#lets create a simple lookup file for all sab RxCUIs
codes1<-subset(conso,select=c('rxcui','tty','str'))
codes1$str<-tolower(codes1$str) # converts str column strings to lowercase
codes1<-unique(codes1)
nrow(unique(codes1)) 

write.csv(codes1,file="rxnormU.csv",row.names=F,quote=T,na='')
