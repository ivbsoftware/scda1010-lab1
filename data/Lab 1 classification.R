
#import packages;
library(dplyr)
library(reshape2)
library(ggplot2)
library(Hmisc)
library(corrplot)
library(mice)
library(VIM)
library(pROC)
library(caret)
library(sqldf)


## importing nursery database

nursery_data <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/nursery/nursery.data", header = FALSE, col.names = c("parents","has_nurs","form","children","housing","finance","social","health","class"))

attach(nursery_data)
 
#check # of rows
ncol(nursery_data);
nrow(nursery_data);

#data structure with HEAD(), STR(), and SUMMARY()
head(nursery_data,10)
str(nursery_data)
summary(nursery_data)

######################    DATA EXPLORATION: CATEGORICAL

#1. Frequency table: Class

attach(nursery_data)
freq_tbl=table(class)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: has_nurs

attach(nursery_data)
freq_tbl=table(has_nurs)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: form

attach(nursery_data)
freq_tbl=table(form)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: housing

attach(nursery_data)
freq_tbl=table(housing)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: finance

freq_tbl=table(finance)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: social

freq_tbl=table(social)
head(freq_tbl)
prop.table(freq_tbl)

### Frequency table: health

freq_tbl=table(health)
head(freq_tbl)
prop.table(freq_tbl)

## cross table: parents * class
freq_xtab=xtabs(~parents+class)
head(freq_xtab)
prop.table(freq_xtab)

## cross table: parents * class
freq_xtab=xtabs(~parents+class)
head(freq_xtab)

## cross table: parents * health
attach(nursery_data)
freq_xtab=xtabs(~health+class)
head(freq_xtab)

## cross table: parents * finance
attach(nursery_data)
freq_xtab=xtabs(~finance+class)
head(freq_xtab)

## cross table: parents * social
attach(nursery_data)
freq_xtab=xtabs(~social+class)
head(freq_xtab)

## data sumary

summary(nursery_data)

##############visualization ################

attach(nursery_data)
freq_tbl=table(class)
head(freq_tbl)
prop.table(freq_tbl)

#1A. barplot with absolute counts
barplot(freq_tbl)

#1B. barplot with proportions - easier to read
barplot(prop.table(freq_tbl))

mosaicplot(table(class))
pie(table(class))





