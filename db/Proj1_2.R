library("igraph")

graph <- read.graph("facebook_combined.txt", format = "ncol", weights = 'no', directed = FALSE)

# find the first node and its neighbor
one_and_neighbor <- neighborhood(graph,1,1)[[1]]

# delete nodes from graph which are not in the first node's neighbor
delete_node <- which(!((1:vcount(graph))%in% one_and_neighbor))

#create new subgraph with the first node and its neighbor
newGraph <- delete.vertices(graph, delete_node)

# number of nodes
nodeNum = length(E(newGraph))

# number of edges
edgeNum = length(V(newGraph))