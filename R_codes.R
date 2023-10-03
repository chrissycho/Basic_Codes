#setting up a working directory
setwd("G:/folder/subfolder")

#installing packages for the first time
install.packages("data.table")
install.packages("tidyverse")
install.packages("randomForest")
library(data.table)
library(dplyr)
library(ggplot2) #plot library
library(randomForest)

#reading a big file 
df <- fread(file = "file_name.csv", data.table = F)

#removing columns that are not needed & filter to include certian types on a column - keep the rows with the certain types within a column
d1 <- df %>% select(-columnA, -columnB, -columnC) %>% 
  filter(Condition %in% c("group_A", "group_B", "group_C"))

# Glimpse the dataframe to view the names of columns, the type and a few data rows 
glimpse(dataframe)

# Exploring types in condition: table(df$Column_name)

# Explore the structure 
str(d1)
# Re structuring a dataframe "d1" with replacing a column name from Condition to ct and relocate it to the last 
d1 <- d1 %>% relocate(ct = Condition, .after=last_col()) # rename Condition as ct and relocate it to the last

# Explore the dataframe
tail(colnames(d1))
View(d1)
head(colnames(d1))
# count how many columns starting with ch 
    #colnames(df) %>% startsWith(., "ch")%>% table()

# Check if there is any missing data
any(is.na(d1))
