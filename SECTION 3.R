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


# Work through the tidyverse section within the document. Show what you have done by creating 
# comments/ notes throughout the script - from tidy to tidiest

library(tidyverse) # load library; make sure all are loaded that you will need

load("data/SACTN_mangled.RData") # load data; already R 
# Some info on SACTN- TIDY DATA
# SITE: diff sites where the temp was collected; along coast,
# either UnderwaterTempRecorder or Thermometer
# know nothing of temp data; how reliable; depth vary of where temp was taken;
# source = divided amongst DEA, Weather Service, Universities, Australia etc.

# make sure library is installed to run ggplot; 
# geom_line- linegraph, aes- change basic function; colour by site to easily differentiate
# why paste(site and src) = group by more than one variable= paste0, function lets you do this
# Site and Source, creating one group where all PN sites are grouped together
ggplot(data = SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) + #color differs absed on site; data grouped acc to site and source
  labs(x = "", y = "Temperature (°C)", colour = "Site") +
  theme_bw()

# GATHERING; shoves columns together to make tidier
# SACTN2- NOT TIDY
# new dataset? assign a name
SACTN2_TIDY <- SACTN2 %>% 
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp")
# gather(the columns' names you want to merge together separated by commas = "src")

# SPREADING
# HAS VALUE AND VARIABLE COLUMNS; variable being depth and value being the actual depth;
# therefore create column with "depth" as heading or "key" with values in rows
SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val)
# source= who collected temp.

# SEPARATE
# possible Q? plot using site, but has info with site along with source,
# separates info in one column
SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/ ")  # sep = separated by

# UNITE 

SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-")

# JOINING

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)
# LEFT JOIN FUNCTION; FOUND WITHIN TIDYVERSE
# autom detects similar words, R detects similar variables under same columns
# when you have four different datasheets, want to combine full set

# TIDIER DATA

# BEEN GIVEN A DATASET, NEED TO CLEAN UP
# filter- pulls out certain point in datasets
# summary( )is a function 
# DATA- is tidy; own cells, columns

# Load the data;.RData file; only load as it is a R file not csv
load("data/SACTNmonthly_v4.0.RData")

# Assign a shorter name
SACTN <- SACTNmonthly_v4.0

# Remove the original
rm(SACTNmonthly_v4.0)

SACTN %>%
  filter(site == "Amanzimtoti")
# "in this dataset extract from the site column, Amanzimtoti"
# ERROR? not find function? - rerun libraries

# Find all temperatures recorded at Pollock Beach during December OR January.
SACTN %>%
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1)
# straight line symbol is'or'
# Select the dataset SACTN, and then, extract the site column to only Pollock Beach site, select month within the date column, either the 12th or first month
# Lubridate package enables you to use "month","day" or "year" even if it's not in that format

# ARRANGE; arranges from lowest to highest

SACTN %>%
  arrange(depth, temp)
# LOOK at data and arrange this and that column frmm the lowest to the highest val
# highest to lowest?
SACTN %>%
  arrange(desc(temp))

# filter obs
SACTN %>%
  filter(site == "Humewood", year(date) == 1990)
# filter site column, only Humewood, filter date column yearly for 1990
#try different year?
SACTN %>%
  filter(site == "Humewood", year(date) == 1996)

# SELECT VARIABLES (COLUMNS)
# Select columns individually; by name
TRY1 <- SACTN %>%
  select(site, src, date, temp)

# Select all columns between site and temp like a sequence
# : Indicates range
TRY2 <- SACTN %>%
  select(site:temp)

# Select all columns except those stated individually
# put - inside brackets "subtract this column/ remove from OG"
TRY3 <- SACTN %>%
  select(-date, -depth)

# Select all columns except those within a given sequence
# Note that the '-' goes outside of a new set of brackets
# that are wrapped around the sequence of columns to remove
# EXCLUDE RANGE
TRY4 <- SACTN %>%
  select(-(date:depth))

# CREATE NEW VARIABLES
TRY5 <- SACTN %>%
  mutate(kelvin = temp + 273.15)
# Mutate creates new column; specifiy dataset, look within SACTN; pipe function used in code "and then"
# new column; gets 2 brackets, identify/ specify name of new column we mutate(here it is kelvin)
# kelvin? temp is saved as degrees Celsius; want to convert 

#HOW WOULD YOU REARRANGE COLUMNS where temp C is next to temp K?
#use select function and put it in the order- select(......C, K.)

# SUMMARISE;
# opens option to use basic functions
# calc mean, std dev, avg ect
SACTN %>%              # specify dataset
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE)
  )
# How do we use it?
# 1. give name to columns you want - ""
# 2. large dataset= na values; therefore, remove (.rm) = TRUE
#   NA AFFECTS THE OUTCOME, THEREFORE REMOVE



# Summary() vs
# Sumarise - used to get mean, med, std dev, name column

#TIDIEST

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

