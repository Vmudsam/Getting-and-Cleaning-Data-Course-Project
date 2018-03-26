library(dplyr)

# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt") # read features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # read activity labels

#1 Merges the training and the test sets to create one data set.

#give column names to the test files
colnames(X_test) <- features[,2] 
colnames(Y_test) <- "activityid"
colnames(Subject_test) <- "subjectid"
#give column names to the train files
colnames(X_train) <- features[,2] 
colnames(Y_train) <-"activityid"
colnames(Subject_train) <- "subjectid"

#merge test files and merge train files to one file , then merge the two files.
merge_test <- cbind(X_test, Y_test, Subject_test)
merge_train <- cbind(X_train, Y_train, Subject_train )
merge_traintest <- rbind(merge_test, merge_train) #one data set


#2 Extracts only the measurements on the mean and standard deviation for each measurement.

#find the column names in the merged file
column_names <- colnames(merge_traintest)
#use grepl to find columns with mean and standard deviation TRUE or FALSE
std_mean <- (   grepl("activityid" , column_names) | 
                grepl("subjectid" , column_names) |
                grepl("mean.." , column_names) | 
                grepl("std.." , column_names) 
)
std_mean_set <- merge_traintest[ , std_mean == TRUE] # find the columns with measurements on the mean and standard deviation


#3 Uses descriptive activity names to name the activities in the data set
std_mean_set$activityid[std_mean_set$activityid == "1"] <- "WALKING" #replace 1 with WALKING
std_mean_set$activityid[std_mean_set$activityid == "2"] <- "WALKING_UPSTAIRS"
std_mean_set$activityid[std_mean_set$activityid == "3"] <- "WALKING_DOWNSTAIRS"
std_mean_set$activityid[std_mean_set$activityid == "4"] <- "SITTING"
std_mean_set$activityid[std_mean_set$activityid == "5"] <- "STANDING"
std_mean_set$activityid[std_mean_set$activityid == "6"] <- "LAYING"


#4 Appropriately labels the data set with descriptive variable names.
#find the column names 
column_names <- colnames(std_mean_set)

column_names <- gsub("^f", "FrequencyDomain", column_names)
column_names <- gsub("^t", "TimeDomain", column_names)
column_names <- gsub("Acc", "Accelerometer", column_names)
column_names <- gsub("Gyro", "Gyroscope", column_names)
column_names <- gsub("Mag", "Magnitude", column_names)
column_namess <- gsub("Freq", "Frequency", column_names)
column_names <- gsub("mean", "Mean", column_names)
column_names <- gsub("std", "StandardDeviation", column_names)

# corrections
column_names <- gsub("BodyBody", "Body", column_names)

# use new labels as column names
colnames(std_mean_set) <- column_names

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData <- aggregate(. ~subjectid + activityid, std_mean_set, mean)
TidyData <- TidyData[order(TidyData$subjectid, TidyData$activityid),]

write.table(TidyData, "TidyData.txt", row.name=FALSE)


