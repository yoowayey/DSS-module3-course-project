library(plyr); library(dplyr)

#Importing
##all about train...
subjecttrain <- read.table("./subject_train.txt")
xtrain <- read.table("./X_train.txt")
ytrain <- read.table("./y_train.txt")

##all about 'test'...
subjecttest <- read.table("./subject_test.txt")
xtest <- read.table("./X_test.txt")
ytest <- read.table("./y_test.txt")

##labels of y's
activitylabels <- read.table("./activity_labels.txt")

##labels of x's
features <- read.table("./features.txt")


#1. Merging training and test sets
names(subjecttest) <- "subject"
names(ytest) <- "activity"
names(xtest) <- features[ ,2]

names(subjecttrain) <- "subject"
names(ytrain) <- "activity"
names(xtrain) <- features[ ,2]

allTest <- cbind(subjecttest, ytest)
allTest <- cbind(allTest, xtest)

allTrain <- cbind(subjecttrain, ytrain)
allTrain <- cbind(allTrain, xtrain)

        #this is the combined data sets including subject and activity  
        traintest <- rbind(allTest, allTrain) 

        #setting aside subject and activity
        traintestf2 <- traintest[, 1:2] 

#2. Extract the means and stds
extracted <- grep("(mean|std)\\(\\)", names(traintest), value=TRUE)
combined <- traintest[ ,extracted]

        #putting them all back together, but now data set with means and stds are separated
        #the reason for this is that when we merge the activity labels, it will automatically sort
        #hence, the observations won't be aligned with its respective subject and activity
        #we'll need this for Item #5
        together <- cbind(traintestf2, combined)

#3. Use descriptive activity
activities <- rbind(ytest, ytrain)
activities <- merge(activitylabels, activities, by.x="V1", by.y="activity", all.y=TRUE)

        #(optional) merging the allmeans and allstds with activity labels
        together <- merge(activitylabels, together, by.x="V1", by.y="activity", all.y=TRUE)

#4. Appropriately labels the data set
names(combined) <- tolower(names(combined))
names(combined) <- gsub("mean\\(\\)", "ave", names(combined))
names(combined) <- gsub("-", "", names(combined))
names(combined) <- sub("t", "time", names(combined))
names(combined) <- sub("f", "freq", names(combined))


#5. Independent tidy data set

        #renaming colnames
        d0 <- together %>% select(subject, V2)
        names(d0) <- c("subject", "activity")
        together <- cbind(d0, together[ ,-(1:3)])

        rm(d0)

tidyaverages <- together %>% group_by(subject, activity) %>% 
        summarize_at(.funs=mean, .vars=names(together[ ,-(1:2)]))


write.table(tidyaverages, "tidyave.txt")