# This script loads data from the Smartlab - Non Linear Complex Systems Laboratory Experiments
#The experiments were carried out with a group of volunteers each person performed six activities 
#wearing a smartphone on the waist, the data processed here is the result of this experiment.
# 2 sets of data were collected (Train and Test)


# Load necessary packages to support cleansing of the data
library(plyr)
library(dplyr)
library(reshape2)

#Load data common to both data sets

#Load description of each one of the measures collected
features<-read.table("UCI HAR Dataset/features.txt", colClasses = "character" )

#Cleanup the names of the features remove parenthesis and other characters
features[,2]<-gsub("\\(","",features[,2], perl=TRUE)
features[,2]<-gsub("\\)","",features[,2], perl=TRUE)
features[,2]<-gsub("\\,","",features[,2], perl=TRUE)

#Ensure all names of the columns are syntatically correct 
features[,2]<-make.names(features[,2], unique=TRUE)


# Load Train Data

#Load measures collected from the train data set
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")

#USe the names just loaded to name each of the columns on the measures dataset
names(xtrain)<- features[,2]

# Create a sequence number that will identify each one of the rows for the train data and append to the train measure data
xtrain$id<- seq(1,nrow(xtrain),by=1)

#Load subject information relating each set of measures collected to an specific individual
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Rename columns to give it a meaninful name
colnames(subject_train)[1]<-"subjects"

#Create a sequence number for each one of the subect information loaded 
subject_train$id<- seq(1,nrow(subject_train),by=1)

#Load data identifying the type of activity the subject was performing when the measures were captured
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

#Rename column to give it a meaninful name
colnames(y_train)[1]<-"activities"

#Create a sequence number for each activity loaded
y_train$id<- seq(1,nrow(y_train),by=1)

#Using the sequence number created for each data set combine the datasets, the resulting dataset will have the following information
# Subject performin the activity, activity being performed and measures collected during the activity

dfList= list(subject_train, y_train, xtrain)
all_data_train <- join_all(dfList)


#Load Test Data

#Load measures collected from the test data set
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")

#USe the names just loaded to name each of the columns on the measures dataset
names(xtest)<- features[,2]


# Create a sequence number that will identify each one of the rows for the testdata and append to the train measure data
xtest$id<- seq(1,nrow(xtest),by=1)

#Load subject information relating each set of measures collected to an specific individual
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Rename columns to give it a meaninful name
colnames(subject_test)[1]<-"subjects"

#Create a sequence number for each one of the subect information loaded 
subject_test$id<- seq(1,nrow(subject_test),by=1)

#Load data identifying the type of activity the subject was performing when the measures were captured
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")


#Rename column to give it a meaninful name
colnames(y_test)[1]<-"activities"

#Create a sequence number for each activity loaded
y_test$id<- seq(1,nrow(y_test),by=1)

#Using the sequence number created for each data set combine the datasets, the resulting dataset will have the following information
# Subject performin the activity, activity being performed and measures collected during the activity

dfList2= list(subject_test, y_test, xtest)
all_data_test <- join_all(dfList2)


#Combine the test and train datasets 
full_set <- rbind(all_data_train, all_data_test)



#Remove all columns that are not of interest for this exercise . Keep only measure related to mean and std
mean_std_data <-select(full_set, matches("(subjects)+|(activities)+|(mean)+|(std)+", ignore.case = FALSE))

#Reshape the data to a state where measures become rows instead of columns so we can summarize 
all_melt<-melt(mean_std_data,id=c("subjects","activities"))

#Summarize the data by subject and activity using the mean
tidy_data<-dcast(all_melt, subjects + activities ~ variable, mean)

#Load descrptive names for activities
activity_names <- features<-read.table("UCI HAR Dataset/activity_labels.txt", colClasses = "character" )

#Rename columns for clarity and to allow join to decode activities
colnames(activity_names)[1]<-"activities"
colnames(activity_names)[2]<-"activity_description"

#Join tidy dataset with activity descriptions to provide a description of activites
new_tidy_data<-join(tidy_data,activity_names, by="activities")


#Rearrange columns for clarity and remove activity  number since we replaced it with activity description

new_tidy_data<-new_tidy_data[c(1,82,3:81)]


# Write output of script as text file
write.table(new_tidy_data,file="tidydata2.txt",row.names=FALSE)
