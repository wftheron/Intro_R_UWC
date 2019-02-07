#Day 1
#Laminaria dataset_exploring and learning
#Wilmari Theron
#29 jan 2019

#loading libraries
library(tidyverse)
lam <- read_csv("data/laminaria.csv")
head(lam) #shows the first six rows
tail(lam) #shows the last six rows
head(lam, n = 3)
lam_select <- lam %>%
  select(site, total_length) %>% 
  slice(54:80)
view(lam)
lam_kom <- lam %>% 
  filter(site == "Kommetjie")
view(lam_kom)
#in the laminaria dataset, select only site and blade length column
#filter only for seapoint
lam_try <- lam %>% 
  select(site, blade_length) %>% 
  filter(site == "Sea Point")
view(lam_try)

lam %>% 
  filter(total_length == max(total_length))

summary(lam)

lam %>% 
  summarise(avrg_bl = mean(blade_length),
            med_bl = median(blade_length),
            sd_bl = sd(blade_length))

#now for the standard error
#select lam data and group by site,
#then summarise blade length of those sites
lam %>% 
  group_by(site) %>% 
  summarise(var_bl = var(blade_length),
            n = n()) %>% 
  mutate(se = sqrt(var_bl/n))

#remove columnns?
lam_2 <- lam %>% 
  select(-blade_thickness, -blade_length)

#select lam dataset and then select only stipe mass, then tell me how many entries you have for stipe mass

lam %>% 
  select(blade_length) %>% 
  na.omit %>% 
  summarise(n = n())
lam %>% 
  select(blade_length) %>% 
  summarise(n = n())
#na omit so hat your stats arent based on absense of data

#make plots and graphs
ggplot(data = lam, aes(x = stipe_mass, y = stipe_length)) + 
  geom_point(shape = 21, colour = "orange", fill = "green") + 
  labs(x = "Stipe mass (kg)", y = "stipe length (cm)")

# Exercise: 

# 1. Create a new data frame from the `laminaria` dataset that meets the following criteria: contains 
#only the `site` column and a new column (mutate) called `total_length_half` containing values that are half of the `total_length`. In this `total_length_half` column, there are no `NA`s and all values are less than 100.
# **Hint**: think about how the commands should be ordered to produce this data frame!
lam_new <- lam %>% 
  mutate(lam_new = total_length / 2) %>% 
  filter(lam_new < 100) %>% 
  select(site, lam_new)
#not working_check please

#   2. Use `group_by()` and `summarize()` to find the mean, min, and max blade_length for each site. Also add the number of observations (hint: see `?n`).
lam %>% 
  group_by(site) %>% 
  summarise(avrg_bl = mean(blade_length),
            min_bl = min(blade_length),
            max_bl = max(blade_length),
            n = n())
#creates three lines, three columns
#not use %>% , use same function

#. What was the heaviest stipe measured in each site? Return the columns `site`, 
#`region`, and `stipe_length`.
lam_new1 <- lam %>% 
  group_by(site, region, stipe_length) %>% 
  summarise(heaviest_stipe = max(stipe_mass))
 
#the way it shouldve been done
# #3; lam %>% 
#     group_by(site) %>% 
#     filter(stipe_mass ==mas(stipe_mass)) %>% 
#     select(site, region, stipe_length)