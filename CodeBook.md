Getting and Cleaning Data Course 
Project1  CodeBook
=================================================

The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* Unzip this file and rename this directory "UCI HAR Dataset" to "data" 
* Open and read README.txt inside "data" directory to find the characteristic of the data. 

* Here is how the prgram works (run_analysis.R)  
 1. Read train data: 
    X_train.txt, y_train.txt, subject_train.txt from the "./data/train" folder. 
    
    Read test data:
    X_test.txt, y_test.txt, subject_test.txt from the "./data/test" folder. 
    
    here is the summary of the data file and the variable names including dimension. 
    
    -|data-file-name	   | variable-name |	dimension
    -|X_train.txt	     |  train_data	|    7352 x 561
    y_train.txt	       train_label	   7352 x 1
    subject_train.txt	 train_subject	 7352 x 1
    X_test.txt	        test_data	     2947 x 561
    y_test.txt	        test_label	    2947 x 1
    subject_test.txt	  test_subject	  2947 x 1

 2. Concatenate train data and test data to a variable called join_data. 
 
 3. Read the features.txt file from the "/data" and pun into a variable called "features" and only extract the measurements on the mean and standard deviation. 
 
 4. Filter join_data to include only mean and std deviation measurements from step 3 above. The result is 10299 x 66 data frame. 

 5. Read the activity_labels.txt file from the "./data"" folder and put into variable called "activity". 
 
 6. Clean the activity names remove underscore and capitalize the letter immediately after the underscore.  
 
 7. Transform the values of *join_label* according to the *activity* data frame. 
 
 8. Combine the *join_subject*, *join_label* and *join_data* by column to get 10299x68 data frame, *cleaned_data*. Name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1.  
 
 9. Write the *clean_data* out to "clean_data.txt" file in current working directory.  
 
 10. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. There are 30 unique subjects and 6 unique activities, which make a 180 combination. For each combination, we calculate the mean of each measurement. After initializing the *final_data* data frame and performing the two for-loops, we get a 180x68 data frame.
 
 12. Write the final_data to "data_final.txt" file in current working directory. 
 
