

library(data.table)
library(dplyr)

################################
#                              #
#   Download and Unzip Files   #
#                              #
################################

# 1 Download and save in the directory Peer-graded Assignment (created it if does not exits)

if(!file.exists("Peer-graded Assignment")){
  dir.create("Peer-graded Assignment")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Peer-graded Assignment/dataset.zip", method = "curl")
setwd("./Peer-graded Assignment")

# 2 Unzip the file
unzip("dataset.zip")

direct = list.files()
setwd(direct[3]) # three files ---> "dataset.zip"     "PeerGraded.R"    "UCI HAR Datase

#####################################################################
#                                                                   # 
#   Merges the training and the test sets to create one data set.   #
#                                                                   #
#####################################################################

# 1 Read Train and Test 
X_train <- read.table(file = "./train/X_train.txt", sep = "")
Y_train <- read.table(file = "./train/Y_train.txt", sep = " ")
subject_train <- read.table(file = "./train/subject_train.txt", sep = " ")

X_test <- read.table(file = "./test/X_test.txt", sep = "")
Y_test <- read.table(file = "./test/Y_test.txt", sep = " ")
subject_test <- read.table(file = "./test/subject_test.txt", sep = " ")

test <- cbind(subject_test, Y_test, X_test)
train <- cbind(subject_train, Y_train, X_train)

Dataset <- rbind(test, train)
rm("X_test","Y_test","test","X_train","Y_train","train","subject_train","subject_test")

#################################################################
#                                                               #
#    Extracts only the measurements on the mean and standard    #
#    deviation for each measurement.                            #
#                                                               #
#################################################################

NamesDataset <- read.table(file = "./features.txt", sep = " ")
NamesDataset <- NamesDataset$V2

MeanNamesPos <- grep("mean()", NamesDataset)
StdNamesPos <- grep("std()", NamesDataset)
NamesDataset <- as.character(NamesDataset)
names(Dataset) <- c("subject", "activity", NamesDataset) 

DMeanStd <- cbind(Dataset[,1:2], Dataset[,MeanNamesPos+2], Dataset[,StdNamesPos+2])

#################################################################
#                                                               #
#  Uses descriptive activity names to name the activities in    # 
#  the data set                                                 #
#                                                               #
#################################################################

Activity <- read.table(file = "./activity_labels.txt", sep = " ")
DMeanStd$activity <- Activity$V2[DMeanStd$activity]

#################################################################
#                                                               #
#  Appropriately labels the data set with descriptive variable  #
#  names.                                                       #
#                                                               #
#################################################################

names(DMeanStd) <- sub("^t", "time ", names(DMeanStd))
names(DMeanStd) <- sub("^f", "freq ", names(DMeanStd))
names(DMeanStd) <- sub("mean()", "Mean value ", names(DMeanStd))
names(DMeanStd) <- sub("std()", "Standard deviation ", names(DMeanStd))

#########################################################################################
#                                                                                       #
#   From the data set in step 4, creates a second, independent tidy data set with the   #
#   average of each variable for each activity and each subject.                        #
#                                                                                       #
#########################################################################################

Resumen<- data.table()

for (i in 1:30){
  each_subject <- filter(DMeanStd, subject == i )
  by_activity <- group_by( each_subject, activity)
  Resumen <- rbind(Resumen, summarize_all(by_activity, mean))
}

# orden
Final <- cbind(Resumen[,2],Resumen[,1],Resumen[,3:ncol(Resumen)])

write.table(Final, "tidyAvgData.txt",row.name=FALSE) 