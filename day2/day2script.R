### Day 2 Workshop 


############  Set the working directory ############

setwd("C:/Users/Paula/Desktop/Ecology-Data-Science-Workshop/day2")

# this can also be done by clicking:

# 1. step: Press ... in the bottom right window (to chose the 'working' folder)
# 2. step: Files tab in the bottom right window -> More button -> Set As Working Directory


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


############ Plotting the data

# Let's make few basic R plots
# Go to Plots tab on the right -> Plots
# they can be exported, zoomed, resized, deleted, etc.

# basic R plots with given X AND Y parameters
plot(data$chlorides, data$fixed.acidity)
plot(data$pH, data$density) # x,y scatter plot
plot(x = data$pH, y = data$citric.acid) # x,y scatter plot
plot(y = data$pH, x = data$density) # x,y scatter plot


############ GGPPLOT structure

# LOAD NEEDED LIBRARIES TO FORM NICER PLOTS
library(tidyverse)
library(ggpubr)	


?ggplot()

ggplot(data = data, aes(x = sulphates , y = pH)) # makes and empty plot with sulfates on x and pH on y axis

# we have to add a layer to ggplot (which will plot the data in any format) we do that by using + 
# Let's say we want to add points (scatter plot) to the plot;
# we use, + geom_point()
# if you write geom_ and the press tab you can see all other types of visualizations you can create 

ggplot(data = data, aes(x = sulphates , y = pH)) + 
  geom_point()

?geom_point

# if we want to make it a bit nicer, we can use theme_minimal() function

ggplot(data = data, aes(x = sulphates , y = pH)) + 
  geom_point() +
  theme_minimal() 

# we can have multiple layers on the same plot
ggplot(data = data, aes(x = sulphates , y = pH)) + # APPLIED FOR ALL CHAINED FUNCTIONS
  geom_point() + # made points
  geom_line() + # connected all points with a line, more info: ?geom_line
  theme_minimal()  

# Another way: we can remove aes() from ggplot and add it to geom_point()
# the result is the same
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  theme_minimal() 

# however, when adding geom_line() now, code will get an error because geom_line() function does not know what to put on lines
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line() + 
  theme_minimal() 

# THUS, we have to explicitly write the same for the lines we add
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line(aes(x = sulphates , y = pH)) + 
  theme_minimal() 

# this is useful if you want to plot multiple variables on the same plot
# rarely looks good but there is an option...
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line(aes(x = sulphates , y = alcohol)) + 
  theme_minimal() 


# possible okay reason and way how to plot them on the same plot
ggplot(data = data) + 
  geom_point(aes(x = sulphates , y = pH, color = "Sulphate ~ pH")) +
  geom_point(aes(x = sulphates , y = alcohol, color = "Sulphates ~ alcohol")) + 
  theme_minimal() +
  ylab("ph/alcohol")


# Lets focus on our task: 
#     let's say that we want to inspect variables in relation to alcohol


# it seems there is a clear relationship between those two variables
ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() 


ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm") # adds line which corresponds to all data points and uses linear model
# lm -> trying to find line that describes relationships between variables
# correlation - not identical as linear model; we can use correlation as proxy (estimate) of linear model

# However, we can also check correlation between those 2 variables
# we see that coefficient is 0.12 (represent steepness of the line) which is not too high
# but p value is significant which says that those two variables correlate linearly with statistical relevance
ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm") +
  stat_cor()

# let's repeat this for other parameters

# it does not seem to be correlated to alcohol
ggplot(data = data, aes( y = alcohol, x = citric.acid) ) + 
  geom_point() +	  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()


ggplot(data = data, aes( x = fixed.acidity, y = alcohol) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()


# Up until now, looking at numerical parameters, one of the appropriate tests -> correlation (relatedness)


# 2nd type of data comparison
# Discrete parameters with numerical
# Step further, analyzing numerical values between 2 groups of parameters, therefore
# we cannot use correlation and cannot express the results in terms of correlation
# Thus, should use box plot for visualization and t.test for performing statistical test, to see
# if those 2 groups are different statistically
# Looking at **density** between 2 groups - 2 types


# getting boxes for each group, we have 2 groups
# we compare numerical values between 2 groups -> medians of each type

ggplot(data = data, aes( x = type, y = density, fill = type) ) + 	
  geom_boxplot() + 	# we can also group plots together and visualize them at once
  stat_compare_means(method = "t.test")


# Does color of the wine affect alcohol level?
# Comparing categorical variable to continuous
# thus, scatter plot won't work and we need box plots

ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal()

# How to create histogram
# shows us how values are distributed in given parameter, in this case alcohol

# Thus, we can now to check if there is statistical significant difference between groups?
# t.test or wilcoxon-mann-whitney test
# t test assumes normal distribution, so lets check how is data distributed
hist(data$alcohol, breaks = 100) # distribution of parameter

# well not really normally distributed,
# when you compare numerical values between 2 groups, 
# since histogram is not normally distributed (bell curve) -> we can actually see 3 distributions,
# we cannot use t.test but wilcox which is supposed to give us results for not normally distributed data (params) 
# t-test assumes normality and we do not have it
ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal() +
  stat_compare_means(method ="wilcox")

# always check the normality of the data because you might draw wrong conclusions
# according to t-test, it is significant, so we might assume incorrect
ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal() +
  stat_compare_means(method ="t.test")

######## How to interpret box plots
# line represents median value, box is middle 50% of your data
# end of boxes are 25% quartile or 75% quartile
# lines are data points bellow 25% quartile or above 75% quartile


# Let's see if correlations are affected within the color-group
ggplot(data = data, aes( x = fixed.acidity, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()


# ADDED FOR type, will be duplicated, R give me analysis for both types, and group by given types
ggplot(data = data, aes( x = residual.sugar, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

ggplot(data = data, aes( x = free.sulfur.dioxide, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

ggplot(data = data, aes( x = total.sulfur.dioxide, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()


# It seems that fixed.acidity~ alcohol is slightly differently associated when comparing wine types
# Most of the red wines are in lower values of residual sugar so it is hard to fit a line 
# free.sulfur.dioxide is negatively correlated to alcohol for red and white wines, slightly more for white
# Total sulfur.dioxide is very different for red and white wines, most of the data for white is on the right
# compared to the red wines which are on the left
# relationship to alcohol is similar, slightly more negative for white wines
# Try to make as much as plots as you can 
# scatter plots, box plots, etc.
# focus on alcohol because this is what we want to predict
# in your data set you will be focused on CO2 or temperature and try to predict it based on other parameters you found
# 
#Keep it simple and understandable

