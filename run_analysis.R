# Getting and Cleaning Data Project

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## read in all the data
# features file gives variable names
features <- read.delim("./UCI HAR Dataset/features.txt", sep="", header = FALSE, stringsAsFactors = FALSE)

# activity labels
activity_labels <- read.delim("./UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE, stringsAsFactors = FALSE)
colnames(activity_labels) <- c("ActivityID", "Activity")

# read test data and set column names
test_subject <- read.delim("./UCI HAR Dataset/test/subject_test.txt", header = FALSE) # subject  number
colnames(test_subject) <- "Subject"

test_y <- read.delim("./UCI HAR Dataset/test/y_test.txt", header = FALSE) # activity code
colnames(test_y) <- "Activity"

test_x <- read.delim("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE) # data, values separated by white space
colnames(test_x) <- features[,2]

# read train data and set column names
train_subject <- read.delim("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(train_subject) <- "Subject"

train_y <- read.delim("./UCI HAR Dataset/train/y_train.txt", header = FALSE) # activity code
colnames(train_y) <- "Activity"

train_x <- read.delim("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE) # data, values separated by white space
colnames(train_x) <- features[,2]


## merge into one data set
subject <- rbind(test_subject, train_subject)
activity <- rbind(test_y, train_y)
measurements <- rbind(test_x, train_x)

df <- cbind(subject, activity, measurements)

## extract only mean and std data
idx <- grep("mean|std", colnames(df), ignore.case = TRUE)
df <- df[,c(1,2,idx)] # keep first two colusn (subject, activity)

## use descriptive activity names
# turn activity id into a factor
df$Activity <- as.factor(df$Activity) 
# set the levels of the factor to the values from the activity labels file
levels(df$Activity) <- activity_labels$Activity

## average of each variable for each activity and subject
df$Subject <- as.factor(df$Subject)
df2 <- df %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## write data table to a file for submission
write.table(df2, "data.txt", row.names = FALSE)

