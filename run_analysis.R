## "Getting & Cleaning Data" Course Project
## Refer to README.md and CodeBook.md for detailed info on project requirement
## dplyr package required

## Read datafiles.
    activities <- read.table("./project/activity_labels.txt")  
    features <- read.table("./project/features.txt")
    subj_train <- read.table("./project/subject_train.txt")
    xtrain <- read.table("./project/X_train.txt")
    ytrain <- read.table("./project/y_train.txt")
    subj_test <- read.table("./project/subject_test.txt")
    xtest <- read.table("./project/X_test.txt")
    ytest <- read.table("./project/y_test.txt")    
       
    
## Merge files into one complete dataset and label columns/rows.
    train_act <- cbind(ytrain,activities[match(ytrain$V1,activities$V1),])
    test_act <- cbind(ytest,activities[match(ytest$V1,activities$V1),])
    merge_act <- rbind(train_act,test_act)     
    merge_subj <- rbind(subj_train,subj_test)
    merge_subj_act <- cbind(merge_subj,merge_act)
    merge_train_test <- rbind(xtrain,xtest)
    meas_header <- features$V2
    colnames(merge_train_test) <- meas_header
    completeDS <- cbind(merge_subj_act,merge_train_test)
    colnames(completeDS)[1:4] <- c("SubjID","ActivityCd","ActivityCd1","ActivityType")
 
    
## Extract only mean and standard deviation measurements.  Apply descriptive names for activities in the dataset.
## Label column names with more descriptive variable names.    
    m_sd_subset <- completeDS[,grep(c("mean\\(\\)|std\\(\\)"), colnames(completeDS), ignore.case=TRUE, value=FALSE)]
    completeDS[,4] <- as.character(completeDS$ActivityType)
    tidy_ds <- cbind(completeDS[,c(1,4)],m_sd_subset)
    header <- colnames(tidy_ds)
    new_header <- gsub("[()]","", header)
    new_header1 <- gsub("[-]","_", new_header)
    names(tidy_ds) <- new_header1
       

## New dataset with average of each variable for each activity & subject.
    library(dplyr)
    tidy_ds_grp <- group_by(tidy_ds, SubjID, ActivityType)
    sum_m_grp <- summarise_each(tidy_ds_grp,funs(mean))
    write.table(sum_m_grp, "run_analysis_output.Rmd", row.name=FALSE)
    
    
    