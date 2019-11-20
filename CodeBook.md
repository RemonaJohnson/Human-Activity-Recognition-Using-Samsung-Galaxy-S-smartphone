# Human Activity Recognition Using Smartphones Data Set - Data Preparation #

The R Script - run_analysis.R contains the R Code on the data preparation. It contains the code to download the dataset from UCI Machine Learning Repository and the process of cleaning the dataset. This tidy data can be used later for analysis purposes.

These are the steps that has been used based on the requirements of the assignment for cleaning the dataset:

-	The [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded from UCI Machine Learning Repository. 
-	The files are extracted from the zip file and are assigned to data frames to easily work on them.
 ```
-	features : List of all features
-	x_testdata : Test set
o	x_traindata : Training set
o	y_traindatalabel : Training labels
o	y_testdatalabel : Test labels
o	subject_testdata : Contains the details of 9 subjects who performed the activity for each window sample. 
o	subject_traindata : Contains the details of 21 subjects who performed the activity for each window sample. 
o	activity_label = Activity names for each class labels
 ```
-	Merge the training and testing dataset into one large dataset (FinalDataSet) using rbind and cbind. The FinalDataSet has 10299 rows and 563 columns.
-	Extract only the columns that contains the information on standard deviation and mean. After extraction, the FinalDataSet has 10299 rows and 88 columns.
-	Give the proper activity label to each Activity number in the FinalDataSet using the activities_label dataframe.
-	Clean the abbreviations in the columns names for more consistency in the dataset. These are the changes that has been made in the dataset:
 ```
o	"Acc" to "Accelerometer"
o	"Gyro" to "Gyroscope"
o	"BodyBody" to "Body"
o	"Mag" to "Magnitude"
o	"tBody" to "TimeBody"
o	"-mean()" to "Mean"
o	"-std()" to "STD"
o	"angle" to "Angle"
o	"gravity" to "Gravity"
o	Column names that start with "t" to "Time"
o	Column names that start with "f" or those column names that contain "-freq()" to "Frequency"
 ```
-	A final TidyData is created that has the average of each attribute for each activity for each individual subject. This tidy dataset is exported and stored in "TidyData.txt"

- first list item
- second list time

## Some code ##

Here is a little code:

 ```
 plot(orstationc$elev, orstationc$tann)
 ```
and some more text, possibly *decorated* or **otherwise formatted**.








