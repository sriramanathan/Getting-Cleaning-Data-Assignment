# R script for Peer Assessments -  Getting and Cleaning Data Course Project

# Download File 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
filename <- "getdata.zip"
download.file(fileUrl, filename)

# Read Train Files
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read Test Files
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read Other Files
features <- read.table("./UCI HAR Dataset/features.txt")
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set
DataSet <- rbind(Xtrain,Xtest) 
DataLabel <- rbind(Ytrain,Ytest)
DataSubject <- rbind(subject_train,subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
names(DataSet) = features[,2]
extract <- grep("mean|std", features[,2])
DataSet = DataSet[,extract]

# 3. Uses descriptive activity names to name the activities in the data set
DataLabel[,1] = activity_label[DataLabel[,1], 2]

# 4. Appropriately labels the data set with descriptive variable names.
names(DataLabel) <- "activity"
names(DataSubject) <- "subject"
tidyData <- cbind(DataSubject, DataLabel, DataSet)
write.table(tidyData, "tidy_data.txt", row.name=FALSE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.
avgData <- ddply(tidyData, .(subject, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
write.table(avgData, "average_data.txt", row.name=FALSE)