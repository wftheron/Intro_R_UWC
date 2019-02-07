# #EXERCISE 1: SELECT 3 DATASETS, 2 GRAPHS EACH
# Author:Wilmari Theron
# Date: 30 Jan 2019
# #Calculate the mean of 1 column of each dataset
# #remember: R = Plotting with a purpose, have hypothesis

library(tidyverse)

#CARS
#assigning and getting background info
car <- datasets::cars
??cars
#Hypothesis:Does the Stopping Distance (fft) increase with the cars' Speed (mph)
xplot_1 <- ggplot(car, aes( x = speed, y = dist)) +
  geom_point(aes(colour = dist)) +
  geom_smooth(method = "lm") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Speed and Stopping Distances of Cars") 

xplot_1    #view plot

#FLOWERS
#assigning and getting background info
Iris<- datasets::iris
#?? for help function
??iris
#Which species of Iris has the longests Sepal Lengths?
 
xplot_2 <- ggplot(Iris, aes( x = Sepal.Length, y = Species)) +
  geom_point(aes(colour = Species)) +
  labs( x = "Sepal Length", y = "Species)") +
  ggtitle("Sepal Lengths of different Iris Species") 
xplot_2

#Which of the Iris species has the longest Sepal Length and Width in cm")
xplot_3 <- ggplot(iris, aes( x = Sepal.Length, y = Sepal.Width, colour = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs( x = "Sepal Length (cm)", y = "Sepal Width (cm)" ) +
  ggtitle("Sepal Length and Width in cm for different Iris Species")

#viewplot  
xplot_3

# average waiting time  between erruption in relation to the duration of the erruption of the Old Faithful in YellowstonePark
faith <- datasets::faithful
??faithful  
xplot_4 <- ggplot(faith, aes( x = waiting, y = eruptions) +
                    geom_point()
  
  
  xplot_4#Laminaria
lam <- read_csv("data/laminaria.csv")
