#Project Description
This Project is made for tidying the data collected from the previous experiments "Human Activity Recognition Using Smartphones data set"

#Short description of the project
The project contain a script produce a data set:
final_tidy_data : contain the "finaldata" set that already summarise by subject and activity, the script will automatically generate a 
					 txt data into your current R workdir without Row names. The txt file will be named "UCI HAR Tidyset.txt".

					 
#Variables Description
the variables description of the final_tidy_data :

This data set contain column that added by binding the data to related subject and activity:

subject : contain the id of the subject that tested and trained. the subject consist numerical class from 1 to 30
activity : contain the activity factor

##note for the next variables
/*
The Variables selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The variables only include the mean and the standard deviation(std) from the original data set, hereby the library:
- mean() : Mean value, example : tBodyAcc-mean()-X
- std()  : Standard deviation, example : tBodyAcc-std()-X
- meanFreq():  Weighted average of the frequency components to obtain a mean frequency, ex : fBodyAcc-meanFreq()-X
all of the next variables are numerical class
*/

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

#Data Transformation:

The final tidy data sustain several transformation from the original hereby the description in sequence of the data transformation journey:
1. Get the data : - the data downloaded from here "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
				 - the data is unzipped in the current R working directory
				 - the data contain test and train data
2. Names the variable : the data variables named based on the variable column name in the features.txt
3. Select mean & std column : the data sub setted by the column names that contain std and mean. it will cut the data set into only 79 variables
4. Add subject & activity var to each obs : bind the subject and activity data into the latest data set. the activity got from "y_test.txt" for test data set & the "y_train.txt" for the train data set
											the subject data set got from the "subject_test.txt" for the test data & "subject_train.txt" for the train data set.
5. Bind the train and test data together : binding the test and train data set into one data set.
6. Give tha activity descriptive label : cast the activity into factorial class and give 6 levels and labels for each one activity, the activity labels consist: 
										 ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"). The reference gotten from the "activity_labels.txt"
7. Group by subject and activity : group the data by subject and activity.
8. Summarise by mean : summarise each observation by its group and the mean value.
9. Write the tidy data set into txt file : write the final and tidy data set into txt file. the txt file name is "UCI HAR Tidyset.txt"


That's all the process and transformation of the data.