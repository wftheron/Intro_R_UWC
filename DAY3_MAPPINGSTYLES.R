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
#all maps need scale bar; without=invalid & rejected


sa_3 <- sa_2 +
  scalebar(x.min = 32, x.max = 26, y.min = -36, y.max = -35,          # Set location of bar
           dist = 200, height = 1, st.dist = 0.8, st.size = 4,        # Set particulars
           dd2km = TRUE, model = "WGS84") +                           # Set appearance
  north(x.min = 22.5, x.max = 25.5, y.min = -33, y.max = -31,         # Set location of symbol
        scale = 1.2, symbol = 16)
sa_3
# can change coordinates of scale &labels &northarrow, shifts up down under etc.

#INSETTING
sa_4 <- sa_3 +
  annotation_custom(grob = ggplotGrob(africa_map),
                    xmin = 5.9, xmax = 26.9,
                    ymin = -30, ymax = -24)
sa_4



