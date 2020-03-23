library(caret) # For ConfusionMatrix
library(class) # For kNN model

service_train <- read.csv('data/serviceTrainData.csv')
service_test <- read.csv('data/serviceTestData.csv')

summary(service_train)
histogram(service_train$Service, 
          xlab = 'Service Needed or Not', 
          ylab = 'Frequency of Cars', 
          main="Histogram of Service in training set")

predicted_by_kNN <- knn(train = service_train[, -6],
                        test = service_test[, -6],
                        cl = service_train$Service,
                        k = 3 )
# Confusion Matrix generation manually
confusion_martix <- table(predicted_by_kNN, service_test[,6])
knn_accuracy <-  sum(diag(confusion_martix)) / nrow(service_test)

print(confusion_martix)
print(knn_accuracy)

# Confusion Matrix using Caret package
conf_matrix_caret <- confusionMatrix(data = predicted_by_kNN, service_test$Service)
print(conf_matrix_caret)
