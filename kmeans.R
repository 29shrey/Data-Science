install.packages("ClusterR") 
install.packages("cluster")

#loading
library(ClusterR)
library(cluster)

#dataframe
df <- data.frame(x = c(2,2,8,5,7,6,1,4,3),
                 y = c(10,5,4,8,5,4,2,9,9))

#structure
str(df)

#fitting
kmeans_r <- kmeans(df, centers = 2) 
kmeans_r

# Model Evaluation and visualization 
plot(df[c("x", "y")],  
     col = kmeans_r$cluster,
     pch=19,
     main = "K-means with 2 clusters") 

## Visualizing clusters 
y_kmeans <- kmeans_r$cluster 
clusplot(df[c("x","y")], 
         y_kmeans, 
         lines = 0, 
         shade = TRUE, 
         color = TRUE, 
         labels = 2, 
         plotchar = FALSE, 
         span = TRUE, 
         main = paste("Cluster X Y"), 
         xlab = 'X', 
         ylab = 'Y')
