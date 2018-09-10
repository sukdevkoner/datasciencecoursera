
## Coursera - Getting and Cleaning Data - Project 
#### Description: Create Tidy data from 'Human Activity Recognition Using Smartphones'
 Author : Sukdev Koner


## Introduction
'Tidy data' is a data set that has been merged, cleaned and filtered from a bigger data set that comprises of 3 subsets and 8 files. Tidy means : one Observation per Row and one Variable per Column.


#### Information on Data Collection
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  
The source data for this project can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The source data is divided in the following way:  
- 'features.txt': List of all the names of features (variables).  
- 'activity_labels.txt': Links the class labels with their activity name.  
- 'X_train.txt': Training set.  
- 'y_train.txt': Training labels.  
- 'X_test.txt': Test set.  
- 'y_test.txt': Test labels.  
- 'subject_train.txt' and 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  

#### Subsets
1. The values of 'Activity' consist of data from 'y_train.txt' and 'y_test.txt'
The types/names of 'Activity' can be found at 'activity_labels.txt'
2. The values of 'Subject' consist of data from 'subject_train.txt' and 'subject_test.txt'
3. The values of 'Features' consist of data from 'X_train.txt' and 'X_test.txt'.
The names of the variables 'Features' can be found at 'features.txt'

### Attribute Information
For each record in the dataset it is provided:   
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
- Triaxial Angular velocity from the gyroscope.   
- A 561-feature vector with time and frequency domain variables.   
- Its activity label.   
- An identifier of the subject who carried out the experiment.  

#### Details about Variables used here:
The definitions of variables are as follows:  
 (They are from "feature_info.txt" in the original "UCI HAR Dataset" file.)         

1. **Subject id :**    
Number 1 to number 30 mean 30 subjects who participate in the experiment.    

2. **Activity :**    
Each subject performes six activities when wearing a smartphone.    

 - Walking    
 - Walking upstairs    
 - Walking downstairs    
 - Sitting    
 - Standing    
 - Laying
 
3. Variables contain **X, Y or X.**    
It is used to denote 3-axial signals in the X, Y and Z directions.    
    
4. Variables contain **Gyro or ACC.**    
The smartphone embeds two sensor signals for recording the results of activities, **accelerometer** and **gyroscope** respectively.     

5. Variables contain **Time_Acc_XYZ and Time_Gyro_XYZ.**         
These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.    

6. Variables contain Time_**Body**Acc_XYZ and Time_**Gravity**Acc_XYZ.    
The acceleration signal was separated into **body** and **gravity** acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.     

7. Time_BodyAcc**Jerk**_XYZ and Time_BodyGyro**Jerk**_XYZ.     
The body linear acceleration and angular velocity were derived in time to obtain **Jerk signals**.    

8. Time_BodyAcc**Mag**, Time_GravityAcc**Mag**, Time_BodyAccJerk**Mag**, Time_BodyGyro**Mag** and Time_BodyGyroJerk**Mag**.    
The magnitude of these three-dimensional signals were calculated using the Euclidean norm.    

9. **Frequency**_BodyAcc-XYZ, **Frequency**_BodyAccJerk-XYZ, **Frequency**_BodyGyro-XYZ, **Frequency**_BodyAccJerkMag, **Frequency**_BodyGyroMag and **Frequency**_BodyGyroJerkMag.    
A Fast Fourier Transform (FFT) was applied to some of these signals producing these variables.    

10. Variables contain **mean**: Mean value.    

11. Variables contain **std**: Standard deviation.    




## Steps to create Tidy Data from Text files:
The steps to create Tidy data are registered on the script *run_analysis.R* and is described below:

#### Step 1: Merge the training and the test sets to create one data set.
 X_train.txt and X_test.txt were merged to create Features Data.  
 y_train.txt and y_test.txt were merged to create Activity Data.  
 subject_train.txt and subject_test.txt were merged to create Subject Data.  

 Features, Activity and Subject datas were merged into a single data set: all_data

#### Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
 features.txt was used to get only columns with mean() or std() in their names and reassigned on all_data

#### Step 3: Use descriptive activity names to name the activities in the data set
 activity_Labels.txt is used update values with correct activity names on all_data.

#### Step 4: Appropriately label the data set with descriptive variable names
  Use 'gsub' function for pattern replacement to clean up the data labels

#### Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
 Per the project instructions, we need to produce only a data set with the average of each variable for each activity and subject. That was accomplished with the use of ddply function.

#### Step 6: Create text file with tidy data
A new text file named as 'Tidy.txt' is created with clean data.  


