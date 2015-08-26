# Coursera-Getting-and-Cleaning-Data-Class-Project
# CodeBook - Steps followed to produce a tidy data set

## Introduction
This repository was created to contain the course project files for the Coursera course title "Getting and Cleaning Data".  The goal of the project is to illustrate the methods of creating a tidy data set.

## Data Source
The data used comes from the UCI Machine Learning Repository.  The data set entitled 'Human Activity Recognition Using Smartphones Data Set' is located at:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Brief Overview of the Data
The data comes from 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were collected using the phones embedded accelerometer and gyroscope.  The data is split into two directories; 'train' and 'test'.  Roughly 70% of the observations are located in the 'train' data set.  The activity and variable names are located in the main directory.  The data is primarily composed of accelerometer and gyroscope 3-axial (X, Y, Z) raw signals.  Many more parameters are creating using filters and component isolation.  Measurements with prefix 't' are time domain and 'f' are frequency domain specific.  The full list of parameters is available in 'features.txt' and 'feature_info.txt' files of the original data set.     

## Combining Data
The script 'run_analysis.R' pulls the raw data files from the respective folders and merges all into a single data frame.  Appropriate labels are applied to each observation and variable.  Parameters that did not contain either "mean()" or "std()" in their description were not included in the data set per assignment requirements.

## The Output file
The output file takes the filtered data set described above and averages the values recorded for each observation.  Therefore only one value is returned for each variable for a given subject and activity.  The list of variable names is available in 'Variable_Names.txt'.

## Citation to Original Data Set:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
