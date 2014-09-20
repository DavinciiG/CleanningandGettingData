Code Book For the data set created by run_analysis
==================================================

Data source
-----------
The original dataset is obtained from the UCI Machine Learning repository from the project named the "Human Activity Recognition Using Smartphones Data Set". 
The full deszcription is made avaiable here: 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
The data set is Download from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Method and funtioning of the script 
-----------------------------------
The script *run_analysis.R* performs the following operations and manipulation of the raw data set:

> 1. Merges the training and test sets to create one data set as shown next:
>   The data sets merged are :
>   - X_train.txt with test/X_test.txt
>   - train/y_train.txt with test/y_test.txt
>   - train/subject_train.txt with test/subject_test.txt
>   The resulting data sets contain the subjects ID, the activities ID, The number of instances and
>   the number of attributes

> 2. Read the file *features.txt* and extracts only the measurements on the mean (obtained by the
>    function mean()) and the standard deviation (obtained by the function std())  
>    for each measuremen. 

> 3. Use the *activity_labels.txt* file to apply a descriptive activity names to name the 
>    activities in the data set the activity names are presented as follow:

>    *walking

>    *walkingupstairs

>    *walkingdownstairs

>    *sitting

>    *standing

>    *laying

> 4. Then  all feature names (attributes) for this database that  come from the 
>    accelerometer and gyroscope with 3-axial direction raw signals tAcc-XYZ and tGyro-XYZ 
>    are treated so to obtain the first clean and tidy data set.
>    The fetures are show in the following list where the prefix 't' denote time, the mentions
>    'Body' and 'Gravitty' mention the source of the force measured, the mentions 'Acc' and 'Gyro'
>    correspond to the accelerometer or the Gyroscope and XYZ are the cartessian directions:

>       * tBodyAcc-XYZ
>       * tGravityAcc-XYZ
>       * tBodyAccJerk-XYZ
>       * tBodyGyro-XYZ
>       * tBodyGyroJerk-XYZ
>       * tBodyAccMag
>       * tGravityAccMag
>       * tBodyAccJerkMag
>       * tBodyGyroMag
>       * tBodyGyroJerkMag
>    Finally the script creates a . txt wich contains the clean and tidy data whit the corresponding 
>    average values for each activity and sunject. The file is format as folow:
>    - The first column contains subject IDs
>    - The second column contains activity names 
>    - The third column contain the averages for each of the 66 attributes.
