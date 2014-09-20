Getting and Cleaning Data: Course Project Samsung Galaxy S smartphone
=====================================================================

General Description
-------------------
This Repository present the final version of a R script created by me for the 
Coursera Data specialization course "Getting and Cleaning Data".
The script was created in the context of the course project which required the 
manipulation of a data set which was obtained from the accelerometers from the 
Samsung Galaxy S smartphone.

Objectives of the script
--------------------------

The main objectives of the script are :
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the clean and tidy  data set, creates a second, independent tidy data set 
>    with the average of each variable for each activity and each subject.

The Raw Data
------------
The raw data was obtain and dowloaded from the UCI Machine Learning Repository.
More details about the raw data can be found in:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The Final Data Files
--------------------
The script crates 2 .txt files that contain the tidy and clean data sets.
*merge_data_1set.txt* contains the  data set created by the script for the 4 stept.
*final_data_2set.txt* contains the final data set that is presented as a final result
for the course project.

Script Operation
----------------

The script call "run_analysis.R" will merge the test and training sets together as
descrived in the objectives.
> ***Warning***:

> The current script Download and unzip the data set, also sets the working directory
> to "./UCI HAR Dataset"
> If any error should appear with the setting of the working directory line 16 of
> the script shoulhd be comented and the working directory set to "./UCI HAR Dataset".

Code Book
---------
The description of the data set variables and the transformations performed can be found in
the file "CodeBook.md"
