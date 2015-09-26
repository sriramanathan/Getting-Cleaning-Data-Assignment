# Code Book for Getting & Cleaning Data Assignment

This CodeBook explains the steps for doing the anaylsis for Getting and Cleaning Data Course Project

## Download File Link
The raw data for the project was downloaded from the belwo link 

[Raw Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Reading the Training and Testing  Files

Files which are read for the anaylsis

* 'X_train.txt' & 'X_test.txt'
* 'y_train.txt' & 'y_test.txt'
* 'subject_train.txt' & 'subject_test.txt'
* 'features.txt' & 'activity_labels.txt'

## Steps used in the Script

1. The training and testing data were merged using 'rbind' to create data sets. 

2. Created a logical vector using 'grep' to find the mean and std deviation. 

3. The activity labels were assigned to the megred dataset

4. Appropriately labels the data set with descriptive variable names were given.

5. The average of each variable for each activity and each subject was found using the 'ddply' function. 

6. Finally, two output files 'tidy_data.txt' & 'average_data.txt' were written

### Data Columns for Tidy Data Set 

* The Tidy Data set has 10299rows and 81 columns

### Data Coulmns for Avg Data Set

* The Avg Data set has 180rows and 81 columns


