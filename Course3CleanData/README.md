
## Introduction
This data set is generated from an experiment about human activity recognition. 30 persons(subjects) participate in the experiment. During the process, they wear a smartphone on waist and take six activities, namely walking, walking upstairs, walking downstairs, sitting, standing and laying. The smartphone records data by using its embedded accelerometer and gyroscope when subjects performs those activities. The purpose of the project is to clean the raw data and prepare a tidy dataset for later analysis. 


### Raw Dataset    
Raw data for smartphone records can be downloaded from the link.    
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip     


### Relevant tables/files   
 - Train file :    
1.X_train.txt': Training data set contains **70% of subjects**.    
2.y_train.txt': The label number in training data set means six activities.    
3.subject_train.txt : Subject id for training data set.    

 - Test file :     
1.X_test.txt': Test data set contains **30% of subjects**.    
2.y_test.txt': The label number in test data set means six activities.    
3.subject_test.txt : Subject id for test data set. 

 - features.txt :     
It contains 561 variables.    

 - activity_labels.txt:    
Links the class labels with their activity name.    


### Output- Tidy Dataset      

 - The R code for cleaning raw data is shown in **"run_analysis.R"** script.   
   
 - The steps for processing data are following :    
1.Load relevant data mentioned above into R.    
2.Merge train data and test data to individual dataset. 
3.Subset variables only containing mean and std(standard deviation).
4.Combine subject table, activity table and mean_std table into one dataset.  
5.Use descriptive activity names to name six activities in activity table.         
6.Create a second, independent tidy dataset with the average of each variable for each activity and each subject.        


### Code Book    
Code book records corresponding meanings of each variable for the tidy data.It also has detailed steps to clean, combine, filter and averaging the individual files to prepare one clean and tidy data set(file).             

