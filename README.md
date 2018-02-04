# Getting and Cleaning Data Course Project

A tidied data was created from the "messy" [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Tidying a raw data set is very important before performing any analyses.

Note that all necessary files were extracted beforehand from the downloaded zip file of the data set to a folder that is also the working directory. The file names are: X_test.txt, X_train.txt, y_test.txt, y_train.txt, activity_labels.txt, features.txt, subject_test.txt, and subject_train.txt. 

The R Script [run_analysis.R](https://github.com/yoowayey/DSS-module3-course-project/blob/master/run_analysis.R) satisfied the following:

1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.


The output text file of this project, [tidyave.txt] (https://github.com/yoowayey/DSS-module3-course-project/blob/master/tidyave.txt), consists of the averaged measurements across activities and subjects.



