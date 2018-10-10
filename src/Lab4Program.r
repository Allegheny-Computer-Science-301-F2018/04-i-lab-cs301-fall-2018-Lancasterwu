# Name:Lancaster
# Date:10/9/2018

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.

## create the object dat, use filter to find all Measles variables without state == Alaska and Hawaii.
dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska" & state != "Hawaii")
## set the function to calculate per100000rate
per100000rate <- dat$count * 100000 / dat$population * dat$weeks_reporting / 52
## add the function as the new column
dat$per100000rate <- per100000rate

#Question 2.

library(ggplot2)
## create the object datc, use filter to find data only with state == California from dat
datc = filter(dat, state == "California")
## polt the point graph, add the vericle line at x == 1965
ggplot(data = datc) + geom_point(mapping = aes(x = year, y = count/population)) + geom_vline(xintercept = 1965)

#Question 3.

## Solution1:
## create the object with only state == California from us_contagious_diseases
dat_caliFocus <- filter(us_contagious_diseases, state == "California")
## block the years besides 1950, 1960, 1970
dat_caliFocus$yearBlock[dat_caliFocus$year == 1950] <- "1950’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1960] <- "1960’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1970] <- "1970’s"
## plot the graph, set the width to 0.5
ggplot(data = dat_caliFocus) + geom_bar(mapping = aes(x = state,y = count^(1/2), fill = yearBlock), width = 0.5, position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
## year 1970's has the lowest rate

## Solution2:
install.packages("rcompanion")
dat_caliFocus <- filter(us_contagious_diseases, state == "California")
dat_caliFocus$yearBlock[dat_caliFocus$year == 1950] <- "1950’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1960] <- "1960’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1970] <- "1970’s"
C_sqrt = sqrt(dat_caliFocus$count)
library(rcompanion)
plotNormalHistogram(C_sqrt)

#Question 4.

## SOlution1:
## create a copy of us_contagious_diseases
dat_copy <- us_contagious_diseases
## block all the years besides 1950, 1960, 1970
dat_copy$yearBlock[dat_copy$year == 1950] <- "1950’s"
dat_copy$yearBlock[dat_copy$year == 1960] <- "1960’s"
dat_copy$yearBlock[dat_copy$year == 1970] <- "1970’s"
## plot the graph
ggplot(data = dat_copy) + geom_bar(mapping = aes(x = state,y = count^(1/2), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
## It shows all states

## Solution2:
dat_copy <- us_contagious_diseases
dat_copy$yearBlock[dat_copy$year == 1950] <- "1950’s"
dat_copy$yearBlock[dat_copy$year == 1960] <- "1960’s"
dat_copy$yearBlock[dat_copy$year == 1970] <- "1970’s"
count_sqrt = sqrt(dat_copy$count)
plotNormalHistogram(count_sqrt)

#Question 5.

## First two steps are extactly the same
## create a copy of us_contagious_diseases
dat_copy <- us_contagious_diseases
## block all the years besides 1950, 1960, 1970
dat_copy$yearBlock[dat_copy$year == 1950] <- "1950’s"
dat_copy$yearBlock[dat_copy$year == 1960] <- "1960’s"
dat_copy$yearBlock[dat_copy$year == 1970] <- "1970’s"
## plot the graph, use geom_tile, set x = state, y = year, fill = rate, add the grey color edge
ggplot(data = dat_copy) + geom_tile(mapping = aes(x = state, y = year, fill = count^(1/2)),colour = "grey50", position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

#Question 6.

## find the data from https://github.com/cran/SCCS
## Name of the file: autdat
## This data frame containing 350 rows and 5 columns. The column names are 'case' (individual identifier), 'diag' (age at autism diagnosis), 'sta' (age on the first day of the observation period), 'end' (age on last day of the observation period), 'mmr' (age at MMR vaccination).
## import data base
autdat <- read.delim("~/cs301F2018/labs/04-i-lab-cs301-fall-2018-Lancasterwu/autdat.txt")
## plot the graph, we can see that dark blue points are around 1000-2000, which means age at autism diagnosis are about the similar age at MMR vaccination, but this can't prove they are related.
ggplot(data = autdat) + geom_point(mapping = aes(x = case, y = diag, color = mmr))





