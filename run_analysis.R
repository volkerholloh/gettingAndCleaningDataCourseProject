


getTidy1 <- function (){

        ## set data directory
        dataRootDir <- "UCI HAR Dataset"

        ## set paths to needed files
        locTestSet <- "test/X_test.txt"
        locTrainSet <- "train/X_train.txt"
        locFeatures <- "features.txt"

        locTestAct <- "test/y_test.txt"
        locTrainAct <- "train/y_train.txt"

        locActivityLabels <- "activity_labels.txt"

        locTestSubjects <- "test/subject_test.txt"
        locTrainSubjects <- "train/subject_train.txt"


        ### Project task 1: merge data
        ## load observation data and combine into one table
        testSet <- read.table(paste(dataRootDir, "/", locTestSet, sep = ""))
        trainSet <- read.table(paste(dataRootDir, "/", locTrainSet, sep = ""))
        fullSet <- rbind(testSet, trainSet)

        ## load features into vector
        features <- read.table((paste(dataRootDir,"/", locFeatures, sep ="")), stringsAsFactors = FALSE)[[2]]

        ## set features vector as column names of fullSet
        colnames(fullSet) <- features

        ### Project task 2: extract measurements for mean and std
        ## in fullSet select only columns with means or standard deviation
        fullSet <- fullSet[,grep("mean|std", features)]


        ### Project task 3: use descriptive activity names
        ## load activityLabels and rename columns for future use
        activityLabels <- read.table(paste(dataRootDir, "/",locActivityLabels, sep =""), stringsAsFactors = FALSE)
        colnames(activityLabels) <- c("activityID","activityLabel")

        ## load activity data sets of test and training data and merge into one table
        testActivity <- read.table(paste(dataRootDir, "/", locTestAct, sep = ""))
        trainActivity <- read.table(paste(dataRootDir, "/", locTrainAct, sep = ""))
        fullActivity <- rbind(testActivity, trainActivity)
        colnames(fullActivity) <- c("activityID")


        ## join master and detail tables to one table
        activity <- join(fullActivity, activityLabels)

        ## add "activities" from activity table to the full observation set
        fullSet <- cbind(activity = activity[, "activityLabel"], fullset)


        ### Project task 4: give the variables appropriate variable names
        ## read colnames into vector
        variableNames <- names(fullSet)

        ## search and replace patterns
        variableNames <- gsub(pattern="^t", replacement="time", x=variableNames)
        variableNames <- gsub(pattern="^f", replacement="freq", x=variableNames)
        variableNames <- gsub(pattern="BodyBody", replacement="Body", x=variableNames)
        variableNames <- gsub(pattern="mean", replacement="Mean", x=variableNames)
        variableNames <- gsub(pattern="std", replacement="Std", x=variableNames)
        ## there could be some more tidying but e.g. I like the "-" before mean or std

        ## write new colnames back into dataset
        names(fullSet) <- variableNames


        ## preparation for project task 5
        ## load subject data sets of test and training subjects and merge into one table
        testSubjects <- read.table(paste(dataRootDir, "/", locTestSubjects, sep = ""))
        trainSubjects <- read.table(paste(dataRootDir, "/", locTrainSubjects, sep = ""))
        fullSubjects <- rbind(testSubjects, trainSubjects)
        colnames(fullSubjects) <- c("subjectID")

        ## join fullSet and fullSubjects
        fullSet <- cbind(fullSubjects, fullSet)


        ## write dataset to disk
        write.csv(fullSet, file = "tidy1.csv")

        fullSet

}

getTidy2 <- function (fullSet) {

        ### Project task 5: make dataset with average of each variable for each subject

        ## make a long data set
        fullSetMolten <- melt(fullSet, id.vars = c("subjectID", "activity"))

        ## make a wide dataset and aggregate all variables on subjectID and activity
        fullSetNew <- dcast(fullSetMolten, subjectID + activity ~ variable, fun.aggregate = mean)

        ## write dataset to file
        write.csv(fullSetNew, file = "tidy2.csv")

        fullSetNew

}


startTidy <- function() {

        tidy1 <- getTidy1()
        tidy2 <- getTidy2(tidy)

}