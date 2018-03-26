
Download sourse data from link below and unzip it to working directory of R Studio.\newline\newline

The zip file provided contains the following files with data: X_train, y_train, X_test, y_test, subject_train and subject_test \newline
For each record in the dataset it is provided: \newline
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. \newline
- Triaxial Angular velocity from the gyroscope. \newline
- A 561-feature vector with time and frequency domain variables. \newline
- It's activity label. \newline
- An identifier of the subject who carried out the experiment.\newline\newline
\newline
Activity lables: \newline
1 WALKING \newline
2 WALKING_UPSTAIRS \newline
3 WALKING_DOWNSTAIRS \newline
4 SITTING \newline
5 STANDING \newline
6 LAYING \newline\newline

 R script called run_analysis.R does the following:\newline\newline
 1.Reading .txt files\newline
 2.Assign column names to the test files\newline
 3.Merge test files.\newline
 4.Merge train files\newline
 5.Then merge the two files together to get all data in one set.\newline
 6.Extracts only the measurements on the mean and standard deviation for each measurement.\newline
 7.Use descriptive activity names to name the activities in the data set.\newline
 8.Appropriately labels the data set with descriptive variable names.\newline
 9.Then create a second, independent tidy data set with the average of each variable for each activity and each subject.\newline

