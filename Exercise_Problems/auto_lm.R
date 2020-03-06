library(ggplot2)

auto_data <- read.csv('data/Auto.csv')
View(auto_data)
summary(auto_data)
auto_lm = lm(auto_data$mpg ~ auto_data$weight)
summary(auto_lm)
pearson_corr <- cor.test(auto_data$mpg, auto_data$weight, method = "pearson")
ggplot(auto_data, aes(x = auto_data$mpg, y = auto_data$weight)) +
  geom_point() +
  geom_smooth(method='lm') +
  labs(x="Miles per Gallon", y="Weight of Car (lbs)") + 
  annotate("text", x=40, y=5000, label=pearson_corr$estimate)

summary(auto_lm)
