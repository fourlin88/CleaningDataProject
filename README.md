Coursera Getting and Cleaning Data
+project1
========================================

The script run_analysis.R does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Here is the explanation how run_analysis.R script works.

* Download the data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip the file to current working directory and rename "UCI HAR Dataset"" to "data" to make it simpler. 
* Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
* run the program "run_analysis.R" using either R or R-studio. 
* The program will produce two files: "clean_data.txt"" and "data_final.txt""
* We can read the file using the usual read.table("data_final.txt")
