# Chapter 3 section 3.2
setwd("~/R/xmlR")
library(XML)

#Read  XML document into R with xmlParse
doc1 = xmlParse("merged_catalog.xml")

#Identify root element of xml class
root = xmlRoot(doc1)

#Name of root
xmlName(root)

#No of children in Root
xmlSize(root)

#Accessing Nodes in the DOM(Document Object Model)
#The [[ and [ operators allows us to treat an XML node as a list of its child nodes. 
#Similar to subsetting lists, we can use [ and [[ to access child nodes by positions, 
#names, a logical vector, or exclusion. When we subset by "name",we use the node's 
#element name
## Note: We can see that root[[event]] give first element 
#but root[element] gives all elements in  

event1 = root[["event"]]
event1
names(event1)
xmlName(event1)

#We can retrieve, say, the tenth child of the first <event> with
event1[[10]]

#get the first seven <event> nodes with
root[1:7]

#get all but the first seven children of the root node with
root[ -(1:7) ]

#we subset by name using the single square bracket to extract all <event> nodes 
#from the <merge> node.

evs = root["event"]
evs

# The evs object is of class XMLInternalNodeList, which is essentially a list of
# XMLInternalElementNode objects. This means that we can apply the methods xmlName(),
# xmlValue(), etc. to the elements in evs, e.g., we find that the first <event> node 
#has 18 children  with

xmlSize(evs[[1]])

#Alternately
root[ names(root) == "event" ]

#then we extract all <event> nodes from the <merge> node. 
#A call to length() confirms this:
length(evs)

