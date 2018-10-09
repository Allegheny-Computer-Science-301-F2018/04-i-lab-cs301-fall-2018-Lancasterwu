# Name:Lancaster
# Date:

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.

dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska" & state != "Hawaii")
per100000rate <- dat$count * 100000 / dat$population * dat$weeks_reporting / 52
dat$per100000rate <- per100000rate

#Question 2.

library(ggplot2)
ggplot(data = datc) + geom_point(mapping = aes(x = year, y = count/population)) + geom_vline(xintercept = 1965)

#Question 3.

#Question 4.

#Question 5.

#Question 6.





