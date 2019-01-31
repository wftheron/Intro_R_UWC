# DAY3
# Mapping with google
# Author:Wilmari Theron
# Date:31 Jan 2019

library(tidyverse)
library(scales)
library(ggsn)

#load data
load("data/cape_point_sites.RData")
cape_point <- get_map(location = c(lon = 18.36519, lat = -34.2352581),
                      zoom = 10, maptype = 'satellite')
#gets info from google maps satellite; they change their extensions
# load("data/cape_point.RData")
cp_1 <- ggmap(cape_point) +
  geom_point(data = cape_point_sites, aes(x = lon+0.002, y = lat-0.007),
             colour = "red", size = 2.5) +
  labs(x = "", y = "")
cp_1
#geom_text; adds labels to point on graph
