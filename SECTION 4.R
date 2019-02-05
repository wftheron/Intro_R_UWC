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
car %>% summarise(mean_s = mean(speed),
                var_s = var(speed, na.rm = TRUE), # Calculate variance
                min_sr = min(speed, na.rm = TRUE),
                max_s = max(speed, na.rm = TRUE),
                med_s = median(speed, na.rm = TRUE),
                mean_di = mean(dist),
                var_di = var(dist, na.rm = TRUE), # Calculate variance
                min_di = min(dist, na.rm = TRUE),
                max_di = max(dist, na.rm = TRUE),
                med_di = median(dist, na.rm = TRUE))

plot_1 <- ggplot(car, aes( x = speed, y = dist)) +
  geom_point(aes(colour = speed)) +
  geom_bar(stat="identity",aes(fill = dist), position = "dodge") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Stopping Distance of Cars in relation to their Speed") 
plot_1 #test plot

plot_2 <- ggplot(car, aes( x = speed, y = dist)) +
   geom_jitter(color= "green") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Stopping Distance of Cars in relation to their Speed") 
plot_2         #test plot; a lot like a regular geom_point

plot_3 <- ggplot(car, aes( x = speed, y = dist)) +
  geom_density2d(color= "dark green") +
  labs( x = "Speed (mph)", y = "Stopping Distance (fft)") +
  ggtitle("Stopping Distance of Cars in relation to their Speed")
plot_3

ora <- datasets::Orange
??Orange #The Orange data frame has 35 rows and 3 columns of records of the growth of orange trees
# Tree = an ordered factor indicating the tree on which the measurement is made.
 # age = days since 1968/12/31
 # circumference = mm;
map_O <- ggplot(ora, aes(x = age, y = circumference, color = Tree)) +
  geom_jitter() +
  geom_line() +
  labs( x = "Age", y = "Circumference (mm)") +
  ggtitle("Records of Orange trees growth") 
map_O    #test plot
