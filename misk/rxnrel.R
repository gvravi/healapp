rel<-read.delim(file = 'RXNREL.RRF', sep='|',header = F, stringsAsFactors=F)
#rm(rel)

#table(conso$V2)
#all english

## column names are taken from https://www.nlm.nih.gov/research/umls/rxnorm/docs/2016/rxnorm_doco_full_2016-1.html#conso
#assigning nice column names
#names(rel)
names(rel)[1] <- 'rxcui1'
names(rel)[5] <- 'rxcui2'
names(rel)[4] <- 'rel'
names(rel)[3] <- 'stype1'
names(rel)[7] <- 'stype2'
names(rel)[8] <- 'rela'
names(rel)[11] <- 'source_abbrev'

rel$V12 <- NULL  #not used in this distribution, only in full UMLS
rel$V10 <- NULL
table(rel$rel)
table(rel$stype1)
table(rel$source_abbrev)
names(rel)
table(rel$source_abbrev)
as.data.frame(table(rel$rela))

map<-subset(rel,rela=='tradename_of',select=c('rxcui2','rela','rxcui1'))
#note that we switched the order (to account for RxNorm semantics)
head(map)

#lets use this map on our brand names
head(bn)
nrow(bn)

