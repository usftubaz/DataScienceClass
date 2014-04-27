run_analysis <- function() {
  ## Read CSVs into tables
    test_set <- read.table("~/UCI HAR Dataset/test/X_test.txt")
    test_cat <- read.table("~/UCI HAR Dataset/test/y_test.txt")
    train_set <- read.table("~/UCI HAR Dataset/train/X_train.txt")
    train_cat <- read.table("~/UCI HAR Dataset/train/y_train.txt")
    activity <- read.table("~/UCI HAR Dataset/activity_labels.txt")
    features <- read.table("~/UCI HAR Dataset/features.txt")
    
  ##Add column names for Activity and join frames  
    colnames(train_cat) <- c("Activity")
    colnames(test_cat) <- c("Activity")
    test_set <- cbind(test_cat,test_set)
    train_set <- cbind(train_cat,train_set)
  
  ##Merge test and train data frames
    merged <- merge(test_set,train_set, all=TRUE)
  
  ##Split frames to each activity
    test1 <- subset(merged,Activity==1,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
    test2 <- subset(merged,Activity==2,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
    test3 <- subset(merged,Activity==3,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
    test4 <- subset(merged,Activity==4,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
    test5 <- subset(merged,Activity==5,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
    test6 <- subset(merged,Activity==6,select=c(V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,   V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
  
  ##Calculate averages
    avg1 <- colMeans(test1)
    avg2 <- colMeans(test2)
    avg3 <- colMeans(test3)
    avg4 <- colMeans(test4)
    avg5 <- colMeans(test5)
    avg6 <- colMeans(test6)
  
  ## Name columns
    toMatch <- c("*.mean\\(\\).*","*.std\\(\\).*")
    matches <- unique (grep(paste(toMatch,collapse="|"),features$V2,value=TRUE))
  
  ##Merge rows and columns
    names <- data.frame(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
    colnames(names) <- "Activity"
    complete <- rbind(avg1,avg2,avg3,avg4,avg5,avg6)
    colnames(complete) <- matches
    complete <- cbind(names,complete)
    complete
}
