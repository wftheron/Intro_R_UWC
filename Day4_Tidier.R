# DAY4
# TIDIER; Ch11
# Author:Wilmari Theron
# Date:1 Feb 2019

# First - LOAD LIBRARIES
library(tidyverse)
library(lubridate)

# # BEEN GIVEN A DATASET, NEED TO CLEAN UP
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