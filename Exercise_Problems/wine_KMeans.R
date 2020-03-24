wine_data <- read.csv('data/wine.csv')
str(wine_data) # Here the value of Magnesium and Proline is very large compared to other attributes, so scaling is performed
wine_data_scaled <- as.data.frame(scale(wine_data))
set.seed(1234) # Random number state
wine_KMeans <- kmeans(wine_data_scaled, centers = 3, nstart = 25) # nstart takes 25 intial clusters and takes the best one

cat("Size of Each clusters : ", wine_KMeans$size)
cat("WSS of Each clusters : ", wine_KMeans$withinss)
