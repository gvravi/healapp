library(XML)
data <- xmlParse("govtrack.xml",useInternalNodes=TRUE)
res <- as.data.frame(do.call(rbind,xpathApply(data, "//bill",xmlAttrs)))
#or res <- as.data.frame(t(xpathSApply(data, "//bill",xmlAttrs)))
res

