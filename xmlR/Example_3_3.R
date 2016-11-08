# Chapter 3 example 3.3
setwd("~/R/xmlR")
setwd("~/R/Jigsaw")
library(XML)

#Read  XML document into R with xmlParse
doc1 = xmlParse("merged_catalog.xml")

#Identify root element of xml class
root = xmlRoot(doc1)
root

#Name of root
xmlName(root)

#This dosen't work bcoz there is only one list merge.? 
#But works for event as it has elemets
# root1 <- xmlRoot(doc1)[["merge"]]
# root1 <- xmlRoot(doc1)[["event"]]
# root1

#Retrieving Attribute Values using xmlAttrs
xmlAttrs(root1[[1]])
xmlAttrs(root1[[2]])
xmlAttrs(root1[[3]]) 
# Not working 
# lapply(root1, xmlAttrs)
# do.call(rbind, lapply(root1, xmlAttrs))
# lapply(root1, function(x) xmlAttrs(x))

xmlAttrs(root[[1]][[1]])

#Retrieving Attribute Values using xmlGetAttr
xmlGetAttr(root[[1]], "id", NA, as.integer)
xmlGetAttr(root1[[1]], "value", NA, as.integer)
xmlGetAttr(root1[[1]], "year", NA, as.integer)

#We can collect all the id values across the <event> nodes with
##This is not working
as.integer(sapply(root, xmlGetAttr, name = "value"))


# To retrieve the time-stamp for each <event> node. We can use the xmlGetAttr() function
# to do this. This function takes as input a node and the name of an attribute, and it returns the value
# of the attribute on that node. We use xmlSApply() to apply xmlGetAttr() to each child of the root
# node, i.e., to each <event> node, with

timests = xmlSApply(root, xmlGetAttr, "time-stamp")
timests[1047]

#Getting the magnitudes of the quakes.
#To get magnitude of the first <event> (its tenth child for every event)
root[[1]][[10]]

# For our first approach, we extract the tenth element of each <event>. Then from each 
# of these <param> nodes, we extract the content of its value attribute:

child10 = xmlSApply(root, "[[", 10)
child10
mags = as.numeric(sapply(child10, xmlGetAttr, "value"))
head(mags)
mags

# An alternative approach is to combine the extraction of the children and the application of the
# xmlGetAttr() function in one step with

mags = as.numeric(xmlSApply(root,function(node)
                              xmlGetAttr(node[[10]], "value")))

#Relying on the tenth child of each <event> to contain the magnitude but getting 
#it is problematic becoz of difference in no of children in each event.
#Check this result

xmlSApply(root, xmlSize)[1:4]

#A more robust approach is to get the value of the name attribute on each of the
#<param> nodes in an <event> node and determine which is the pertinent <param>. 
#Then, we know that we are getting the magnitude value, rather than whatever might
#be in the tenth <param>.We can accomplish this using nested calls to xmlSApply() with

xmlSApply(root, function(evNode) {
  parNames = xmlSApply(evNode, xmlGetAttr, "name")
  i = which(parNames == 'magnitude')
  xmlGetAttr(evNode[[i]], "value")
})