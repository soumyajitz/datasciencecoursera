setwd("/Users/soumyajitsarkar/Desktop/datasciencecoursera")
library(dplyr)
library(plyr)
list.files("./UCI_HAR_Dataset")
#Read the features file
features <- read.table("./UCI_HAR_DATASET/features.txt")
feature <- features$V2

# Read the activity labels
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
names(activity_labels) <- c("activity","activityLabel")

list.files("./UCI_HAR_Dataset/test")
list.files("./UCI_HAR_Dataset/train")

# Read the dataset  for subject files
trainSub <- read.table("./UCI_HAR_DATASET/train/subject_train.txt")
testSub <- read.table("./UCI_HAR_DATASET/test/subject_test.txt")

# Read the data files
trainData <- read.table("./UCI_HAR_DATASET/train/X_Train.txt")
testData <- read.table("./UCI_HAR_DATASET/test/X_test.txt")

# Read the activity files
trainActivity  <- read.table("./UCI_HAR_DATASET/train/y_train.txt")
testActivity <- read.table("./UCI_HAR_DATASET/test/y_test.txt")

#Merge the train and test of subject files
mergeSub <- rbind(trainSub,testSub)
names(mergeSub) <- c("subject")

#Merge the train and test of data files
mergeData <- rbind(trainData,testData)
names(mergeData)<- feature

#Merge the train and test of activity files
mergeActivity <- rbind(trainActivity,testActivity)
names(mergeActivity) <- c("activity")

#Merge columns for All data
dataCombination <- cbind(mergeSub, mergeActivity)
Data <- cbind(dataCombination,mergeData)

# Extract the mean and std from each measure in features.txt
featuresMeanStd <- grep("mean\\(\\)|std\\(\\)",feature,value = TRUE)
featuresMeanStd <- union(c("subject","activity"),featuresMeanStd)
  
selectedName<-as.character(featuresMeanStd)
Data<-subset(Data,select=selectedName)

#Uses descriptive activity names to name the activities in the data set
Data <- merge(activity_labels,Data,by = "activity",all.x = T)

# Change Column names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# Create independent tidy dataset
Datatidy<-aggregate(. ~subject + activity, Data, mean)
Datatidy<-Datatidy[order(Datatidy$subject,Datatidy$activity),]

write.table(Datatidy, "TidyData.txt", row.name=FALSE)
rm(tidyData)
tidyData <- read.table("TidyData.txt")

# 
# means <- as.vector(sapply(Data, mean ))
# names <- names(Data)
# means <- as.data.frame(cbind(names, means))
# names(means) <- c('variable', 'mean')
