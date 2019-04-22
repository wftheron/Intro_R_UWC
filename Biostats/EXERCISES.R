# Wilmari Theron
# 2019-04-20
# Exercises


# A bit of infomation about the script is always important
# This will help you with future reference and allows some infomaton to the person reading the script


#load   libraries
library(tidyverse)
library(ggpubr)
library(ggplot2)
library(RColorBrewer)
library(ggthemes)
# install.packages("rmarkdown") # Often better to put a "#" infront of this. When someone else is running you code
# they would most likely not want to install this package


# 3.6.1 Exercise 1
#Notice how the data summary for chicken weights contained within wt_summary is very similar
#to the summary returned for weight when we apply summary(chicks). Please use the summarise()
#approach and construct a data summary with exactly the same summary statistics for weight
#as that which summary() returns.

# Here you need to load in the dataset firs, See bellow
chicks <- datasets::ChickWeight # Here we load the chickweight dataset which is used below

summary(chicks)   #  to   check  what  data  is  needed

chicks %>%
  summarise(min_wt = min(weight),
            qrt1_wt = quantile(weight, p = 0.25),      # specifies 1/4   of  data
            med_wt = median(weight),     #same as quantile(weight, p = 0.5)
            qrt3_wt = median(weight, p = 0.75),     # specifies 3/4   of  data
            max_wt = max(weight))

#   XXXXX XXXXX XXXXX XXXXXXXXX XXXXX   XXXXX XXXXX XXXXX XXXXXXXXX  XXXXX   XXXXX

# 4.3.1 Exercise 1
# Choose a dataset, either one of the many built into R or one of your own, and create four
# distinctly different figures. Use ggarrange() to stitch them together in a meaningful way.

library(tidyverse)
library(ggpubr)

grp_stat <- chicks %>%         # use   dataframe   chicks
  filter(Time == 21) %>%         #  only  for    Time=21
  group_by(Diet, Time) %>%    
  summarise(mean_wt = round(mean(weight, na.rm = TRUE), 2),
            med_wt = median(weight, na.rm = TRUE),
            sd_wt = round(sd(weight, na.rm = TRUE), 2),
            sum_wt = sum(weight),
            min_wt = min(weight),
            qrt1_wt = quantile(weight, p = 0.25),
            med_wt = median(weight),
            qrt3_wt = median(weight, p = 0.75),
            max_wt = max(weight),
            n_wt = n())

library(ggpubr) # needed for arranging multi-panel plots
#Figure  1
plt1 <- chicks %>%
  filter(Time == 21) %>%        #state  which  day  it  is
  ggplot(aes(x = Diet, y = weight)) +
  geom_point(data = grp_stat, aes(x = Diet, y = mean_wt),
             col = "black", fill = "darkgreen", shape = 25, size = 4) +
  geom_jitter(width = 0.05) + # geom_point() if jitter not required
  labs(title = "Mass at day 21",y = "Chicken mass (g)") +
  theme_pubr()
plt1 -  #shows  mass   at   day   21   for  4   diets   with avg

# Figure 2: Bargraph
plt2 <- ggplot(data = grp_stat, aes(x = Diet, y = mean_wt)) +
  geom_bar(position = position_dodge(), stat = "identity",  # position_dodge() places bars side-by-side
           col = NA, fill = "orange") +          # stat = "identity" prevents default count from being plotted
  geom_errorbar(aes(ymin = mean_wt - sd_wt, ymax = mean_wt + sd_wt),
                width = .2) +
  labs(title = "Mean mass on day 21  with  error bars", y = "Chicken mass (g)") +
  theme_pubr()
plt2 - #  shows average weight on day  21 with standard error bars  for each  

# Figure 3: Boxplot
geom_boxplot()
plt3 <- chicks %>%
  filter(Time == 21) %>%
  ggplot(aes(x = Diet, y = weight)) +
  geom_boxplot(fill = "darkgreen") +
  geom_jitter(width = 0.0, fill = "green", col = "black", shape = 23) +
  labs(title = "Summary of  mass on Day 21", y = "Chicken mass (g)") +
  theme_pubr()  
plt3  - #  Boxplot   showing min,  Q1, median, Q3, max for day  21
  
# Figure  4: Boxplot
plt4 <- chicks %>%
  filter(Time %in% c(10, 21)) %>%  #specify  which   days
  ggplot(aes(x = Diet, y = weight, fill = as.factor(Time))) +
  geom_boxplot() +
  geom_jitter(shape = 21, width = 0.1) +
  labs(title = "Summary of  mass",  subtitle = "Day  10 compared to Day 21", y = "Chicken mass (g)", fill = "Time") +
  theme_pubr()
plt4
#  Boxplot   showing min,  Q1, median, Q3, max, of both day  10  and  21

#arrange   plots;  put  all   plots  together
pltarrange <- ggarrange(plt1, plt2, plt3, plt4, ncol = 2, nrow = 2, labels = "AUTO")
pltarrange
#   XXXXX XXXXX XXXXX XXXXXXXXX XXXXX   XXXXX XXXXX XXXXX XXXXXXXXX  XXXXX   XXXXX

# 5.4.1 Exercise 1
# Choose two different datasets and plot them as histograms with density curves overlayed. Label
# them with the distribution they appear to be and stitch them together with ggarrange().

library(tidyverse)
library(ggpubr)
library(corrplot)
library(dplyr)

data() # Cool way of viewig built in data

ChickLast <- ChickWeight %>%
  filter(Time==21)

histogram_1 <- ggplot(ChickLast, aes(x = weight)) + 
  geom_histogram(aes(y = ..density..), binwidth = 5) + 
  geom_density()
histogram_1 

Chick10 <- ChickWeight %>%
  filter(Time==10)
histogram_2 <- ggplot(Chick10, aes(x = weight)) + 
  geom_histogram(aes(y = ..density..), binwidth = 5) + 
  geom_density()
histogram_2

pltarrange1 <- ggarrange(histogram_1,histogram_2, ncol = 2, nrow = 2, labels = "AUTO")
pltarrange1 # These are quite basic graphs
# They do run
# It would be cool to try different colour pallets and explore R using this bit of code as a structure to build something beautiful
#   XXXXX XXXXX XXXXX XXXXXXXXX XXXXX   XXXXX XXXXX XXXXX XXXXXXXXX  XXXXX   XXXXX
library(tidyverse)
library(plotly)

# 6.7.1 Exercise 1
# Find or create your own normally distributed data and think of a hypothesis you could 
# use a  t-test for. Write out the hypothesis, test it, and write a one sentence conclusion
# for it. Provide all of the code used to accomplish this.
# random normal data - specify amount of numbers (n=); mean and standard deviation
set.seed(666)
dat_1 <- data.frame(dat = c(rnorm(n = 25, mean = 7, sd = 1),
                            rnorm(n = 25, mean = 7, sd = 1)),
                    sample = c(rep("A", 25), rep("B", 25)))
#sample created = two sampleddata:  dat by sample
#(think of a hypothesis you could use a t-test for. Write out the hypothesis)
    # H0: the mean of A= the mean of B 
    # the null hypothesis for this is "the mean of group A is equal tot hat of group B"

# test it - perform normal t-test
# data depends on grouping by sample
# NB: `var.equal` argument = TRUE ;we made the data like that in the previus step)
t.test(dat ~ sample, data = dat_1, var.equal = TRUE)
# and write a one sentence conclusion for it
# the null hypothesis is accepted; the mean of both groups are very close to 7

# 6.7.2 Exercise 2
# Do the same as Exercise 1, but for probability data.

#PROBABILITY  DATA?

#   XXXXX XXXXX XXXXX XXXXXXXXX XXXXX   XXXXX XXXXX XXXXX XXXXXXXXX  XXXXX   XXXXX

# 7.4.1 Exercise 1
# Here is bunch of data for pigs raised on different diets. The experiment is similar to the
# chicken one. Does feed type have an effect on the mass of pigs at the end of the experiment?

# enter the mass at the end of the experiment
feed_1 <- c(60.8, 59.0, 62.0, 55.8, 63.4)
feed_2 <- c(67.8, 68.5, 71.0, 64.2, 68.9)
feed_3 <- c(101.3, 103.3, 100.0, 97.2)
feed_4 <- c(86.8, 82.1, 81.0, 86.1, 91.1)
# make a dataframe  # First grab the data
bacon <- as.tibble(data.frame(
  feed = c(rep("Feed 1", length(feed_1)),
           rep("Feed 2", length(feed_2)),
           rep("Feed 3", length(feed_3)),
           rep("Feed 4", length(feed_4))),
  mass = c(feed_1, feed_2, feed_3, feed_4)))
#check  to   see   if  dataframes  were  successful
View(feed_1)
View(feed_2)
view(feed_3)
view(feed_4)

compare_means(mass ~ feed, data = bacon, method = "t.test")
#  P   value is   less   than  0.05   therefore  there is  a  significant difference
#  therefore, the   type  of   feed  does  have  an  effect on  the  mass of the  pigs.
# maybe  Bonferroni   correction  or  ANOVA?
#   ANOVA  for  pigs
bacon.aov1 <- aov(mass ~ feed, data = bacon)
summary(bacon.aov1)
#  P value   is  1.94e-11

# 7.4.2 Exercise 2
# Construct suitable null and alternative hypotheses for the built-in ToothGrowth data, and
# test your hypotheses using an ANOVA.

teeth <- datasets::ToothGrowth    #load data
?ToothGrowth  #extra  information
#   NUll hypothesis -A=OJ,B=vc
# H0: Group A is not different from group B.
# H1: Group A is different from group B.         (TWO-SIDED T-TEST)

library(plotly)
library(tidyverse)


# Perform  ANOVA -  look at the effects of dose and supplement simultaneously
summary(aov(len ~ supp + as.factor(dose), data = ToothGrowth))
#  P  is  less   than  0.05

# Perform  ANOVA - the interaction effect between grouping variables (i.e. in this case   the effect of time on diet-does the effect of time depend on which diet we are looking
summary(aov(len ~ supp * as.factor(dose), data = ToothGrowth))                                            
# P is less  than  0.05

# One may also run a post-hoc Tukey test on these results the same as for a single factor ANOVA:
TukeyHSD(aov(len ~ supp * as.factor(dose), data = ToothGrowth))
# the p-value is less than 0.05, we reject the null hypothesis that there's no difference between the means and conclude that a significant difference does exist.

# 7.4.3 Exercise 3
# Find or generate your own data that lend themselves to being analysed by a two-way ANOVA.
# Generate suitable hypotheses about your data, and analyse it. Supplement your analysis by
# providing a suitable descriptive statistical summary and graph(s) of your data.

#When p >= 0.05 we may assume that the data are normally distributed. If p < 0.05 then the
#data are not normally distrubted.

data()
view(chicks)

#   NUll hypothesis -  H0 : 1 = 2 = 3 = 4;  the   means   are  the  same
# H0: Group A is not different from group B   from   C  from  D
# H1: Group A is different from group B,  C,  D       
summary(aov(weight ~ Diet + as.factor(Time), data = filter(chicks, Time %in% c(0, 21))))
# Data  is  normally  distributed; P   is  less  than   0.05
# H0  is  rejected; there  is   a  difference



#   XXXXX XXXXX XXXXX XXXXXXXXX XXXXX   XXXXX XXXXX XXXXX XXXXXXXXX  XXXXX   XXXXX

# 9.6.1 Exercise 1
# Produce a heat map using ggplot2.
library(ggpubr)
library(corrplot)
library(RColorBrewer)



#Explore data  -   Pearson correlation
#Specify which correlation is done
# Perform correlation analysis on two variables
# Note:   not need the final two arguments to be stated


# Load the ecklonia datase first
# Given that the dataset is a csv file read it like this

ecklonia <- read_csv("Data/ecklonia.csv")


cor.test(x = ecklonia$stipe_length, ecklonia$frond_length, #same  code  as  always
         use = "everything", method = "pearson") 

#correlation test on the ecklonia dataset;specifically stipe length column
#compare with the frond length 

#a great correlation is closer to 1 

ecklonia_sel <- ecklonia %>% 
  select(-site, -species, -ID)

ecklonia_pears <- cor(ecklonia_sel)
ecklonia_pears

# Create ordinal data
ecklonia$length <- as.numeric(cut((ecklonia$stipe_length+ecklonia$frond_length), breaks = 3))

# Run test on any variable
cor.test(ecklonia$length, ecklonia$digits)

#Normal   data  =  Kendall  used;   continuous  or   discrete

ecklonia_norm <- ecklonia_sel %>% #new name 
  gather(key = "variable") %>% #collects all under one
  group_by(variable) %>%  #group it by variable
  summarise(variable_norm = as.numeric(shapiro.test(value)[2])) #normalitytests
ecklonia_norm

cor.test(ecklonia$primary_blade_length, ecklonia$primary_blade_width, method = "kendall")
#last value is cor
#closer to 1, the stronger the correlation

# Calculate Pearson r before for plotting
r_print <- paste0("r = ", #outcomes is  in environment as a value
                  round(cor(x = ecklonia$stipe_length, ecklonia$frond_length),2))
#paste0 saves a value;can then be added as a value

# Then create a single panel showing one correlation
ggplot(data = ecklonia, aes(x = stipe_length, y = frond_length)) +
  geom_smooth(method = "lm", colour = "grey90", se = F) +
  geom_point(colour = "mediumorchid4") +
  geom_label(x = 300, y = 240, label = r_print) +
  labs(x = "Stipe length (cm)", y = "Frond length (cm)") +
  theme_pubclean()

#heat map: a good one to use
corrplot(ecklonia_pearson, method = "circle") 
#the size of the dot is the correlation
#big  = dark dot is a strong correlation
#light  = small dot is a weak concentration

#Heatmap
colour = colorRampPalette(brewer.pal(8, "RdYlBu"))(25)
heatmap(ecklonia_pearson, scale="column",
        Colv = NA, Rowv = NA, col = colour) #code from https://www.r-graph-gallery.com/215-the-heatmap-function/

# Neat script
# Good comments
# Be sure to show where you are loading the nessasary data
