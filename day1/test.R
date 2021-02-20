### Day 1 Workshop 


############  Set the working directory ############

setwd("C:/Users/Paula/Desktop/Ecology-Data-Science-Workshop/day1")

# this can also be done by clicking:

# 1. step: Press ...(three little dots) in the bottom right window (to chose the 'working' folder)
# 2. step: Files tab in the bottom right window -> More button -> Set As Working Directory


############  Basic operations

?mean

x <- c(0:10, 50)

mean(x)

abs(-2.2)

sqrt(9)

dim(data) # check dimension of your matrix


############ Loading the data

?read.csv()

data <- read.csv("winequalityN.csv", sep=",")

data <- read.csv("winequalityN.csv", sep = ",", header = FALSE)


############ Accessing the specific columns

data[, "pH"] # comma means 'everything', so this is give me all rows for 'pH' column
data[, 1] # give me everything for first column
# accessing specific row
data[55,] # give me all columns for row number 55

colnames(data) # what are names of my columns?
rownames(data) # what are names of my rows?

# accessing specific row and column (one value)
data[1, 1] # give me first row, first column value


# : represents from-to sequence of numbers

1:5
3:9

# accessing specific rowS and columnS
data[1:5, 5:7]
data[1:3, 3:4]
data[1:3, "pH"] # when we ask for single column such as 'pH', we actually get a vector (list) of values


############ Data types in R
typeof(data$fixed.acidity) # double and float are decimal numbers
typeof(data$quality) # integers are rounded numbers


############ Plotting the data

# Let's make few basic R plots
# Go to Plots tab on the right -> Plots
# they can be exported, zoomed, resized, deleted, etc.
plot(data$chlorides, data$fixed.acidity)
plot(data$pH, data$density) # x,y scatter plot
plot(x = data$pH, y = data$citric.acid) # x,y scatter plot
plot(y = data$pH, x = data$density) # x,y scatter plot


############ Installing new packages (library)
install.packages("tidyverse") 
install.packages("ggpubr")

# loading them so you can use functions
library(tidyverse)
library(ggpubr)


# making nicer plots
ggplot(data = data, aes( x = sulphates, y = pH) ) + 
  geom_point() +
  theme_minimal() 