# DAY4
# Chapter 10 
# Author:Wilmari Theron
# Date:1 Feb 2019

library(tidyverse)
load("data/SACTN_mangled.RData")

# Some info on SACTN- TIDY DATA
# SITE: diff sites where the temp was collected; along coast,
# either UnderwaterTempRecorder or Thermometer
# know nothing of temp data; how reliable; depth vary of where temp was taken;
#source = divided amongst DEA, Weather Service, Universities, Australia etc.

#TIDY DATA IS LONGER THAN IT IS WIDE

ggplot(data = SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "Date", y = "Temperature") +
  ggtitle("Date and Temperature of SACTN")
# why paste(site and src)
# geom_line- linegraph, aes- change basic function; colour by site to easily differentiate
# group by more than one variable= paste0, function lets you do this
# Site and Source, creating one group where all PN sites are grouped together

# GATHERING
# SACTN2- NOT TIDY
# new dataset? assign a name
SACTN2_TIDY <- SACTN2 %>% 
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp")

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
  separate(col = index, into = c("site", "src"), sep = "/ ")

# UNITE 

SACTN4b_tidy <- SACTN4b %>%
unite(year, month, day, col = "date", sep = "-")

# JOINING

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)
# LEFT JOIN FUNCTION; FOUND WITHIN TIDYVERSE
# autom detects similar words, R detects similar variables under same columns
# when you have four different datasheets, want to combine full set