# Code book for Course Project Getting and Cleaning Data

## Original datset

The original dataset for this project was the _Human Activity Recognition Using Smartphones Dataset Version 1.0_.  The original dataset was dowloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).   The data unzips to a folder called UCI HAR Dataset.  There is full documentation for the dataset in the top level of the directory in the following files: README.txt, features.txt, features_info.txt, activity_labels.txt. For this project only the processed data was used (ie, the raw data in the two "initerial signals" was not used).

## Transformations

Transformations of the data took place in three segments:

1. The two parts of the dataset (train and test) were each assembled from their constituent parts and then merged into one large data set.  

Assembly involved

 + The records data (located in the X----.txt files in the train and test directories) was read into data.frame
 + The names for the variables in the features.txt file and used as the variable names for the dataframe
 + A subject variable was added to the dat.frame and populated using the data in the subjects-----.txt file
 + An activitycode variable was added to the dataframe and populated using the data in the y---.txt file

2. From this large dataset the variables measuring the mean and standard deviation as well as the subject and activitycode variables were extracted.  In addition further cleanupo and enhancement was carried out at this time.  The dataset produced at this stage was saved to the file workingdirectory/tidyoutput/tidydatset1.csv.   The processing steps are outlineed in more detail below:

 + *Extracting mean and std measures:* Given that mean frequency is a form of mean vaiables labeled this way were  extracted as well as other means.  On the other hand, when mean was used a part of a calculation for a variable this was not a mean and not extracted (eg angle(tBodyGyroJerkMean,gravityMean)).  The new datset had 81 variables consisting of subject, activitycode and 79 extracted mean and std measures.
 + *Applied descriptive activity names:* a new variable activity was added based on looking up the activitycode for the record in activity labels data read in from the file activity_labels.txt.  After populating the activity variable with descriptive names the activity code variable was deleted.
 + *Made variable names more descriptive and consistent:* Using a series of passes of the gsub function the names of the variables were made more meaningful and corrected.  These improvements included: getting rid of '-' and "()", getting rid of repeated words, using camelcase for variable names and expanding contractions like t to time and f to frequency.
 
3. A final tidy dataset consisting of averages (mean) of the measurements for each subject and activity combination was calculated.  This dataset consisted of 81 variables and 180 records (ie 30 subjects * 6 activities).  At this time the variable names were again modified to reflect that the values were now means of the original values.  For example, if the string Std occured in variable name it was replaced with MeanOfStds.  This dataset was written out to the file workingdirectory/tidyoutput/tidydatset2.txt as well as being returned by the function.  

## Data Dictionary for Final Tidy Dataset


### 1 subject
* integer
* Indentifier for subject.
 
 
### 2 activity
* factor.  Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
* Activity subject was carrying out
 
 
### 3 timeBodyAccMeanOfMeansX
* numeric
* The mean of means measured in the time domain, normalized readings of body acceleration from an accelerometer on the x axis.
 
 
### 4 timeBodyAccMeanOfMeansY
* numeric
* The mean of means measured in the time domain, normalized readings of body acceleration from an accelerometer on the y axis.
 
 
### 5 timeBodyAccMeanOfMeansZ
* numeric
* The mean of means measured in the time domain, normalized readings of body acceleration from an accelerometer on the z axis.
 
 
### 6 timeBodyAccMeanOfStdsX
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body acceleration from an accelerometer on the x axis.
 
 
### 7 timeBodyAccMeanOfStdsY
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body acceleration from an accelerometer on the y axis.
 
 
### 8 timeBodyAccMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body acceleration from an accelerometer on the z axis.
 
 
### 9 timeGravityAccMeanOfMeansX
* numeric
* The mean of means measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the x axis.
 
 
### 10 timeGravityAccMeanOfMeansY
* numeric
* The mean of means measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the y axis.
 
 
### 11 timeGravityAccMeanOfMeansZ
* numeric
* The mean of means measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the z axis.
 
 
### 12 timeGravityAccMeanOfStdsX
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the x axis.
 
 
### 13 timeGravityAccMeanOfStdsY
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the y axis.
 
 
### 14 timeGravityAccMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of gravity acceleration from an accelerometer on the z axis.
 
 
### 15 timeBodyAccJerkMeanOfMeansX
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the x axis.
 
 
### 16 timeBodyAccJerkMeanOfMeansY
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the y axis.
 
 
### 17 timeBodyAccJerkMeanOfMeansZ
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the z axis.
 
 
### 18 timeBodyAccJerkMeanOfStdsX
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the x axis.
 
 
### 19 timeBodyAccJerkMeanOfStdsY
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the y axis.
 
 
### 20 timeBodyAccJerkMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk acceleration from an accelerometer on the z axis.
 
 
### 21 timeBodyGyroMeanOfMeansX
* numeric
* The mean of means measured in the time domain, normalized readings of body angular velocity from a gyroscope on the x axis.
 
 
### 22 timeBodyGyroMeanOfMeansY
* numeric
* The mean of means measured in the time domain, normalized readings of body angular velocity from a gyroscope on the y axis.
 
 
### 23 timeBodyGyroMeanOfMeansZ
* numeric
* The mean of means measured in the time domain, normalized readings of body angular velocity from a gyroscope on the z axis.
 
 
### 24 timeBodyGyroMeanOfStdsX
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body angular velocity from a gyroscope on the x axis.
 
 
### 25 timeBodyGyroMeanOfStdsY
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body angular velocity from a gyroscope on the y axis.
 
 
### 26 timeBodyGyroMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body angular velocity from a gyroscope on the z axis.
 
 
### 27 timeBodyGyroJerkMeanOfMeansX
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the x axis.
 
 
### 28 timeBodyGyroJerkMeanOfMeansY
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the y axis.
 
 
### 29 timeBodyGyroJerkMeanOfMeansZ
* numeric
* The mean of means measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the z axis.
 
 
### 30 timeBodyGyroJerkMeanOfStdsX
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the x axis.
 
 
### 31 timeBodyGyroJerkMeanOfStdsY
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the y axis.
 
 
### 32 timeBodyGyroJerkMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of body jerk angular velocity from a gyroscope on the z axis.
 
 
### 33 timeBodyAccMagMeanOfMeans
* numeric
* The mean of means measured in the time domain, normalized readings of magnitude of body acceleration from an accelerometer.
 
 
### 34 timeBodyAccMagMeanOfStds
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of magnitude of body acceleration from an accelerometer.
 
 
### 35 timeGravityAccMagMeanOfMeans
* numeric
* The mean of means measured in the time domain, normalized readings of magnitude of gravity acceleration from an accelerometer.
 
 
### 36 timeGravityAccMagMeanOfStds
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of magnitude of gravity acceleration from an accelerometer.
 
 
### 37 timeBodyAccJerkMagMeanOfMeans
* numeric
* The mean of means measured in the time domain, normalized readings of magnitude of body jerk acceleration from an accelerometer.
 
 
### 38 timeBodyAccJerkMagMeanOfStds
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of magnitude of body jerk acceleration from an accelerometer.
 
 
### 39 timeBodyGyroMagMeanOfMeans
* numeric
* The mean of means measured in the time domain, normalized readings of magnitude of body angular velocity from a gyroscope.
 
 
### 40 timeBodyGyroMagMeanOfStds
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of magnitude of body angular velocity from a gyroscope.
 
 
### 41 timeBodyGyroJerkMagMeanOfMeans
* numeric
* The mean of means measured in the time domain, normalized readings of magnitude of body jerk angular velocity from a gyroscope.
 
 
### 42 timeBodyGyroJerkMagMeanOfStds
* numeric
* The mean of standard deviations measured in the time domain, normalized readings of magnitude of body jerk angular velocity from a gyroscope.
 
 
### 43 freqBodyAccMeanOfMeansX
* numeric
* The mean of means measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the x axis.
 
 
### 44 freqBodyAccMeanOfMeansY
* numeric
* The mean of means measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the y axis.
 
 
### 45 freqBodyAccMeanOfMeansZ
* numeric
* The mean of means measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the z axis.
 
 
### 46 freqBodyAccMeanOfStdsX
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the x axis.
 
 
### 47 freqBodyAccMeanOfStdsY
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the y axis.
 
 
### 48 freqBodyAccMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the z axis.
 
 
### 49 freqBodyAccMeanOfMeanFreqsX
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the x axis.
 
 
### 50 freqBodyAccMeanOfMeanFreqsY
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the y axis.
 
 
### 51 freqBodyAccMeanOfMeanFreqsZ
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body acceleration from an accelerometer on the z axis.
 
 
### 52 freqBodyAccJerkMeanOfMeansX
* numeric
* The mean of means measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the x axis.
 
 
### 53 freqBodyAccJerkMeanOfMeansY
* numeric
* The mean of means measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the y axis.
 
 
### 54 freqBodyAccJerkMeanOfMeansZ
* numeric
* The mean of means measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the z axis.
 
 
### 55 freqBodyAccJerkMeanOfStdsX
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the x axis.
 
 
### 56 freqBodyAccJerkMeanOfStdsY
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the y axis.
 
 
### 57 freqBodyAccJerkMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the z axis.
 
 
### 58 freqBodyAccJerkMeanOfMeanFreqsX
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the x axis.
 
 
### 59 freqBodyAccJerkMeanOfMeanFreqsY
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the y axis.
 
 
### 60 freqBodyAccJerkMeanOfMeanFreqsZ
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body jerk acceleration from an accelerometer on the z axis.
 
 
### 61 freqBodyGyroMeanOfMeansX
* numeric
* The mean of means measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the x axis.
 
 
### 62 freqBodyGyroMeanOfMeansY
* numeric
* The mean of means measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the y axis.
 
 
### 63 freqBodyGyroMeanOfMeansZ
* numeric
* The mean of means measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the z axis.
 
 
### 64 freqBodyGyroMeanOfStdsX
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the x axis.
 
 
### 65 freqBodyGyroMeanOfStdsY
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the y axis.
 
 
### 66 freqBodyGyroMeanOfStdsZ
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the z axis.
 
 
### 67 freqBodyGyroMeanOfMeanFreqsX
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the x axis.
 
 
### 68 freqBodyGyroMeanOfMeanFreqsY
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the y axis.
 
 
### 69 freqBodyGyroMeanOfMeanFreqsZ
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of body angular velocity from a gyroscope on the z axis.
 
 
### 70 freqBodyAccMagMeanOfMeans
* numeric
* The mean of means measured in the frequency domain, normalized readings of magnitude of body acceleration from an accelerometer.
 
 
### 71 freqBodyAccMagMeanOfStds
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of magnitude of body acceleration from an accelerometer.
 
 
### 72 freqBodyAccMagMeanOfMeanFreqs
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of magnitude of body acceleration from an accelerometer.
 
 
### 73 freqBodyAccJerkMagMeanOfMeans
* numeric
* The mean of means measured in the frequency domain, normalized readings of magnitude of body jerk acceleration from an accelerometer.
 
 
### 74 freqBodyAccJerkMagMeanOfStds
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of magnitude of body jerk acceleration from an accelerometer.
 
 
### 75 freqBodyAccJerkMagMeanOfMeanFreqs
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of magnitude of body jerk acceleration from an accelerometer.
 
 
### 76 freqBodyGyroMagMeanOfMeans
* numeric
* The mean of means measured in the frequency domain, normalized readings of magnitude of body angular velocity from a gyroscope.
 
 
### 77 freqBodyGyroMagMeanOfStds
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of magnitude of body angular velocity from a gyroscope.
 
 
### 78 freqBodyGyroMagMeanOfMeanFreqs
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of magnitude of body angular velocity from a gyroscope.
 
 
### 79 freqBodyGyroJerkMagMeanOfMeans
* numeric
* The mean of means measured in the frequency domain, normalized readings of magnitude of body jerk angular velocity from a gyroscope.
 
 
### 80 freqBodyGyroJerkMagMeanOfStds
* numeric
* The mean of standard deviations measured in the frequency domain, normalized readings of magnitude of body jerk angular velocity from a gyroscope.
 
 
### 81 freqBodyGyroJerkMagMeanOfMeanFreqs
* numeric
* The mean of mean frequencies measured in the frequency domain, normalized readings of magnitude of body jerk angular velocity from a gyroscope.
 
 
