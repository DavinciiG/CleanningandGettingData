## Getting and Cleaning Data Course project
## The functions of this script are :
##
##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names. 
##5. From the data set in step 4, creates a second, independent tidy data set with 
##   the average of each variable for each activity and each subject.

### Download and unziping of the file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,"./getdataprojectfilesFUCIHARDataset.zip")
dateDownloaded <- date()
unzip("getdataprojectfilesFUCIHARDataset.zip")
setwd("./UCI HAR Dataset")

### Now Lets Merge the training and test sets
Txtrain <- read.table("train/X_train.txt")
Txtest <- read.table("test/X_test.txt")
Xval <- rbind(Txtrain, Txtest)

Tytrain <- read.table("train/y_train.txt")
Tytest <- read.table("test/y_test.txt")
Yval <- rbind(Tytrain, Tytest)

Tsubtrain <- read.table("train/subject_train.txt")
Tsubtest <- read.table("test/subject_test.txt")
Subval <- rbind(Tsubtrain, Tsubtest)

#------------------------------------------------------

### Extracts mean and standard deviation for each measurement mean() and std().

feat <- read.table("features.txt")
Indgoodfeat <- grep("-mean\\(\\)|-std\\(\\)", feat[, 2]) # average and standart deviation calc
Xval <- Xval[, Indgoodfeat]
names(Xval) <- feat[Indgoodfeat, 2]
names(Xval) <- gsub("\\(|\\)", "", names(Xval))
names(Xval) <- tolower(names(Xval))
#------------------------------------------------------
## Uses descriptive activity labels to name the activities in the data set.

activ <- read.table("activity_labels.txt")
activ[, 2] = gsub("_", "", tolower(as.character(activ[, 2])))
Yval[,1] = activ[Yval[,1], 2]
names(Yval) <- "activity"
#------------------------------------------------------
### Data set with descriptive activity names.

names(Subval) <- "subject"
cleandata <- cbind(Subval, Yval, Xval)
write.table(cleandata, "merge_data_1set.txt")

### Create a 2nd, independent data set with the average of each variable 
### for each activity and each subject.

USubject = unique(Subval)[,1] # remove eny duplicated elements from the subjects
nSub = length(unique(Subval)[,1])
nActiv= length(activ[,1])
nCols = dim(cleandata)[2]
result = cleandata[1:(nSub*nActiv), ]

row = 1 # row counter initialisation 
for (i in 1:USubject) {
        for (j in 1:nActiv) {
                result[row, 1] = USubject[i]
                result[row, 2] = activ[j, 2]
                temp <- cleandata[cleandata$subject==i & cleandata$activity==activ[j, 2], ]
                result[row, 3:nCols] <- colMeans(temp[, 3:nCols])
                row = row+1
        }
}
write.table(result, "final_data_2set.txt", row.names = FALSE)
