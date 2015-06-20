# Getting-and-Cleaning-Data-project
Getting and Cleaning Data week three course project


"run_analysis.R" script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.

Informations about how the data were collected are available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset included the following data files:
=======================================================
- 'features.txt': List of all features.

- 'activity_labels.txt': List of class labels and their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': ID's of subjects in the training data


A brief description of the script:
==================================
The run_analysis.R script merges data from a number of .txt files and produces a tidy data set which may be used for further analysis.

- Loads the useful "reshape2" package;

- Reads all required .txt files (3 test files, 3 training files, 1 activity labels file, 1 feature files);

- Renames the columns of training and test datasets with the appropriate feature's name;

- Merge together the three test data and the three training data, and then together again in one data.frame ("FullData")

- Using the "grep" function, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created    

- Using the "merge" function, descriptive activity names are merged with the mean/std values dataset, to get one dataset with descriptive activity names

- Lastly, with the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the "tidyData.txt" file.

The tidy dataset is available here:
https://s3.amazonaws.com/coursera-uploads/user-79bc3638751665e5f2de754d/973502/asst-3/d63a33b0177111e5bd26d991f7ae653f.txt

A description of "tidyData.txt" file may be found in the "CodeBook.md" file. 


Acknowledgements:
=================
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


