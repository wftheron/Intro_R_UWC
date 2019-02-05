# SECTION 4:
# Author:Wilmari Theron
# Date:2 Feb 2019

# Make use of any two built in datasets:
# Make use of the summarise, select, group_by functions
# Create at least two visualisations that were not done in the Intro R workshop
library(tidyverse)
library(ggpubr)
library(ggplot2)

# CARS : The data gives the speed of cars and the distances taken to stop
# assigning and getting background info
car <- datasets::cars
??cars

plot_1 <- ggplot(car, aes( x = speed, y = dist)) +
  geom_point(aes(colour = speed)) +
  geom_bar(stat="identity",aes(fill = dist), position = "dodge") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Stopping Distance of Cars in relation to their Speed") 




#FLOWERS
#assigning and getting background info
Iris<- datasets::iris
#?? = Help/info
??iris
#Which species of Iris has the longests Sepal Lengths?
# not box= non-numeric argument
plot_2 <- ggplot(Iris, aes( x = Sepal.Length, y = Species)) +
  geom_point(aes(colour = Species)) +
  geom_boxplot()
  labs( x = "Sepal Length", y = "Species)") +
  ggtitle("Sepal Lengths of different Iris Species") 
  




#Which of the Iris species has the longest Sepal Length and Width in cm")
xplot_3 <- ggplot(iris, aes( x = Sepal.Length, y = Sepal.Width, colour = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs( x = "Sepal Length (cm)", y = "Sepal Width (cm)" ) +
  ggtitle("Sepal Length and Width in cm for different Iris Species")