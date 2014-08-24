Getting and Cleaning Data Course Project
================================

## Running the script

*Preconditions:*  It is assumed you have the original dataset for this project  _Human Activity Recognition Using Smartphones Dataset Version 1.0_  downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). and unzipped to a folder called "UCI HAR Dataset" located in your working directory.

The only script required for processing this data is run_analysis.R.  To process the data call the function run_analysis. Assuming run_analysis.R is in your working directory the code can be run as follows:

source("run_analysis.R")

run_analysis()

The function returns the final tidy dataset (ie averages of mean, std and mean frequency measures) as well as writing the first tidy data set (Tidied measures of mean, mean frequency and std extracted from the original dataset) and the second, returned, tidy dataset to the the tidyoutput directory under the working directory as the files tidydataset1.csv and tidydatset2.txt.  For more detailed information of data transformation please see codeBook.md. 
