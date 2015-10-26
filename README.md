## GCD Course Project
The goal of this project is to prepare tidy data from raw UCI HAR dataset and make a new dataset based on that data.

As a source I used eight files from original "test" and "training" datasets:
    'features.txt' - list of all features
    'activity_labels.txt' - list activity names
    
    'subject_train.txt' - subject who performed the activity
    'X_train.txt' - training set
    'y_train.txt' - raining labels
    
    'subject_test.txt' - subject who performed the activity
    'X_test.txt' - test set
    'y_test.txt' - test labels
The data for the project and detailed description for all files and fiels you can get from this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and at home page of the project http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

My first task was to merge all data from test and training datasets to one dataset with subject IDs and activity names.
I used the read_fwf function from package readr to read data from X_train and X_test files. For other files I used standard read.table function. All data was merged by cbind and rbind functions.

Next step was to select columns with mean and standard deviation for each measurement. To do this I created a new vector to_save with mask (grepl function was used) and extract reqired columns.

For the last step I used two very interesting functions melt and ddpy. Melt function made a new dataframe with a four columns: subjectID, activity, variable, and value. Ddply function summarized that data and calculated mean values for every unique combination of subjectID, activity, and variable.

In my work I used next packages: plyr, dplyr, readr, reshape2.