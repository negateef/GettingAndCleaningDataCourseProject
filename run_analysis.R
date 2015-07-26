## Checking nessesary files and packages

if (!dir.exists("UCI HAR Dataset"))
    stop("No data folder found")
if (!require(plyr))
    stop("Plyr package is required!")

if (!require(dplyr))
    stop("Dplyr package is required!")

## Reading test and training data

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merging in one dataset

test_data <- cbind(x_test, y_test, subject_test)
train_data <- cbind(x_train, y_train, subject_train)
data <- rbind(test_data, train_data)

## Adding descriptive feature names

featureNames <- as.character(read.table("UCI HAR Dataset/features.txt")$V2)
names(data) <- c(featureNames, "activity", "subject")
names(data) <- make.names(names = names(data), unique = TRUE)

## Setting activity type levels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
levels(data$"activity") <- activity_labels$V2

## Getting only columns with mean and standard deviation for each measurement

dataMean <- select(data, contains("mean", ignore.case = FALSE))
dataStd <- select(data, contains("std", ignore.case = FALSE))
dataSubjectAndActivity <- select(data, subject, activity)

data <- cbind(dataMean, dataStd, dataSubjectAndActivity)

## Getting average for all activities and subject

meanAndStdAverages <- ddply(data, .(activity, subject), colMeans)
meanAndStdAverages$activity <- as.factor(meanAndStdAverages$activity)
levels(meanAnsStdAverages$activity) <- activity_labels$V2

write.table(x = meanAndStdAverages, file = "tidy.txt", row.name = FALSE)