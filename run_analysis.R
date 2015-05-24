#1. Merge training and test sets to create one data set.
tmp1 <- read.table("./UCI HAR Dataset/train/X_train.txt")
tmp2 <- read.table("./UCI HAR Dataset/test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("./UCI HAR Dataset/train/y_train.txt")
tmp2 <- read.table("./UCI HAR Dataset/test/y_test.txt")
Y <- rbind(tmp1, tmp2)

tmp1 <- read.table("./UCI HAR Dataset/train/subject_train.txt")
tmp2 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
S <- rbind(tmp1, tmp2)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
featuresNames <- read.table("./UCI HAR Dataset/features.txt")
meanAndStdDev <- grepl("(mean|std)\\(", featuresNames$V2)
filteredData <- X[, which(meanAndStdDev == TRUE)]

#3. Uses descriptive activity names to name the activities in the data set.
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity <- as.factor(Y$V1)
levels(activity) <- activityNames$V2
subject <- as.factor(S$V1)

#4. Appropriately labels the data set with descriptive variable names.
filteredData <- cbind(subject, activity, filteredData)
filteredFeaturesNames <- (cbind(featuresNames, meanAndStdDev)[meanAndStdDev==TRUE, ])$V2
cleaner <- function(featureName) {
  tolower(gsub("(\\(|\\)|\\-)", "", featureName))
}
filteredFeaturesNames <- sapply(filteredFeaturesNames, cleaner)
names(filteredData)[3:ncol(filteredData)] <- filteredFeaturesNames

#5. Creates a second, independent tidy data set with the average of each variable.
library(reshape2)
molten <- melt(filteredData, id.vars=c("subject","activity"))
tidy <- dcast(molten, subject + activity ~ variable, mean)
write.table(tidy, "result.txt", sep="\t", row.names=FALSE)
