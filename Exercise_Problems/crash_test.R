library(ggplot2)
crash_data = read.csv('data/crashTest_1.csv')
summary(crash_data)
str(crash_data)
ggplot(crash_data, aes(x=crash_data$CarType, y=crash_data$Safety)) + 
  geom_point()