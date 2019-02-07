# DAY2
# Plotting in R using ggplot2
# Author:Wilmari Theron
# Date:30 Jan 2019

#load library
library(tidyverse)

chicks <- datasets::ChickWeight
??ChickWeight
#?? for help function
#first line= parent line, rest, 'kid'
ggplot(data = chicks, aes(x = Time, y = weight)) +
  geom_point() +
  geom_line(aes(group = Chick))
#geom=what the plots are called with uderscore histogram, scatter etc


ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick))
# make sure of plus function; not pipe
#   all brackets are closed
  #plot is not very efficient soooooo
ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm")
#geomsmooth creates smooth line
#'lm'= linear Model to reflect the most effective diet; has same input as previous
#DIFFERENT GRAPH TYPE - Diet 3 is most effective, starrts at bottom and finishes on top


ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point(colour = "blue") +
  geom_line(aes(group = Chick))

ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm")
#dataset; aesthetics(axis) controlling the ouput;
#+ not %>% 
#geom point bc of point, vary in size based on weight column
#lm; easiest to see. asked ggplot to plot specifiy x/y ; used geom; 
#control the size of the point by looking at the weight column
#aes function inside? need to add function; to plot in R

#NOW TO ADD LABELS; Days instead of time, Kg instead of Weight
#'labs' = labels, why the labels is put into ""
ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm") +
  labs( x = "Days", y = "Weight (kg)") +
  ggtitle("Port Nolloth") +
  theme_bw()


#EXERCISE; LOAD LAM DATA, CREATE ANY PLOT
lam <- read_csv("data/laminaria.csv")
ggplot(lam, aes ( x = site, y = blade_length)) +
  geom_point() 

# FACETTING IN ggplot
#to show multiple things in/on same graph
# need new library- 
library(ggpubr)

ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~Diet, nrow = 4)
#same initial code, then separate
#~tilde; ncol = number of colums or you can specifiy nrow = number of rows
#facet: separating figures but wrapping it in the same plot

chicks_2 <- chicks %>% 
  filter(Time == 21)
#create new data frame with only info on time 21

plot_1 <- ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
  labs( x = "Days", y = "Weight" ) +
  ggtitle("A") 
        #PLOTS SAVED IN ENVR; DOES NOT OPEN AUTOM
    #EITHER TYPE NAME UNDERNEATH WITH CTRL ENTER, THEN AFTER CLICK ON PLOT NAME IN SOURCE EDITOR = OPEN

plot_2 <- ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs( x = "Days", y = "Weight" ) +
  ggtitle("B")   
plot_2

plot_3 <- ggplot(data = chicks_2, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +
  labs( x = "Final Mass (g)", y = "Count")
plot_3
#position - ; dodge- , places histogram next to eachother, not ontop/below of each other

plot_4 <- ggplot(data = chicks_2, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
plot_4
 #geom_smooth= best fit, whereas geom_line fits the points

plot_combined <- ggarrange(plot_1, plot_2, plot_3, plot_4)

##THIRD LIBRARY
#assign name to dataset to put into environment
library(boot)
urine <- boot::urine
??urine

urine %>% 
  select( -cond)

ggplot(data = urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = cond))

ggplot(data = urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r)))

#EXERCISE 1: SELECT 3 DATASETS, 2 GRAPHS EACH
#Calculate the mean of 1 column of each dataset
#remember: R = Plotting with a purpose, have hypothesis
car <- datasets::cars
