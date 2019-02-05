# SECTION 1: 
# Author:Wilmari Theron
# Date:2 Feb 2019


#load libraries
library(tidyverse)
library(ggpubr)

# /Make use of the rast_feb and rast_aug dataset:
#load data
load("data/rast_aug.RData")
load("data/rast_feb.RData")

# Explore the dataset - head;shows first 6 lines of data
#                     - tail;shows last 6 lines of data
# glimpse - lists the variables in dataframe by name, tells you what sorts of data are
#   contained in each variable (e.g., continuous number, discrete factor) and provides an indication of the actual
#   contents of each. etc) 

head(rast_feb)
tail(rast_feb)
glimpse(rast_feb)

head(rast_aug)
tail(rast_aug)
glimpse(rast_aug)

#assign new name; easier/ faster to insert into code  -delete original dataframe
aug <- rast_aug
rm(rast_aug)
feb <- rast_feb
rm(rast_feb)

# Create a map by making use of the lat and long variables; map1
# lat always y; long always x
#

map1 <- ggplot(feb, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "dark green") + #type of graph
  labs( x = "Longitude", y = "Latitude") +  #labels
  ggtitle("Map showing the Lat and Long variables") # add title
map1
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# Create a colour pallete
# the blue part code is the names/code of the colour

col1 <- c("blue") #create new set

map2 <- ggplot(feb, aes(x = lon, y = lat)) +
  geom_polygon(aes(c)) +
  labs( x = "Longitude", y = "Latitude") +
  ggtitle("Map showing the Lat and Long variables")

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# Add the name of the oceans (Atlanic and indian ocean) on the map, increase the size of the labels
map1 <- ggplot(feb, aes(x = lon, y = lat)) +
  geom_raster(colour = "black", fill = "black") +
  labs( x = "Longitude", y = "Latitude") +
  ggtitle("Map showing the Lat and Long variables") +
  annotate("text", label = "Atlantic\nOcean",
         x = 17.0, y = -34.0,  #location
         size = 6.0,   
         angle = 0,
         colour = "dark green") +
  annotate("text", label = "Indian\nOcean",
           x = 31.2, y = -32.5,
           size = 6.0,
           angle = 0,
           colour = "blue")
map1 #test map

# North arrow and scale bar: load ggmap and ggsn
library(ggsn) #responsible for scalebar
library(ggmap)

 map1.1 <- map1 +
  scalebar(x.min = 26, x.max = 36, y.min = -34.5, y.max = -35, # Set location of bar
           dist = 200, height = 1, st.dist = 0.8, st.size = 4, # Set particulars
           dd2km = TRUE, model = "WGS84") + # Set appearance
  north(x.min = 32.5, x.max = 35.5, y.min = -33, y.max = -31, # Set location of symbol
        scale = 1.2, symbol = 16)
map1.1

# Insetting
#load Africa map; then delete original wit 'rm'
load("data/africa_map.RData")
afmap <- africa_map
rm(africa_map)

map1.2 <- map1.1 +
 annotation_custom(grob = ggplotGrob(afmap),
                    xmin = 30.9, xmax = 36,
                    ymin = -31, ymax = -26)
map1.2

map1 #map+labels
map1.1 #map1.1 +scalebar and North arrow
map1.2 #map 1.2 +inset map
