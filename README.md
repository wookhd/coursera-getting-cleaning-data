# Coursera - Getting and Cleaning Data - README

## Contents of the Repository

1. The repository explains how all of the scripts work and how they are connected.  

* CodeBook.md - a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

* README.md - describe how the script works.
 
* run_analysis.R - The code to be run as long as the Samsung data is in your working directory. 

## Steps to run the script

* Step 1 - Download the raw file from the following 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

* Step 2 - Make a folder called data.

* Step 3 - Unzip the downloaded file into the data folder.

* Step 4 - Change the Line 2 of the script (run_analysis.R) to your present working directory and save the script. Eg. setwd("F:/MOOC/Module 3 - Week 3"). It should have a data folder that contains the unzip downloaded file.

* Step 5 - Run the script (run_analysis.R).

* Step 6 - A file named "tidy_data_set.txt" will be created in the data folder. It is an independent tidy data set with the average of each variable for each activity and each subject.
