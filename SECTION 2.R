# SECTION 2: 
# Author:Wilmari Theron
# Date:2 Feb 2019

# Make use of the ecklonia.csv dataset:
# Explore the data (Hint* head, tail, glimpse functions)
# Demonstrate the dimensions of the dataset
# Create three graphs; bargraph, line graph and boxplot: Write hypothesis for each of the graphs and answer these hypotheses
# Make use of the ggarrange function and arrange these three graphs created above into 1 plot
# All graphs must have labels as well as titles
# Calculate the mean,max,min,median and variance for the stipe_length, stipe_diameter for each of the sites (Hint* group_by site)
# Calculate standard error- DAY 1
# Determine the min and maximum frond length and stipe length
# Determine the overall summary of the dataset
#please

# load library
library(tidyverse)
library(ggpubr)
library(ggplot2)

# dataset?
eck <- read_csv("data/ecklonia.csv")
head(eck)
tail(eck)
glimpse(eck)

# Demonstrate the dimensions? -columns, rows
dim(eck)

# Create three graphs; bargraph, line graph and boxplot: Write hypothesis for each 
# of the graphs and answer these hypotheses

# BARGRAPH;"Does the stipe length of Ecklonia Maxima differ significantly between sites? 
# How so?"

mapA <- ggplot(eck, aes(x = ID, y = stipe_length)) +
  geom_bar(stat="identity",aes(fill = site), position = "dodge") +
  labs(x = "Sample ID", y = "Stipe Length") +
  ggtitle("Stipe length of samples taken from two different Sites")

#position - ; dodge- , places histogram next to eachother, not ontop/below of each ot

rm(plotA)  #renamed plotA to Map A, remove Plot A
mapA #test map

# The stipe length differs between the two sites; Batsata Rock's ecklonia maxima genrally has 
# a longer stipe length than those at Bouders Beach

#LINEGRAPH; "Does the Frond mass and length of ecklonia maxima differ significantly based on site- where it grows?
# How so?"

mapB <- ggplot(data = eck, aes( x = frond_length, y = frond_mass, colour = site)) +
  geom_point() +
  geom_line() +
  labs( x = "Frond Length", y = "Frond Mass" ) +
  ggtitle("Frond mass and length of ecklonia maxima at two different sites") 
mapB  #test map

# Map B shows that the frond length and mass of the ecklonia maxima at Boulders beach is significantly 
# smaller/ lower than that of the ecklonia that grows at Batsata rock

#BOXPLOT; "Is there any significant difference in the stipes of ecklonia maxima between sites?
# How so?"

box_1 <- ggplot(eck, aes(x = stipe_mass, y = stipe_diameter)) +
  geom_boxplot(aes(fill = site)) +
  labs(x = "Stipe Mass", y = "Stipe Diameter") +
  ggtitle("Boxplot showing Stipe Diameter in relation to Stipe Mass for two different sites") 
box_1 # test map

# box_1 shows that Batsata Rock's kelp has a heavier stipe mass, and larger stipe 
# diameter than the kelp at Boulders Beach

# ARRANGE; ggarrange function - arrange these graphs into 1 plot

mapar1 <- ggarrange(mapA, mapB, box_1,
          ncol = 1, nrow =3, # Set number of rows and columns
          labels = c("A", "B", "C"), # Label each figure
          common.legend = TRUE)# Create common legend
mapar1 #test map

#Calculate the mean,max,min,median and variance for the stipe_length, stipe_diameter for each of the sites (Hint* group_by site)
# and STANDARD ERROR?

#STIPE LENGTH; use summarise, group by site 
eck_SL <- eck %>% # Select dataframe 'eck'
  group_by(site) %>% # Group the dataframe by site
  summarise(mean_SL = mean(stipe_length, na.rm = TRUE),
            var_SL = var(stipe_length, na.rm = TRUE), # Calculate variance
            min_SL = min(stipe_length, na.rm = TRUE),
            max_SL = max(stipe_length, na.rm = TRUE),
            med_SL = median(stipe_length, na.rm = TRUE),
            n_SL = n()) %>% # Count number of values
  mutate(se_SL = sqrt(var_SL / n_SL))# Calculate se

#STIPE DIAMETER
eck_D <- eck %>% # Select dataframe 'eck'
  group_by(site) %>% # Group the dataframe by site
  summarise(mean_D = mean(stipe_diameter, na.rm = TRUE),
            var_D = var(stipe_diameter, na.rm = TRUE), # Calculate variance
            min_D = min(stipe_diameter, na.rm = TRUE),
            max_D = max(stipe_diameter, na.rm = TRUE),
            med_D = median(stipe_diameter, na.rm = TRUE),
            n_D = n()) %>% # Count number of values
  mutate(se_D = sqrt(var_D / n_D))# Calculate se

#Determine the min and maximum frond length and stipe length
eckfrond <- eck %>%
  group_by(site) %>% 
  summarise(min_FL = min(frond_length),
            max_FL = max(frond_length))

eckstipe <- eck %>% 
  group_by(site) %>% 
  summarise(min_SL = min(stipe_length),
            max_sL = max(stipe_length))
  
# Determine the overall summary of the dataset
summary(eck) #NOT SUMMARISE



                                          