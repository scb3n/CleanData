# CleanData
This repository contains my project submission for the coursera class Getting and Cleaning Data.
##Preparing the environment
The R script in this repository tidies and analysis the data collected using accelerometers in Samsung phones. To set up your environment to analyze the data, clone this repository to a location on your computer. Next, download the data [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract the contents into your working directory.
##Running the analysis
To run the analysis, make sure the data is extracted into your working directory. You should have a folder called "UCI HAR Dataset" in your working directory. Next, set the working directory in R and source the run_analysis.R file.
##Expected Results
The expected result is a tidy data frame called df2. The data frame gives the average of many variables by particpant and activity.