## Course Project - "Getting & Cleaning Data"

## Data source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Topic about wearable computing – details on the experiments and other relevant data can be retrieved from these links.
Device:  smartphone (Samsung Galaxy S II) – worn on the waist
Record captured by embedded accelerometer and gyroscope:
•	3-axial linear acceleration
•	3-axial angular velocity at a constant rate of 50Hz
•	561-feature vector with time & frequency domain variable
•	Activity label
•	Identifier of subject in the experiment
Dataset - randomly partitioned into two sets
1.	70% of the volunteers was selected for generating the training data
2.	30% the test data 
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


## Purpose of project:  an exercise to collect, work with and clean data.

## Project requirement for submission: 
1) tidy dataset
2) link to Github 
3) CodeBook.md 
4) README.md

## Datasets:
'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.

## Project instructions: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

=====================================================================================
General process before creating run_analysis.R scripts involves collecting data by downloading all the necessary data files from the given websites, browsing through all the README and information, finding out about the data by applying various R functions  - dim(), str(), head(), tail(), View() etc., brainstorming the logical process and identifying any common identifier in each data files in order to join the data etc. etc . . . 

R scripts – run_analysis.R – explains the complete process to derive at the end result which is a tidy data set with the average of each variable for each activity and each subject.

1) Read data files.
These scripts will read all the relevant data .csv files (downloaded from the data source referenced above) from the user’s local directory (~/project).   Relevant data sets include: activities, features, subject for the training set, subject for the test set, experiment data for training, and experiment data for test. 
2) Merge files into one complete dataset with column and row labels in the following steps:
a) Join the training label with the activities data by binding the columns and matching with their common factor V1 column.
b) Join the test label with the activities data by binding the columns and matching with their common factor V1 column.
c) Join the training and test activities together by binding their rows since dim() shows that both data sets have the same number of rows.
d) Join the training and test subject data sets together by binding their rows since dim() shows that both data sets have the same number of rows.
e) Merge the subject and activities data sets.
f) Combine the training and test measurement data sets.
g) Assign the features data to a header variable.
h) Add the header to the combined training & test data from step (f).
i) Merge the row labels subject & activities to the combined training & test data from step (h).
j) Name the first 4 columns to easier readable descriptive column names.
3) Create a subset by extracting all the mean and standard deviation measurements by using the grep() function.  Using the double backslashes (\\) to escape those columns for the mean frequency measurement  because they are weighted average.   It is important to set the ignore.case=TRUE in order to pull all the mean and standard deviation columns properly, regardless whether the string is upper or lower case.   Apply descriptive names for activities by changing them from factor to character variables.   Rejoin the mean and standard deviation subset with the subject and activities.   Clean up the column header by removing or replacing texts to provide more descriptive column names to derive at a complete tidy data set (10299 observations by 68 variables).
4) Create a new data set (independent from the one from step 3.  Load the dplyr() package.   Group the tidy data set from step 3 by Subject ID and Activity Type.  Summarize and get the average of each variable for each activity and each subject to derive at the new tidy data set (180 observations by 68 variables).
       

