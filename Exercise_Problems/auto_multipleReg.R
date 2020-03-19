library(ggplot2)

auto_data <-  read.csv('data/auto_mpg.csv')
plot(auto_data, main="Pairwise Plots", col='red', alpha=0.2)
round(cor(auto_data), 3)
# Model Building
auto_lm <- lm(mpg~., data = auto_data) # Regress with all the variables
auto_lm_significant <- lm(mpg~weight+model_year, data = auto_data)
auto_lm_without_disp_acc <- lm(mpg~cylinders+horsepower+weight+model_year, data = auto_data)
summary(auto_lm_significant)
summary(auto_lm_without_disp_acc)
summary(auto_lm)
summary(auto_data)
