run_analysis
============

Scripts to get a tidy data set 

In order to get a tidy data set using the Samsung data, you should uncompress the data from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

At your current directory must exist a subdirectory:

UCI HAR Dataset

At command line from your current directory you should execute:

 Rscript run_analysis.R
 
The script will do the following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

After a while you will get two files with tidy data sets:

tidyfull.csv - Main tidy data set
tidyavg.csv  - Second data set with averages.

If you prefer, you can run the script from R interactive mode by typing 

source("run_analysis.R")

Get sure that your working directory is the parent directory of UCI HAR Dataset


