library(cluster)
library(ClusterR)
data <- data.frame(
  x=c(2,2,8,5,7,6,1,4,3),
  y=c(10,5,4,8,5,4,2,9,9)
)
str(data)

model <- kmeans(data,centers = 2)
model

plot(data[c("x", "y")],  
     col = kmeans_r$cluster,
     pch=19,
     main = "K-means with 2 clusters") 

summary(model)
print(model$cluster)
clusplot(data,model$cluster)
