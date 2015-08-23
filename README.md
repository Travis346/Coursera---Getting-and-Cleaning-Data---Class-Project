# Coursera-Getting-and-Cleaning-Data-Class-Project

## Introduction
This repository was created to contain the course project files for the Coursera course title "Getting and Cleaning Data".  The goal of the project is to illustrate the methods of creating a tidy data set.

## Data Source
The data used comes from the UCI Machine Learning Repository.  The data set entitled 'Human Activity Recognition Using Smartphones Data Set' is composed from waist-mounted smartphone internal sensors collected from 30 subjects.  Each subject performed 6 different activities.  The data were randomly segregated into two folders entitled 'train' and 'test'.  Further details about the data and how they were collected can be found at the following:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Using this Repository
A script entitled 'run_analysis.R' was created which performs the following operations on the data set mentioned above
  1.) Merges the training and the test sets
  2.) Subsets the data to only include mean() and std() measurements of each variable 
  3.) Labels the activity for each observation
  4.) Applies variable labels to each column of data 
  5.) Creates a tidy data set with the average of each variable for each activity and each subject

The script 'run_analysis.R' must be located in the main directory of the data folder.  More specifically, the 'run_analysis.R' script must be located in the same folder as the 'test' and 'train' data folders within the 'UCI HAR Dataset' directory.

## About the Returned Data
The CodeBook.md explains the different operations performed on the data in detail to arrive at the tidy data set entitled 'Output_Class-Project_LIPSTEIN.txt'.  The file is tab delimited.
