# DAY3
# Mapping STYLE
# Author:Wilmari Theron
# Date:31 Jan 2019
library(tidyverse)
library(scales)
library(ggsn)

#load Africa map
load("data/africa_map.RData")
ggplot() +
  borders() + # The global shape file
  coord_equal() # Equal sizing for lon/lat

sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent
sa_1
#c=coordinates to be included

sa_2 <- sa_1 +
  annotate("text", label = "Atlantic\nOcean",
           x = 15.1, y = -32.0,
           size = 5.0,
           angle = 30,
           colour = "navy") +
  annotate("text", label = "Indian\nOcean",
           x = 33.2, y = -34.2,
           size = 5.0,
           angle = 360,
           colour = "orange2")
sa_2
#the "\n" indicates a space

