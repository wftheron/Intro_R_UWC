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
ggplot(car, aes( x = speed, y = dist)) +
  geom_point(aes(colour = dist)) +
  geom_smooth(method = "lm") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Speed and Stopping Distances of Cars") 


#PHONES
phones <- datasets::WorldPhones
??phones
ggplot(phones, aes( x = phones, y = ))
