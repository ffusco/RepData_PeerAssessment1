## 1.Merges the training and the test sets to create one data set.

      ## Set my working directory on the data directory
      setwd("c:/R_Projects/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
      
      ## Load the useful "reshape2" package
      library(reshape2)
      
      ## Read the activity number and description and rename the columns
      activity_labels <- read.table("activity_labels.txt",col.names 
                                    = c("activityNumber","activityDescription"))
      
      ## Read the 561 features
      features <- read.table("features.txt")
      
      ## Extract the names of the features
      featureNames <- features[, 2]
      
      ## Read the three test file data
      X_test <- read.table("test/X_test.txt")
      y_test <- read.table("test/y_test.txt")
      subject_test <- read.table("test/subject_test.txt")
      
      ## Read the train data
      X_train <- read.table("train/X_train.txt")
      y_train <- read.table("train/y_train.txt")
      subject_train <- read.table("train/subject_train.txt")
      
      ## Set the appropriate columnNames to the three test data
      colnames(X_test) <- featureNames
      colnames(subject_test) <- "subjectNumber"
      colnames(y_test) <- "activityNumber"
      
      ## Set the appropriate columnNames to the three training data
      colnames(X_train) <- featureNames
      colnames(subject_train) <- "subjectNumber"
      colnames(y_train) <- "activityNumber"
      
      ## Merge together the three test file data
      test <- cbind(subject_test, y_test, X_test)
      
      ## Merge together the three training file data
      training <- cbind(subject_train, y_train, X_train)
      
      ## Merge together test and training data
      FullData <- rbind(test, training)
     
## 2.Extracts only the measurements on the mean and standard deviation 
## for each measurement.
      
      ## Extract columns with "mean" in the name
      meanColNames <- names(FullData)[grep("mean",names(FullData),ignore.case=TRUE)]
      
      ## Extract columns with "std" in the name
      stdColNames <- names(FullData)[grep("std",names(FullData),ignore.case=TRUE)]
      
      ## Extract subset of FullData with only "std" and "mean" columns
      std_mean_Data <- FullData[,c("subjectNumber","activityNumber",
                                   meanColNames, stdColNames)]

## 3.Uses descriptive activity names to name the activities in the data set
      
      ## Merge the activities with the mean-std values dataset 
      Descr_std_mean_Data <- merge(activity_labels, std_mean_Data, 
                                   by.x="activityNumber", by.y="activityNumber",all=TRUE)
      
## 4.Appropriately labels the data set with descriptive variable names. 
      
      ## Using the melt function to set descriptive activity names
      Descr_melt <- melt(Descr_std_mean_Data, id = c("activityNumber", 
                                                     "activityDescription", "subjectNumber"))
      
## 5.From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
      
      ## dcast for each activity and each subject
      tidyData <- dcast(Descr_melt, activityNumber + activityDescription + subjectNumber ~ variable, mean)
      
      ## Create the .txt final datset
      write.table(tidyData, "tidyData.txt", row.names = FALSE)