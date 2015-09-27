#Code Book
This Code Book describes the variables and methods in run_analysis.R for the Getting and Cleaning Data course project.

##Variables
The data for this project comes in a [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data is measurements obtained from smartphones worn by participants doing several different activities. More information about the data including units is contained in the reference files along with the data. The data is split into two data sets, test and train, for developing and testing models.

##Script
The run_analysis.R script loads the data from the zip file, tidys the data, and performs some analysis. The functionality of the script is outlined below.

* Read the data files into R
    + The data files are delimited by white space and have no headers. Strings are not read as factors.
* Assign names to columns in the data frames
    + The column names for the measurement data are read from the features file and applied to the data frame.
* Merge the test and train data sets
    + Combine the data using rbind. Since the data frames have appropriate column names, binding the data together is straightforward
* Extract mean and standard deviation variables from the data
    + Use grep to find variables with "mean" or "std" in the column nams. Keep these variables in the tidy data set.
* Use descriptive activity names
    + The activities are identified by an id number in the data set. Use the activity_labels data file to map the activity id to the activity. Convert the activity ids to factors and set the levels of the factor to the activity label strings instead of the id numbers
* Average each variable by activity and subject
    + Use the dplyr package to group the data by activity and subject and summarize each column of data.
* Write the resulting tidy data table to a file for submission