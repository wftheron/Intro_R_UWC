# Homework 2: 
# Author:Wilmari Theron
# Date:5 Feb 2019

#load library
library(tidyverse)
library(ggpubr)
library(ggplot2)
library(lubridate)
library(scales)

# Load dataframe - alread .R format therefore just load
load("data/SACTNmonthly_v4.0.RData")

# Separate date column = to get year on it's own
<<<<<<< HEAD
# Extract all from src = KZNSB
SACTN_sep <- SACTNmonthly_v4.0

#rename dataset used now
# Extract only KZNSB source data
# separate date column in order to see years
# group_by year and site as those are the conscerned variables
# Summarise- need to work with mean temp; assign new name first
=======
# EWxtract all from src = KZNSB
SACTN_sep <- SACTNmonthly_v4.0

>>>>>>> bf91ca53eef151f72646bb58cc56ce9a02c7fec1
SACTN_year <- SACTN_sep %>% 
  filter(src == "KZNSB") %>% 
  separate(col = date, into = c("year", "month", "day"), sep = "-") %>% # sep = separated by
  group_by(site, year) %>%         #grouping - 
  summarise(mean_temp = mean(temp, na.rm = TRUE))
<<<<<<< HEAD
SACTN_year   # Test plot               
# Make plot

# make maps now - not pipe, but plus
# check if ggplot2 is loaded as a library
# geom_line - basics, site as that's NB
# facet_wrap - insert diff figures to make a grid ;ncol - number of columns
# remember to add title(ggtitle) and labels (labs(x="",y = ""))
# adjust scales? Discrete data can take on only integer values 
# whereas continuous data can take on any value
KZNSB_map <- ggplot(SACTN_year, aes(x = year, y = mean_temp)) +
  geom_line(aes(group = site), color = "darkorange") +
=======
SACTN_year                  
# Make plot

KZNSB_map <- ggplot(SACTN_year, aes(x = year, y = mean_temp)) +
  geom_line(aes(group = site), color = "darkgreen") +
>>>>>>> bf91ca53eef151f72646bb58cc56ce9a02c7fec1
  facet_wrap(~site, ncol=5) +
  ggtitle("KZNSB: series of annual means") +
  labs(x = "Year", y = "Temperature(°C)") +
  scale_x_discrete(breaks = c("1980", "2000")) +
  scale_y_continuous(breaks = c(20, 22,24))


<<<<<<< HEAD

# 2 LAMINARIA

# Load dataset - .csv and assign a new name; shorthand
# filter by region - constrict data to info from FalseBay
# select - only columns needed
lam <- read_csv("data/laminaria.csv")
FBdata <- lam %>% 
  filter(region == "FB") %>% 
  select(region, site, blade_weight, blade_length)

FBplot1 <- ggplot(FBdata, aes(x = blade_length, y = blade_weight)) +
  geom_point() +
  geom_line(aes(group = site)) +
  facet_wrap(~site, ncol=3) +
  scale_colour_brewer(palette = "Accent")  +
  labs(x = "Blade length(cm)", y = "Blade mass(kg)") +
  ggtitle("A crazy graph of some data for False Bay sites")
FBplot1 # test plot
  
#great - what about Roman's Rock data? issue shoul be color palette,
# my data is showing up - not sure why, something with colour somewhere;
# continuing as if the Romansrock data isn't showing'

FBplot2 <- ggplot(FBdata, aes(x = blade_length, y = blade_weight, colour= site)) +
  geom_point() +
  geom_line(aes(group = site)) +
  facet_wrap(~site, ncol=3) +
  labs(x = "Blade length(cm)", y = "Blade mass(kg)") +
  ggtitle("A crazy graph of some data for False Bay sites")
FBplot2 #Make plot

#combine plots

FBarr <- ggarrange(FBplot1, FBplot2,
          ncol = 2, # Set number of rows and columns
          labels = c("A", "B"), # Label each figure
          common.legend = TRUE)
FBarr #test plot

# 3 Toothgrowth Data
# load data; check for info
tooth <- datasets::ToothGrowth
??Toothgrowth

tplot <- ggplot(tooth, aes(x = dose, y = len, group = supp, colour, fill = "black")) +
  geom_bar(position = "identity
  
  tplot
=======
  
>>>>>>> bf91ca53eef151f72646bb58cc56ce9a02c7fec1


