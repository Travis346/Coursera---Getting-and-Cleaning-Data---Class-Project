##---------------------HEADING-------------------------------
## Coursera - Getting and Cleaning Data - Course Project
## File Created by Travis E. Lipstein - AUG 2015
## Combine, clean and Report Human Activity Recognition Using 
##      Smartphones Data Set.
## Data Set Link: <http://archive.ics.uci.edu/ml/datasets/...
##      ...Human+Activity+Recognition+Using+Smartphones>
##----------------------INSTRUCTIONS-------------------------
## Download data set and place 'run_analysis.R' in the main 
##      directory containing the 'train', 'test' and 
##     'features.txt'.  Upon runing the script a new txt 
##      file will be generated reporting the mean values for
##      each variable for each subject and activity.
##------------------------SCRIPT-----------------------------

#Set working directory. NOTE: 'test' and 'train' must be in folder. 
main_folder <- getwd()
test_folder <- paste(main_folder, "/test", sep="")
train_folder <- paste(main_folder, "/train", sep="")

#Import raw data text files
setwd(main_folder)
activity_labels <- read.table("activity_labels.txt", col.names = 
        c("Activity_Number", "Activity_Name"
        )
    )
features_all <- read.table("features.txt")

##Load Testing Data
setwd(test_folder)
subjects_test <- read.table("subject_test.txt")
activity_numbers_test <- read.table("y_test.txt")
activity_names_test <- data.frame(
    activity_labels$Activity_Name[activity_numbers_test[,]]
    )
colnames(activity_names_test) <- c("Activity_Names")
data_test <- read.table("X_test.txt")

##Load Training Data
setwd(train_folder)
subjects_train <- read.table("subject_train.txt")
activity_numbers_train <- read.table("y_train.txt")
activity_names_train <- data.frame(
    activity_labels$Activity_Name[activity_numbers_train[,]]
    )
colnames(activity_names_train) <- c("Activity_Names")
data_train <- read.table("X_train.txt")

##Combine Test and Train Data Sets
subjects <- rbind(subjects_test, subjects_train)
colnames(subjects) <- c("Subject")
activity_numbers <- rbind(
    activity_numbers_test, activity_numbers_train
    )
colnames(activity_numbers) <- c("Activity_Number")
activity_names <- rbind(activity_names_test, activity_names_train)
colnames(activity_names) <- c("Activity_Name")
data_raw <- rbind(data_test, data_train)
colnames(data_raw) <- features_all$V2

#Apply filters to all_raw
data_filtered <- data_raw[ ,grep("mean()", colnames(data_raw))]
data_filtered <- cbind(data_filtered, data_raw[ ,grep("std()", colnames(data_raw))])

##Combine all variables
all_data <- cbind(subjects, activity_numbers, activity_names, data_filtered)
all_data <- all_data[order(all_data$Subject, all_data$Activity_Number), ]

##Produce Ouput
output <- aggregate(all_data, by=list(
    Subject=Subject, Activity_Name=Activity_Name), FUN=mean
    )
output <- output[order(output$Subject, output$Activity_Number), ]
output[,3] <- NULL
output[,4] <- NULL

##Write desired output file in main directory
setwd(main_folder)
write.table(output, file="Output_Class-Project_LIPSTEIN.txt", row.names=FALSE)

#Remove all variables from environment
rm(list=ls(all=TRUE))