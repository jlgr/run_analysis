CodeBook
============
V1.1



The run_analysis.R script transforms the original Samsung Data Set at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


From the whole collection of files, the script use the following files:


1. activity_labels.txt : Links the class labels with their activity name.
2. features.txt : List of all features. (Variables)
3. subject_test.txt: Each row identifies the subject who performed the activity for each window sample.
5. y_test.txt : Test labels.
6. subject_train.txt :Each row identifies the subject who performed the activity for each window sample.
7. X_train.txt: Training set.
8. y_train.txt : Training labels.

For more information about the files and variables see the README.txt and features_info.txt included with the original datasets.

As shown, the files are part of tow datasets and their relational files and labels. Only the variables related to the mean and standard deviation for each measurement are extracted. See features.txt file.


The transformation process do the next tasks:


    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


After run the run_analysis.R script you will get two files with tidy datasets for further analysis.

The output files are:

tidyfull.csv - Big data set.
tidyavg.csv -  Second data set (task 5), with average data.


For a full description of columns extracted see features.txt file included with dataset.

Running the script
==================
To run the run_analysis.R script

Inside R:


> source("run_analysis.R")

Get sure that your working directory is the parent directory of "UCI HAR Dataset" directory.

From command line:

Go to parent directory of "UCI HAR Dataset" directory.

$ Rscript run_analysis.R

In both cases the output files will be at working directory.


License:
========
The run_analysis.R script is an original programming work done with specifications at the coursera "Getting and Cleaning Data"
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD.

All info is obtained from authors of datasets and the coursera "Getting and Cleaning Data"
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD .

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited by the original authors.


