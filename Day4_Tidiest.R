# DAY4
# TIDIEST; Ch12
# Author:Wilmari Theron
# Date:1 Feb 2019

#load libraries
library(tidyverse)

# Load the data;.RData file; only load as it is a R file not csv
load("data/SACTNmonthly_v4.0.RData")
# Assign a shorter name
SACTN <- SACTNmonthly_v4.0
# Remove the original
rm(SACTNmonthly_v4.0)

# GROUP - Group by depth
# Calculate mean temperature by depth
SACTN_depth_mean <- SACTN %>%
  group_by(depth) %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n())
SACTN_depth_mean

ggplot(data = SACTN_depth_mean, mapping = aes(x = depth, y = mean_temp)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE) +
  ggtitle("Mean temperature in relation to Depth") +
  labs( x = "Depth (m)", y = "Mean Temperature (Celsius)")

SACTN_30_years <- SACTN %>%
  group_by(site, src) %>%
  filter(n() > 360)  # group by same site and source, and then selecting the data greater that 30 years

# GOING DEEPER
# First create a character vector containing the desired sites
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")
# Then calculate the statistics
SACTN %>%
  filter(site %in% selected_sites) %>%  #filter sites in "selected sites"- set which was just created
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))
#EXPL: one site; filter(site == "Port Nolloth"
    # Many sites; not repeat code= inefficient
    #"Paternoster", "Oudekraal", "Muizenberg", "Humewood" - create set with (c)- concacinate
    # why summarise? need mean and standard dev.
