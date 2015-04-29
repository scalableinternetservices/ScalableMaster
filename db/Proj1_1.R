library("igraph")

graph <- read.graph("facebook_combined.txt", format = "ncol", weights = 'no', directed = FALSE)

if(is.connected(graph)) {
	print("The graph is connected.")
}else {
	print("The graph is not connected.")
}

diameter(graph)

# Plot the degree distribution 
Plot <- plot(degree.distribution(graph),main="Degree Distribution",xlab="Degree",ylab="Frequency")
Hist = hist(degree(graph),breaks = seq(0, max(degree(graph))+1, 1))
dataframe = data.frame(x=Hist$mids,y=Hist$density)

# Try to fit a curve on it 
lm(y~x, data = dataframe)
