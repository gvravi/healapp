library(XML)
setwd("~/R/xmlR")

#Begin by parsing the XML document with
doc = xmlParse("loans.xml")

#first access the top-level/root node in the document and then its child node, 
#<lenders> with

loansNode = xmlRoot(doc)[["loans"]]
loansNode
xmlSize(loansNode)

#Within a <lender> node, we can retrieve by name the <name>, <activity>,
# and <image> nodes of the first loan with
loansNode[[1]] [ c("name", "activity", "image") ]


# We now have access to the <lenders> node and want to iterate over all of its children 
# (the <loan> nodes) and extract the value of each of their <activity> nodes.
 xmlChildren(loansNode)
 
 occ = lapply(xmlChildren(loansNode),
              function(node) xmlValue(node[["activity"]]))
 
 do.call(rbind, occ)
 

# Suppose we want the children of loansnode[[1]] that have more than one child. 
#In this example, that is only the <image> node. We can determine which child nodes 
#satisfy this constraint  with   

#This command gives size of each child node
 sapply(xmlChildren(loansNode[[1]]), xmlSize)
 
#This gives the nodes with size >1
w = sapply(xmlChildren(loansNode[[1]]), xmlSize) > 1
w
 
#We can use this logical vector to get the subset
loansNode[[1]] [ w ]

#The image tag under loan node has two elements, toget template_id
loansNode[[1]][["image"]][["template_id"]]
loansNode[[1]][["image"]][[2]]

#Toget template_id tag value
xmlValue(loansNode[[1]][["image"]][["template_id"]])

#Finally, we retrieve the content of the <template id> subnodes within <image> with
template_id = lapply(xmlChildren(loansNode),
                     function(x) xmlValue(x[["image"]][["template_id"]]))
template_id
 

#The functions xmlApply() and xmlSApply() take the node and the function and do the 
#looping for us. (The "sapply" version attempts to simplify the result; 
#xmlApply() does not.) We can, for #example, obtain the number of children in each 
#of the child nodes of the first <loan> node

xmlSApply(loansNode[[1]], xmlSize)
