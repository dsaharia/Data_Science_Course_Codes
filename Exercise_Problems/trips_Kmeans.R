# Problem Statement - Cab driver attended 91 trips in 5 days. He monitors the following
# Trip length, Max speed, Frequent speed, Trip duration, times use of brakes, idling time also time horn was honked
# The company wants to group the trips in certain number of categories based on the details.

trip_details_df <-  read.csv('data/tripDetails.csv', row.names = 1) # row names is used to set index from col 1
View(trip_details_df)
str(trip_details_df) # structure of the data
trip_kMeans <- kmeans(trip_details_df, 3)
plot(trip_kMeans$cluster)
trip_details_df['cluster'] <- trip_kMeans$cluster
plot(trip_details_df$TripLength, 
     trip_details_df$TripDuration, 
     xlab = "Trip Length",
     ylab = "Trip Duration",
     main = "Trip Length Vs Duration uabased on 3 clusters",
     col=trip_details_df$cluster)

# Elbow method to determine optimum number of clusters
k_max <- 10
wss <- rep(NA, k_max)
number_clusters <- list()
for (i in 1:k_max){
  drive_class <- kmeans(trip_details_df, i)
  wss[i] <- drive_class$tot.withinss # Total WCSS
  number_clusters[[i]] <- drive_class$size # Total elememts in the clusters
}
plot(1:k_max, wss, 
     type = 'b', 
     pch=19,
     main = "Optimum Number of Clusters",
     xlab = "Number of Clusters, K", 
     ylab = "Total WCSS")
text(x = 4.5, y = 500000,labels='Optimum Point', col = 'red')
