# CourseProject_CleaningData
This repository was created to submit the course project for the Coursera Class Getting and Cleaning Data

This README file describes the steps taken in the script run_analysis.R to process data from created by the Human Activity Recognition Experiment by the Università degli Studi di Genova, Genoa. The authors built a database from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. For more information regarding the data set visit :http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The data resulting for the experiment was made available in several files. The purpose of this script is to process and cleanse the data of all those files and produce one set of tidy data that can be used by others to better understand the results of the experiment. 

A detailed description of the cleansed dataset produced by this script, can be found in the code book file located in this same repository.

This script assumes that all related files are available on the working directory used to run the script. This is the list of files used by this script and a brief description of them.

General Files:
features.txt : Contains the name of each one of the variables captures for every observation of the experiment
activity_labels.txt: Contains a description of the activity being performed while measures were collected as well as a unique integer indetifier for each activity.

Test Data Set Files:
X_test.txt: Contains the measurements collected for each one of the observations of the experiment
subject_test.txt: Contains an integer identifying the subject perfroming the activity for each one of the observations
y_test.txt: Contains an integer representing the activity being performed for each oone of the observations

Train Data Set Files:
X_train.txt: Contains the measurements collected for each one of the observations of the experiment
subject_train.txt: Contains an integer identifying the subject perfroming the activity for each one of the observations
y_train.txt: Contains an integer representing the activity being performed for each oone of the observations

The general flow of the script is to load the data and then put together the test and train datasets since they have been provided to us in 3 different files but in reality they are all related to the same observation. This is accomplished by loading each of the files (X, subject and Y) and adding a sequence number for each of the rows. Once the 3 files have been loaded and have a "id" column, we proceed to join those 3 files and end up with one dataframe for the Test Dataset one for the entire Train Dataset. 

Once that we have a dataset for Train and another for Test we proceed to combine those datasets to end up with one dataframe that has all the observations.

It is important that we rename the columns of the dataframes along the way to make sure we endup with descriptive names that give the user a good idea of what is stored in that column.

Antother important point is to handle the files that are applicable to both the test and train datasets. The first one is the activity_labels.txt. This file has the name of the measurents contained in the X_train and X_test files. We load the activity_lanels.txt in a dataframe and the we convert those names to a vector (total of 561 names) then we assing this vector to the names of the dataframe containing the X_train data. By doing this we have named each one of the 561 on the dataset.

The features.txt file is used to translate the activy identifier to an activity description. The activity identifier was given to each one of the observations but it has no meaning for the user unless they have access to this file. To make our data set clearer we load the features.txt set and then we join it to the combined data frame containing both test and train data. By doing this now we have descriptive names for each activity (i.e. Walking, Standing, etc.)
