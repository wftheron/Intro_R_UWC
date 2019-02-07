# Revision Attempt ; Eggs
# Wilmari Theron
# 7 feb 2019

# load libraries
library(tidyverse)
library(ggpubr)
library(ggplot2)
library(lubridate)
library(scales)

#load data
egg <- read_csv("data/YearlyEggBreadths.csv") 

eggtidy <- read_delim("~/Intro_R_UWC/YearlyEggBreadths.csv", 
                                  ";", escape_double = FALSE, trim_ws = TRUE)
rm(egg) # remove egg dataframe

eggtidy_avg <- eggtidy %>% 
  select(Months, AveragesMinBreadth1, AveragesMinBreadth2) %>% 
  group_by(Months) %>% 
  na.omit()

egg_line <- ggplot(eggtidy_avg, aes(x = Months, y = AveragesMinBreadth1)) +
  geom_point() +
  geom_line()

mont <- c( January, February, March, April, May, June, July, August, September, October, November, December)
