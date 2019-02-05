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
# EWxtract all from src = KZNSB
SACTN_sep <- SACTNmonthly_v4.0

SACTN_year <- SACTN_sep %>% 
  filter(src == "KZNSB") %>% 
  separate(col = date, into = c("year", "month", "day"), sep = "-") %>% # sep = separated by
  group_by(site, year) %>%         #grouping - 
  summarise(mean_temp = mean(temp, na.rm = TRUE))
SACTN_year                  
# Make plot

KZNSB_map <- ggplot(SACTN_year, aes(x = year, y = mean_temp)) +
  geom_line(aes(group = site), color = "darkgreen") +
  facet_wrap(~site, ncol=5) +
  ggtitle("KZNSB: series of annual means") +
  labs(x = "Year", y = "Temperature(°C)") +
  scale_x_discrete(breaks = c("1980", "2000")) +
  scale_y_continuous(breaks = c(20, 22,24))


  


