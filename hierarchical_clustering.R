Set.seed=12

#create data set using noramlization
x <- rnorm(10, sd = 1)
y <- rnorm(10, sd = 1)

#scatter plot of data
plot(x, y, col = "red", pch = 19,cex=2)

#convertion into dataframe
df <- data.frame(x = x, y = y)
df <- scale(df)

#distance calculation
distxy <- dist(df)
distxy

#fitting 
cluster <- hclust(distxy)
cluster

#ploting dendgram
plot(cluster, ylab = "Height", xlab="Distance", xlim=c(1,10), ylim=c(1,10))
