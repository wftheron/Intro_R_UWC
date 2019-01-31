#convert .csv to .r data
library(tidyverse)
library(scales)
library(ggsn)

#EXERCISE; 
lam <- read_csv("data/laminaria.csv")

laminaria <- read_csv("data/laminaria.csv")


# write 5 lines discussing the library ggsn and the library scale
# #There is no default scale bar function in the
# tidyverse, which is why we have loaded the ggsn package. This package is devoted to adding scale bars
# and North arrows to ggplot2 figures.
# ##know how to read code.
