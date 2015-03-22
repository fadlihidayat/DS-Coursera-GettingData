

library(dplyr)

#get the data
if (!file.exists("data.zip")){
        dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(dataset_url, "data.zip")
        unzip("data.zip", exdir = "data")        
}

#data location
var <- "./data/UCI HAR Dataset/features.txt"
acttestdat <- "./data/UCI HAR Dataset/test/y_test.txt"
acttraindat <- "./data/UCI HAR Dataset/train/y_train.txt"
subtestdat <- "./data/UCI HAR Dataset/test/subject_test.txt"
subtraindat <- "./data/UCI HAR Dataset/train/subject_train.txt"
testdat <- "./data/UCI HAR Dataset/test/X_test.txt"
traindat <- "./data/UCI HAR Dataset/train/X_train.txt"

#load variable label
varlabel <- read.table(var, header = FALSE)
4
#load test data, subject & activity set
testdata <- read.table(testdat,header = FALSE)
testsubject <- read.table(subtestdat,header = FALSE)
testact <- read.table(acttestdat,header = FALSE)

#load train data, subject & activity set
traindata <- read.table(traindat,header = FALSE)
trainsubject <- read.table(subtraindat, header = FALSE)
trainact <- read.table(acttraindat, header = FALSE)

#names the variable
names(testdata) <- as.vector(varlabel[['V2']])
names(traindata) <- as.vector(varlabel[['V2']])

#select mean & std column
testdata <- testdata[,grepl("mean",names(testdata)) | grepl("std",names(testdata))]
traindata <- traindata[,grepl("mean",names(traindata)) | grepl("std",names(traindata))]

#add subject & activity var to each obs
testdata$subject <- as.vector(testsubject[['V1']])
traindata$subject <- as.vector(trainsubject[['V1']])
testdata$activity <- as.vector(testact[['V1']])
traindata$activity <- as.vector(trainact[['V1']])


#bind the train and test data together
finaldata <- rbind(testdata,traindata)
finaldata <- select(finaldata,subject,activity,1:79)

#give tha activity descriptive label
finaldata$activity <- factor(finaldata$activity,
                             levels= 1:6,
                             labels=c("WALKING",
                                      "WALKING UPSTAIRS",
                                      "WALKING DOWNSTAIRS",
                                      "SITTING",
                                      "STANDING",
                                      "LAYING"))

#Group by subject and activity
by_subject_activity <- finaldata %>%  group_by(subject,activity)

#Summarise each group by the mean value
final_tidy_data <- by_subject_activity %>% summarise_each(funs(mean))

#Write into txt file
write.table(final_tidy_data,file="./UCI HAR Tidyset.txt", row.names = FALSE)

