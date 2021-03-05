############################################ GUIDED PROJECT - RSTUDIO ASSIGNMENT 
# Students are expected to answer all questions with a plot and appropriate interpretation. 
# Plots should be made in Rstudio using ggplot framework and attached into the
# word document. Each figure (or group of figures) requires interpretation.
# 
# + General Hints (Not mandatory to do but it will help with interpretation):
# - Feel free to use scale_y_log10 or scale_x_log10 whenever you think it could help you with interpretation 
# - Make sure you understand what scaling on log10 does and why do we apply it
# - Play with "fill" and "color" parameters inside aes() function when making plots in order to 
#   make your plots more colorful and easier to understand
# - Apply theme_minimal or theme_pubclean whenever you think it makes your plots nicer
# - Data might contain NAs (or unknown values) which will be ignored when you make plots 
#   (nothing to worry about, just be aware of what is happening)

########### Now, go to Paula's GitHub repository - Ecology-Data-Science-Workshop 
########### and download and save the directory contents locally to your computer. 
########### Open RStudio and open guided_project script (guided_project.R file) 
########### that is located inside r_assignment1 folder inside the downloaded repository.

# 1. Set your working directory to be r_assignment1 folder 
# ** because that is the folder where our data and script is **
# Explain the steps you had to perform to set the working directory or simply paste the line of code that does that for you in RStudio.


# 2. Load the data into a variable of your choice; we commonly use 'data' as a variable name, but you can name it as you wish.
# 	Paste the code that you had to write to load your data into a variable and take a screenshoot of the data opened in RStudio 
# Hint: Click on the variable shown in Environment tab within the window in the upper right corner of the RStudio dashboard, under 'Environment' tab


# 3. a) Make summary of data to see what parameters are you dealing with and paste the contents of R output produced in the console.
#    b) Calculate the mean value of CO2 for the given data. (Attach the line of code in Word file to provide a solution)	

######################## IMPORTANT ########################

# Before forming your code, pay attention to column names, i.e. check the data variable 
# For each of the following tasks, create a screen shoot, copy a script and take a screen shoot of the plot.
# Plots should be made in Rstudio using ggplot framework (package=library) and attached into the Word document. 
# Each figure requires interpretation in your own words. What I want here from you is that you think and express your thoughts in a form of the words.

#################################################################################################


# 4. a) Which country produces the most CO2 ? (make boxplot showing country on X-axis and CO2 on y axis)
# Hint: add  + scale_y_log10() on the end so all of y values are scaled

#    b) Which country produces the most methane ? 
# Hint: use the same structure of code as in previous task

#    c) Which country produces the most of the greenhouse gasses (Total Green house gasses) ?
# Hint: use the same structure of code as in previous task

#    d) Which country produces the most Nitrous Oxide
# Hint: use the same structure that you used when investigating CO2-plot 

#    e) Compare populations of each country
# Hint: Use the same structure as in previous plots


# 5. a) Are Population and CO2 correlated?
# Hint: Make point-plot having population on x-axis and CO2 on y-axis
# For better interpretation and more detailed answer, use stat_cor() and geom_smooth(method="lm")

#    b) Does population-CO2 association change in different countries?
# Hint: Use the same plot as in previous task but add color=country inside aes() function
# What countries have negative coefficient? (Optional) Why do you think that is?


# For the 2nd part of this exercise, we will be using data concerning different subject - data related to the Corona virus state

# Therefore, we have to load our another set of data so that we can use it for the further analysis

corona_data <- read.csv("corona_data.csv")


# 1. a) Which country has the most corona cases (use plots 1.a, 1.b, 1.c and 1.d to answer the question)?
# Hint: Make boxplot where x-axis is location and y-axis is total_cases
# Hint: add scale_y_log10() since the numbers are quite different

#    b) Using total_cases might not be the most useful metric to represent corona outbreak, 
#      therefore make the same plot as in question 1.a but with new_cases column

# 1. c) Plot population of each country
# Hint: Use the same code structure as in previous questions but replace geom_boxplot() with
#       geom_col(). Boxplots are useful visualization technique when data varies within certain 
#       categorical variable (in our case location).

# If you did not use scale_y_log10, you could noticed that population varies quite a lot
# Since this is the case, it is "not fair" to compare new_cases between countries without
# considering population

# 1. d) Use new_cases_per_million column on plot

# 2. a) Which country make the most corona tests?

# 2. b) For similar reasons explained in question 1, use total_tests_per_thousand 
#      instead of total_tests

# 3. a) Make scatter-plot having total_tests_per_thousand on y-axis and new_cases_per_million
#      on x-axis. Use stat_cor() and geom_smooth(method="lm") to calculate and visualize relationship
#      between those two variables. 
#      How would you describe relationship between those two variables? 
#      Did you expect such relationship? Why?

# 3. b) Make the same plot as in 3.a but per location. 
# Hint: add color=location inside aes() function
# Hint: You might have difficulties interpreting this plot if you include all locations therefore 
#       here is the code which will make a new table containing only specific countries. If you want to include some others, please feel free to do it. 

# This code takes corona_data table and applies filter which checks whether location is in this 
# vector of locations. The results are stored in new table called temporary_data. 
# Feel free to add/remove countries but make sure you write it right or you will get an error.
# temporary_data will be used in questions 4 and 5
temporary_data = corona_data %>% filter(location %in% c("Italy", "Croatia", "Japan", "United States", "Germany"))

# How would you interpret very steep line or flat line of this plot?

# 4. You might have heard about expression "flattening the curve" during the corona-pandemic. 
# This expression refers to the scatter-plot where x-axis is date and y-axis is new_cases_per_million.
# Hint: Use temporary_data with geom_point() and mentioned x and y parameters
# What does narrow bell-shaped curve represent? How does that situation affect healthcare? 
# Why do we want to "flatten the curve"? (Compare few countries with Croatia and comment on curves)
# How many "waves" of corona-outbrake do you see? 

# 5. a) Let's investigate death rate of corona... We are still using temporary_data in this question, so it is
#      easier to compare countries. In this question, make sure you included Italy as one of the countries 
#      but feel free to add other countries (the currently included ones are Italy, Japan, Croatia, Germany and US).
#      Make scatter plot having new_deaths_per_million on x-axis, new_cases_per_million on y-axis 
#      and color=location. Use geom_smooth(method="lm") and stat_cor() for efficient interpretation.
#      What does steep line with high R (correlation coefficient) represent? What about flat line with low
#      R (correlation coefficient)?

# 5. b) We are still using temporary_data in this question, so it is
#      easier to compare countries. What might be the cause of high death rate? 
#      Make boxplot having diabetes_prevalance for x-axis,
#      new_deaths_per_million for y-axis and color location
#      Which country's corona-deaths are affected the most by diabetes prevalance? Why ?

# 5. c) In connection to question 5.b make the same plot but having aged_65_older on x-axis instead of 
#      diabetes_prevalence. Which country shows a high new_deaths_per_million AND a high number of
#      aged_65_older?

# 5. d) In connection to question 5.b and 5.c make the same plot but having population_density on x-axis instead of 
#      diabetes_prevalence. Which country shows a high new_deaths_per_million AND high population_density?


########### BONUS QUESTIONS

# Compare production of few atmospheric gasses (and total_ghg) with GDP
# Make multiple point-plots having gdp_scaled on y-axis and atmospheric parameters on x-axis
# Hint: use stat_core and geom_smooth(method="lm") for better interpretation


# Compare production of few atmospheric gasses (and total_ghg) with GDP for every country 
# Use the same plot structure as in previous question
# Hint: add color=country in aes()
# Observe correlation coefficient for every country and explain your findings.


# Make a linear regression model which will predict CO2 levels
# Hint: make point-plots to choose parameters which are meaningful for CO2 prediction
# ! DO NOT USE total_ghg because CO2 itself is green house gas
# Which parameter might be the best for predicting CO2 ? Why ?