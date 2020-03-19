library(ggplot2)
library(caret)

crash_data_train <-  read.csv('data/crashTest_1.csv', row.names = 1)
crash_data_test <-  read.csv('data/crashTest_1_TEST.csv', row.names = 1)

# Build a general logistic regression model
crash_model <- glm(formula = crash_data_train$CarType~., family = 'binomial', data = crash_data_train)
# Find the odds
logis_train <- predict(crash_model, type = 'response')
probabilities <- tapply(logis_train, crash_data_train$CarType, mean)
logis_pred <- predict(crash_model,
                      newdata = crash_data_test,
                      type = 'response')

# Inserting values in the Test dataset
crash_data_test[logis_pred <= 0.5, "logis_pred"] <- "Hatchback"
crash_data_test[logis_pred > 0.5, "logis_pred"] <- "SUV"
confusionMatrix(table(crash_data_test[,7], crash_data_test[,6]),
                positive = 'Hatchback')

# ggplot(data = crash_data_train, mapping = aes(x = CarType, y = HVACi)) +
#  geom_point(aes(color = CarType))
