#EXERCISE; 
#convert .csv to .r data
library(tidyverse
library(scales)
library(ggsn)



laminaria <- read_csv("data/laminaria.csv")  #read csv
save(laminaria, file = "data/laminaria.RData")   #convert csv to R

#2 Discuss the library 'ggsn' and the library 'scale'

# There is no default scale bar function in the tidyverse package, which is 
# why we have loaded the ggsn package - This is devoted to adding scale bars in kilometres
# to maps in geographic or metric coordinates created with "ggplot2" or "ggmap"
# Included arguments:UNDEFINED DATA
#   x.min; number with min x coordinate
#   x.max; number with max X coordinate
#   (both useful for "ggmap")
#   y.min;number with min Y coordinate
#   y.max;number with max Y coordinate
  
#3 know how to read code
