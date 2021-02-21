########### All of the answers for this assignment should be placed in Word document file.

########### Now, go to my GitHub repository - Ecology-Data-Science-Workshop and download and save the directory contents locally to your computer. 
########### Open RStudio and open guided_project script (guided_project.R file) that is located inside r_assignment1 folder inside the downloaded repository.

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
# For each of the following tasks, create a screenshoot, copy a script and take a screenshoot of the plot.
# Plots should be made in Rstudio using ggplot framework (package=library) and attached into the Word document. 
# Each figure requires interpretation in your own words.

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


########### BONUS QUESTIONS

# Compare production of few atmospheric gasses (and total_ghg) with GDP
# Make multiple point-plots having gdp_scaled on y-axis and atmospheric parameters on x-axis
# Hint: use stat_core and geom_smooth(method="lm") for better interpretation


# Compare production of few atmospheric gasses (and total_ghg) with GDP for every country 
# Use the same plot structure as in previous question
# Hint: add color=country in aes()
# Observe correlation coefficient for every country and explain your findings.


# Make a linear regression model which will predict CO2 levels
# Hint: make point-plots to choose parameters which are meaningful for CO!2 prediction
# ! DO NOT USE total_ghg because CO2 itself is green house gas
# Which parameter is the best for predicting CO2?
