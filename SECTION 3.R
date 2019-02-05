# SECTION 3: 
# Author:Wilmari Theron
# Date:2 Feb 2019

# load library
library(tidyverse)
library(ggpubr)
library(ggplot2)

# Make use of the SACTN_day1 data:
SACTN_D1 <- read_csv("data/SACTN_day_1.csv")

# Graph showing temperature variation between sites- group by site, between sites

graph_1 <- ggplot(SACTN_D1, aes( x = date, y = temp, color = site )) +
  geom_smooth() +
  ggtitle("Graph showing temperature variation between sites") +
  labs(x = "Time", y = "Temperature")
graph_1 #test graph

# Select all the temperatures recorded at the site Port Nolloth during August or September.
# dates= load lubridate

library(lubridate)
PN_AS <- SACTN_D1 %>% 
  filter(site == "Port Nolloth", month(date) == 8 | month(date) == 9) %>% 
  select(-index, -src, -date)          # Select everything except specific columns

# Select all the monthly temperatures recorded in Port Nolloth during the year 1994

PN <- SACTN_D1 %>% 
  filter(site == "Port Nolloth", year(date) == 1994) %>% 
  select(-index, -src, -date) 

# Calculate the average temperature by depth - all in pdf
# but no depth data?
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

avgtbyd <- SACTN_D1 %>% 
  group_by()
  
# Work through the tidyverse section within the document. Show what you have done by creating comments/ notes throughout the script - from tidy to tidiest
