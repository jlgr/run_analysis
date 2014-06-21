run_analysis
============

Scripts to get a tidy data set 

In order to get a tidy data set using the Samsung data, you should uncompress the data from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

At your current directory must exist a subdirectory:

UCI HAR Dataset

At command line from your current directory you should execute:

 Rscript run_analysis.R
 
After a while you will get two files with tidy data sets:

tidyfull.csv
tidyavg.csv

If you prefer, you can run the script from R interactive mode by typing 

source("run_analysis.R")

Get sure that your working directory is the parent directory of UCI HAR Dataset


