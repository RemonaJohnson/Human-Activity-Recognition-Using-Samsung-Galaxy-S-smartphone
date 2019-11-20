# Human Activity Recognition Using Smartphones Data Set - Data Preparation #

The R Script - **run_analysis.R** contains the R Code on the data preparation. It contains the code to download the dataset from UCI Machine Learning Repository and the process of cleaning the dataset. This tidy data can be used later for analysis purposes.

These are the steps that has been used based on the requirements of the assignment for cleaning the dataset:

-	The [**Human Activity Recognition Using Smartphones Data Set**](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded from UCI Machine Learning Repository. 
-	The files are extracted from the zip file and are assigned to data frames to easily work on them.
 ```
features : List of all features
x_testdata : Test set
x_traindata : Training set
y_traindatalabel : Training labels
y_testdatalabel : Test labels
subject_testdata : Contains the details of 9 subjects who performed the activity for each window sample. 
subject_traindata : Contains the details of 21 subjects who performed the activity for each window sample. 
activity_label = Activity names for each class labels
 ```
-	Merge the training and testing dataset into one large dataset (**FinalDataSet**) using rbind and cbind. The **FinalDataSet** has 10299 rows and 563 columns.
-	Extract only the columns that contains the information on standard deviation and mean. After extraction, the **FinalDataSet** has 10299 rows and 88 columns.
-	Give the proper activity label to each Activity number in the **FinalDataSet** using the **activities_label** dataframe.
-	Clean the abbreviations in the columns names for more consistency in the dataset. These are the changes that has been made in the dataset:
 ```
"Acc" to "Accelerometer"
"Gyro" to "Gyroscope"
"BodyBody" to "Body"
"Mag" to "Magnitude"
"tBody" to "TimeBody"
"-mean()" to "Mean"
"-std()" to "STD"
"angle" to "Angle"
"gravity" to "Gravity"
Column names that start with "t" to "Time"
Column names that start with "f" or those column names that contain "-freq()" to "Frequency"
 ```
-	A final **TidyData** is created that has the average of each attribute for each activity for each individual subject. This tidy dataset is exported and stored in "**TidyData.txt**"







