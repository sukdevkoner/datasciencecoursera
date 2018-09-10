library(plyr)

# 0. Downloading and unzipping the (train/test) files

# Download + unzip the file:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "traintestdata.zip", method="curl")

if(!file.exists("./UCI HAR Dataset")) {
    unzip("traintestdata.zip")
}

# Save system date as the download date:
dateofdownload <- Sys.Date()

# Here for this project we can ignore all files in 'Inertial Signals' Folder as information 
# from these Raw files are already included in below set of 3 files.

# X <- This is actual data file- here it is called 'Features file'. This file has all the
# detail data for Accleremeter reading (x/y/z axis) and Gyroscope reading (x/y/z axis).It also 
# has different mean and standard deviation columns, already calculated, as well

# y <- it has one of 6 different activities in it. (Total 6 activities like
# WALKING, SITTING etc.)

# subject <- this files are having the Id number of different persons who 
# participated in this experiment (varies from 1 to 30 as 30 people 
# participated in this experiment)

# Reading X- Features/data Files: X files have total 561 columns.
# we can do ncol(xTrain) to verify this
xTrain    <- read.table("./UCI HAR Dataset/train/X_train.txt")
xTest     <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Reading Subject Files
subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading Y- Activity Files
yTrain    <- read.table("./UCI HAR Dataset/train/y_train.txt")
yTest     <- read.table("./UCI HAR Dataset/test/y_test.txt")


# Reading Activity Descriptions Labels and features.txt file.
# Features.txt file has all the column descriptions for all 561 columns for X-files.

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features  <- read.table("./UCI HAR Dataset/features.txt")


# 1. Merge the training and test data to create one data set
# Here Merge does not mean join- it simply means append data together.
# Remember that X, Y and Subject set of files are having same no of columns and 
# they are in same sequence

# Merging/Combining the Feature Data
xfeatures <- rbind(xTrain, xTest)

# Merging the Activity Data
yactivity <- rbind(yTrain, yTest)

# Merging Subject data
subjectdata <- rbind(subTrain, subTest)

# provide the names to variables in all the three data.frames
names(subjectdata)   <- "subject"
names(yactivity) <- "activity"
names(xfeatures) <- features$V2

# Merging all the datas in one single data.frame
all_data <- cbind(xfeatures, yactivity, subjectdata)


# 2. Extract only the measurements on the mean and standard deviation for each measurement


# get only columns with 'mean()' or 'std()' in their names
mean_std_features <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

# subset the desired columns
list_of_columns <- c(as.character(mean_std_features), "subject", "activity" )
all_data <- subset(all_data, select=list_of_columns)


# 3. Use descriptive activity names to name the activities in the data set


# update values with correct activity names/descriptions
all_data$activity <- activityLabels[all_data$activity, 2]


# 4. Appropriately label the data set with descriptive variable names


names(all_data) <-gsub("^t", "time", names(all_data))
names(all_data) <-gsub("^f", "frequency", names(all_data))
names(all_data) <-gsub("Acc", "Accelerometer", names(all_data))
names(all_data) <-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data) <-gsub("Mag", "Magnitude", names(all_data))
names(all_data) <-gsub("BodyBody", "Body", names(all_data))

names(all_data) <-gsub("-", "_", names(all_data))
names(all_data) <-gsub("mean", "Mean", names(all_data))
names(all_data) <-gsub("std", "Std", names(all_data))
names(all_data) <-gsub("\\(\\)", "", names(all_data))


# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

#Now in Result Data ('all_data')for each variable
#(column), there are several observations(rows) for the 
#same subject-activity pair.
#But as per the 'Tidy data principle' One observation 
#per row and one variable per column.

# we are using ddply function to Group By subject and then activity

write_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(write_data, "tidy.txt", row.name=FALSE , sep ="\t")

## End of the Program 