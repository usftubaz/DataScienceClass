run_analysis Read Me
========================================================

This function is designed to compile and clean test data from a wearable accelorameter dataset, as found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The program assumes that this data has been downloaded to the working directory and the file structure has not been alterred.

The output of this function is a dataframe[67x6], containing the average value, per activity, of 66 observation categories relating to mean and standard deviation measurements.