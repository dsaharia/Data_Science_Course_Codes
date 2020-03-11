library(tidyverse)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  labs(title="Engine Size Vs Efficiency", x ="Displacement (in L)", y = "Fuel Efficiency")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl)) +
  labs(title="", x ="Displacement (in L)", y = "Fuel Efficiency")
