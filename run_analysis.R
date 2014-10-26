## Set to PWD
setwd("F:/MOOC/Module 3 - Week 3")

## Load the reshape2 library
library(reshape2)

## Assume raw data files is in the data folder
## Check data folder exits and go to the directory.
if(file.exists(".\\data")) {
        setwd(".\\data")
} 

## Read raw data files into memory for processing
## Read the training raw data files
trainSubject   = read.table(".\\UCI HAR Dataset\\train\\subject_train.txt",header=FALSE)
trainY         = read.table(".\\UCI HAR Dataset\\train\\y_train.txt",header=FALSE)
trainX         = read.table(".\\UCI HAR Dataset\\train\\X_train.txt",header=FALSE)
## Read the test raw data files
testSubject    = read.table(".\\UCI HAR Dataset\\test\\subject_test.txt",header=FALSE)
testY          = read.table(".\\UCI HAR Dataset\\test\\y_test.txt",header=FALSE)
testX          = read.table(".\\UCI HAR Dataset\\test\\X_test.txt",header=FALSE)
features       = read.table(".\\UCI HAR Dataset\\features.txt")
activityLabels = read.table(".\\UCI HAR Dataset\\activity_labels.txt", header=FALSE)

## Join the training and test files.
subjects   = rbind(trainSubject, testSubject)
activities = rbind(trainY, testY)
readings   = rbind(trainX, testX)

## Extract only the mean and standard deviation for each measurement
meanStdIndices = grepl('-(mean|std)\\(',features[,2])
readings = readings[, meanStdIndices]
names(readings) = features[meanStdIndices,2]
names(readings) = gsub("\\(|\\)","",names(readings))
names(readings) = tolower(names(readings))

## Use descriptive activity names to name the activities in the data set.
activityLabels[, 2] = gsub("_", "", tolower(as.character(activityLabels[, 2])))
activities[,1] = activityLabels[activities[,1], 2]
names(activities) = "activity"

## Appropriately label the data set with descriptive activity names.
names(subjects) = "subjects"
mergedData = cbind(subjects,activities, readings[!is.na(names(readings))])
write.table(mergedData,".\\merged_data_set.txt", row.name=FALSE)

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mergedDataMelt = melt(mergedData, id=c("subjects","activity"))
mergedDataMeltDcast = dcast(mergedDataMelt, subjects + activity ~ variable, mean, na.rm = TRUE)
write.table(mergedDataMeltDcast,".\\tidy_data_set.txt", row.name=FALSE)



