# CourseProject_CleaningData
This repository was created to submit the course project for the Coursera Class Getting and Cleaning Data

This README file describes the steps taken in the script run_analysis.R to process data from created by the Human Activity Recognition Experiment by the Università degli Studi di Genova, Genoa. The authors built a database from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. For more information regarding the data set visit :http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The data resulting for the experiment was made available in several files. The purpose of this script is to process and cleanse the data of all those files and produce one set of tidy data that can be used by others to better understand the results of the experiment. 

A detailed description of the cleansed dataset produced by this script, can be found in the code book file located in this same repository.

This script assumes that all related files are available on the working directory used to run the script. This is the list of files used by this script and a brief description of them.

General Files:
features.txt : Contains the name of each one of the variables captures for every observation of the experiment
activity_labels: Contains a description of the activity being performed while measures were collected as well as a unique integer indetifier for each activity.

Test Data Set Files:
X_test.txt: Contains the measurements collected for each one of the observations of the experiment
subject_test.txt: Contains an integer identifying the subject perfroming the activity for each one of the observations
y_test.txt: Contains an integer representing the activity being performed for each oone of the observations

Train Data Set Files:
X_train.txt: Contains the measurements collected for each one of the observations of the experiment
subject_train.txt: Contains an integer identifying the subject perfroming the activity for each one of the observations
y_train.txt: Contains an integer representing the activity being performed for each oone of the observations

