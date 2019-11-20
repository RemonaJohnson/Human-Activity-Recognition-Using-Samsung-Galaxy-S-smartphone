library(dplyr)
file_name = "GettingandCleaningData.zip"
file_URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Downloading the zip file from the url
if (!file.exists(file_name)){
   download.file(file_URL, file_name, method="curl")
}  
#If the file exists, then Unzip the Zip file
if (!file.exists("UCI HAR Dataset")) { 
  unzip(file_name) 
}

#Extracting the files from the zip folder and converting them to dataframes and check the first 5 rows of the dataframe
features = read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))

x_testdata = read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
x_traindata = read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

y_traindatalabel = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
y_testdatalabel = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_testdata = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_traindata = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

activity_label = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))



#1. Merges the training and the test sets to create one data set.
dataset=rbind(x_traindata,x_testdata)
Activity=rbind(y_traindatalabel,y_testdatalabel)
names(Activity) = 'Activity'
Subject=rbind(subject_traindata,subject_testdata)
names(Subject) = 'Subject'
FinalDataSet=cbind(Subject,Activity,dataset)
str(FinalDataSet)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
FinalDataSet=select(FinalDataSet,Subject, Activity, contains("mean"), contains("std"))
str(FinalDataSet)


#3. Uses descriptive activity names to name the activities in the data set
FinalDataSet$Activity = activity_label[FinalDataSet$Activity,2]
head(FinalDataSet$Activity)

#4. Appropriately labels the data set with descriptive variable names.
names(FinalDataSet)=gsub("Acc", "Accelerometer", names(FinalDataSet))
names(FinalDataSet)=gsub("Gyro", "Gyroscope", names(FinalDataSet))
names(FinalDataSet)=gsub("BodyBody", "Body", names(FinalDataSet))
names(FinalDataSet)=gsub("Mag", "Magnitude", names(FinalDataSet))
names(FinalDataSet)=gsub("^t", "Time", names(FinalDataSet))
names(FinalDataSet)=gsub("^f", "Frequency", names(FinalDataSet))
names(FinalDataSet)=gsub("tBody", "TimeBody", names(FinalDataSet))
names(FinalDataSet)=gsub("-mean()", "Mean", names(FinalDataSet), ignore.case = TRUE)
names(FinalDataSet)=gsub("-std()", "STD", names(FinalDataSet), ignore.case = TRUE)
names(FinalDataSet)=gsub("-freq()", "Frequency", names(FinalDataSet), ignore.case = TRUE)
names(FinalDataSet)=gsub("angle", "Angle", names(FinalDataSet))
names(FinalDataSet)=gsub("gravity", "Gravity", names(FinalDataSet))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData = group_by(FinalDataSet,Subject, Activity) 
TidyData = summarise_all(TidyData,funs(mean))
write.table(TidyData, "TidyData.txt", row.name=FALSE)
fix(TidyData)