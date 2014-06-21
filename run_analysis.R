## Script to create tidy data from UCI HAR Dataset
## UCI HAR Dataset must be at current working directory

library(data.table)
library(plyr)
setwd("./UCI HAR Dataset")

#Reading descriptive activity data
fileLocal<-"./activity_labels.txt"
activitiesDescr<-read.csv(fileLocal, sep=" ",header=FALSE)
names(activitiesDescr)[1]<-"idAct"
names(activitiesDescr)[2]<-"actDesc"

#Reading labels for headers
XHeaders<-read.table("./features.txt")

#Moving to test directory to get test data
setwd("./test")

#Default configuration to skip all columns 
widthX<-rep.int(-16,561)

#Building vector of columns to read
selectLogical1<- grep("std()",XHeaders$V2) 
selectLogical2<- grep("mean()",XHeaders$V2)
selectLogical3<-c(selectLogical1,selectLogical2)
selectLogical3<-sort(selectLogical3)
for( i in selectLogical3) {widthX[i]=widthX[i]*-1}
#reading activities data
fileLocal<-"./y_test.txt"
YtestData<-fread(fileLocal)
crossX<-intersect(names(YtestData),names(activitiesDescr))
# Intital reading of data
XtestData<-read.fwf("./X_test.txt",widthX,col.names=XHeaders[selectLogical3,2])
#Adding activities data column
XtestData$idAct = YtestData$V1
#Merging for descriptive actitities data
XtestData<-join(XtestData,activitiesDescr)
#Adding subjetct info
fileLocal<-"./subject_test.txt"
subjecttestData<-fread(fileLocal)
XtestData$subject<-subjecttestData$V1
# Deleting numerical activity data(not needed anymore)
XtestData$idAct <- NULL



# Getting data from training set
setwd("../")
setwd("./train")
# Reading activities data
fileLocal<-"./y_train.txt"
YtrainData<-fread(fileLocal)
crossY<-intersect(names(YtrainData),names(activitiesDescr))
# Reading original data from training
XtrainData<-read.fwf("./X_train.txt",widthX,col.names=XHeaders[selectLogical3,2])
# Adding data from activities
XtrainData$idAct = YtrainData$V1
# Merging for descriptive activities
XtrainData<-join(XtrainData,activitiesDescr)
# Adding subjects data
fileLocal<-"./subject_train.txt"
subjecttrainData<-fread(fileLocal)
XtrainData$subject<-subjecttrainData$V1
# Deleting numerical id 
XtrainData$idAct <- NULL
# Merge of training and test datasets
XfullData<-rbind(XtestData,XtrainData)


# Writting tidy dataset 
setwd("../../")
localFile="./tidyfull.csv"
write.csv(XfullData,localFile,row.names=FALSE)

# Creating and writting second resume dataset
XAvgData <- aggregate(XfullData, by=XfullData[c("actDesc","subject")], FUN=mean)
names(XAvgData)[length(names(XAvgData))]<-"erase"
XAvgData$erase<-NULL
names(XAvgData)[length(names(XAvgData))]<-"erase"
XAvgData$erase<-NULL
localFile="./tidyavg.csv"
write.csv(XAvgData,localFile,row.names=FALSE)
