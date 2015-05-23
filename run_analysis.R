# 
# This program is a part of project 1 assignment. 
# Learning how to combine data.
# Created by fourlin88 May 2015
# 
# Step 1 
# To merge the training and the test sets into one data set.
#
train_data <- read.table("./data/train/X_train.txt")
train_label <- read.table("./data/train/y_train.txt")
train_subject <- read.table("./data/train/subject_train.txt")
test_data <- read.table("./data/test/X_test.txt")
test_label <- read.table("./data/test/y_test.txt") 
test_subject <- read.table("./data/test/subject_test.txt")
join_data <- rbind(train_data, test_data)
join_label <- rbind(train_label, test_label)
join_subject <- rbind(train_subject, test_subject)

# Step 2. 
# To extract only the measurements on the mean and standard 
# deviation for each measurement. 
# 
features <- read.table("./data/features.txt")
mean_std <- grep("mean\\(\\)|std\\(\\)", features[, 2])
join_data <- join_data[, mean_std]


# Step 3. 
# to use descriptive activity names to name the activities in 
# the data set
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activity_label <- activity[join_label[, 1], 2]
join_label[, 1] <- activity_label
names(join_label) <- "activity"

# Step 4. 
# to appropriately label the data set with descriptive activity names. 
#
names(join_subject) <- "subject"
clean_data <- cbind(join_subject, join_label, join_data)

###### write to file
write.table(clean_data, "clean_data.txt", row.names=FALSE) 


# Step 5. 
# To create a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
#
subject_length <- length(table(join_subject))
activity_length <- dim(activity)[1]
column_length <- dim(clean_data)[2]
final_data <- matrix(NA, nrow=subject_length*activity_length, ncol=column_length) 
final_data <- as.data.frame(final_data)
colnames(final_data) <- colnames(clean_data)
row <- 1
for(i in 1:subject_length) {
    for(j in 1:activity_length) {
        final_data[row, 1] <- sort(unique(join_subject)[, 1])[i]
        final_data[row, 2] <- activity[j, 2]
        bool1 <- i == clean_data$subject
        bool2 <- activity[j, 2] == clean_data$activity
        final_data[row, 3:column_length] <- colMeans(clean_data[bool1&bool2, 3:column_length])
        row <- row + 1
    }
}
###### Write to a file
write.table(final_data, "data_final.txt", row.names=FALSE) 

