# Download data 
Download sourse data from link below and unzip it to working directory of R Studio.

The zip file provided contains the following files with data: X_train, y_train, X_test, y_test, subject_train and subject_test.


For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables.

- It's activity label. 

- An identifier of the subject who carried out the experiment.


Activity lables: 

1 WALKING 

2 WALKING_UPSTAIRS 

3 WALKING_DOWNSTAIRS 

4 SITTING 

5 STANDING 

6 LAYING 
# R script 
 
 R script called run_analysis.R does the following:
 
 1.Reading .txt files.
 
 2.Assign column names to the test files.
 
 3.Merge test files.
 
 4.Merge train files.
 
 5.Then merge the two files together to get all data in one set.
 
 6.Extracts only the measurements on the mean and standard deviation for each measurement.
 
 7.Use descriptive activity names to name the activities in the data set.
 
 8.Appropriately labels the data set with descriptive variable names.
 
 9.Then create a second, independent tidy data set with the average of each variable for each activity and each subject.

