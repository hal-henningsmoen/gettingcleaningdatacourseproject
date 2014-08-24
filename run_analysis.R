library(reshape2)
library(plyr)
library(stringr)
run_analysis<-function(){
        ##1 Merge the training and the test sets to create one data set.
        # Start by using the assembledataset function to put together all of the parts
        # of the datasets (IE Replace default variable names with features names and add 
        # columns for subject and activity code to each row)
        traindata<-assembledataset("train")
#return(traindata)
        testdata<-assembledataset("test")
        # Merge the two datasets into one
        alldata<-rbind(testdata, traindata)
        
        ##2 Extract only means and standard deviations for each measurement        
        justmeans<-alldata[,grepl("mean(Freq){0,1}\\(\\)|std|activitycode|subject",names(alldata))]
        ##3 Use descriptive activity names to name activities in the data set 
        justmeans<- cbind(activity=activitylabels(justmeans$activitycode), justmeans)
        justmeans$activitycode<-NULL
        ##4 Give all the variables descriptive names
        names(justmeans)<-nicenames(names(justmeans))
        ## Write the results out to a file 
        outdir<-paste0(getwd(), "/tidyoutput/")
        if (!file.exists(outdir)){
                dir.create(outdir)
        }
        outfile<-paste0(outdir, "tidydataset1.csv")
        write.table(justmeans, outfile, sep=",", col.names=TRUE)
        
        # Continue with project. 
        # Read in tidydataset1
        indata<-read.csv(outfile, header=TRUE)
        #5 Create dataset with the average of each variable for each activity and subject
        #Create a very long, narrow table  
        melted <- melt(indata, id.vars=c("subject", "activity"))
        #Calculate mean for every vbl for every subject activity pair 
        out1<-ddply(melted, c("subject", "activity", "variable"), summarise, mean = mean(value))
        # Dcast this table to a final wide tidy dataset with one row for each subject/activity 
        # combination (Ie 180 rows)
        tidydata2<-dcast(melted, subject + activity ~ variable , mean )
        # The variables are now all means of means, stds or meanfreqs so 
        # rename them to indicate that using nicenames2
        names(tidydata2) <- nicenames2(names(tidydata2))
        #  Dump out the file for subn=mitting tidydatset2
        #  This isn't required by assignment but makes it convenient for me
        outfile2<-paste0(outdir, "tidydataset2.txt")
        write.table(tidydata2, outfile2, sep=",", row.name=FALSE) 
        #  Return the second tidy dataset
        tidydata2
}

#  This function renames variables that are averages of Mean, MeanFreq or Std to
# MeanOf[whatever]s  eg Mean becomes MeanOfMeans
nicenames2 <- function(innames){
        outnames<-gsub("Mean", "MeanOfMeans", innames)  
        outnames<-gsub("MeanOfMeansFreq", "MeanOfMeanFreqs", outnames)  
        outnames<-gsub("Std", "MeanOfStds", outnames)
        #This is here to make doing the codebook easier
        write.table(cbind(innames, outnames), "filtered_names2.csv", sep=",", row.name=FALSE) 
        outnames
}

# This function renames original variables (Based on features names) to be more meaningful, 
# easy to read, and easier to work with.  Three main things are done: expand cryptic abreviations, 
# go to camelcase general cleanup (getting rid of ()  and double Body).
nicenames<- function( innames ){
        # First 4 passes of gsub expand out abreviations
        outnames<-gsub("tBody", "timeBody", innames)
        outnames<-gsub("tGr", "timeGr", outnames)
        outnames<-gsub("fBody", "freqBody", outnames)
        outnames<-gsub("fGr", "freqGr", outnames)
        outnames<-gsub("-m", "M", outnames)
        outnames<-gsub("-s", "S", outnames)
        outnames<-gsub("-", "", outnames)
        # Get rid of '(' and ')' chars from names 
        outnames<-gsub("\\(\\)", "", outnames)
        
        # Get rid of repeated use of word Body
        outnames<-gsub("(Body){2}", "Body", outnames)
        write.table(cbind(innames, outnames), "filtered_names.csv", sep=",", row.name=FALSE) 
        outnames
}
# This function takes a vector of activity code and returns a vector containing activity labels 
# for the codes
activitylabels<-function(activitycode){
        # Construct file name
        activitylabelsfile<-paste0(getwd(), "/", "UCI HAR Dataset", "/activity_labels.txt")
        # Test activity labels file is present and stop with error if it isn't
        testfilepath(activitylabelsfile)
        # Read in the file
        activitylabels<-read.table(activitylabelsfile, as.is = TRUE, header=FALSE)
        # Create the vector of labels
        labels<-sapply(activitycode, function(code){ activitylabels[[2]][code] })
        # Return the labels
        labels
        
}

# This function returns a vector of feature names read from the features,txt file
getlongvariablenames<-function(){
        # Build string with path to file
        featuresfile<-paste0(getwd(), "/", "UCI HAR Dataset", "/features.txt")
        # Verify file is there and stop with error if it isn't
        testfilepath(featuresfile)
        # Read in features file
        featuresnames<-read.table(featuresfile)#, as.is = TRUE, header=FALSE)
        # Reurn features vector
        featuresnames[[2]]       
}
# This function takes the name of a dataset and returns dataframe assembled 
# from the X_[datasetname].txt, y_[datsetname].txt, subject_[datasetname].txt

assembledataset <- function(datasetname) {
        #Set up directory structure vbls
        topdir<-paste0(getwd(), "/", "UCI HAR Dataset")
        targdir<-paste0(topdir,  "/", datasetname, "/")
        # Read in the records
        dfile<-paste0(targdir, "X_", datasetname, ".txt")
        testfilepath( dfile )
        targdata<-read.table(dfile, header=FALSE)
        # Change variable names to full variable names
        names(targdata)<-getlongvariablenames()
        # Get activity codes
        activityfile<-paste0(targdir, "y_", datasetname, ".txt")
        testfilepath( activityfile )
        activitycodes<-read.table(activityfile, header=FALSE)
        # Get the subjects corresponding to the records
        subjectsfile<-paste0(targdir, "subject_", datasetname, ".txt")
        testfilepath( subjectsfile )
        
        subjects<-read.table(subjectsfile, header=FALSE)
        # Attach activity codes to records
        targdata<-cbind(activitycode=activitycodes[[1]], targdata)
        # Attach subjects to records
        targdata<-cbind(subject=subjects[[1]], targdata)
        #Return the assembled dataset
        targdata
}
# Given a filename verify there is a file there to open and stop processing if it is missing
testfilepath <- function (filename) {
        if (!file.exists(filename)){ 
                stop(paste0("Cannot find file named:", filename))
        }
}