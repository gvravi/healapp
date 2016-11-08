library(XML)
setwd("~/R/xmlR")

#api from which data is collected
#http://api.kivaws.org/v1/lenders/jeremy/loans.xml

#We begin by parsing the XML document with
doc = xmlParse("loans.xml")

# We then pass doc to the xmlToList() function, and it will return an R 
# list with an element for each of # its top-level child nodes, mapping 
# each of these children to an R list and so on, in the same recursive
# way. It gives two lists paging(it contains list of 4) and 
# loans(it contains list of 20). Run below commands and see lists

kivaList = xmlToList(doc, addAttributes = FALSE)
kivaList

# In our situation, the <loan>nodes are two levels below the root node so 
# we need to access them to pass to xmlToDataFrame().We get the top-level/root 
# node and then its <loans> node as follows:
#list two is <loans> we can call as below by name 

loansNode = xmlRoot(doc)[["loans"]]
loansNode

#The xmlRoot() function gives us the top-level node of our document, i.e., <response>. 
#To fetch # the <loans> subnode, we treat the root node as if it were a list in R 
#and use the expression # node[["loans"]] to extract the (first) child node 
#whose element name is <loans>. This is a convenient way to access child nodes. 
#We can also index by position,as we know the second element is the <loans> node 
#and the first element is <paging> node
#list two is <loans> we can call as below by index number

xmlRoot(doc)[[2]]

xmlChildren(loansNode)
# We want the list of <loan> nodes. The function xmlChildren() is the means for 
# getting the list of all child nodes of a given node, e.g., the <loan> nodes 
# under <loans>. We then pass this list of the individual <loan> nodes to
# xmlToDataFrame() to create a data frame with below command

loans = xmlToDataFrame(xmlChildren(loansNode))
names(loans)

# Note that this approach collapses the image column to just the value 
# of the first child node in <image>