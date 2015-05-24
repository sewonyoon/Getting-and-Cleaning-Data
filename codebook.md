# Codebook

### Variables
* X, Y, S: Data frames from test and train data, and its combined data.
* featuresNames: feature names from feature.txt
* meanAndStdDev: featureNames contains mean or std in its name
* filteredData: Filtered Data with mean and standard deviation
* activityNames: Activiy labels pulled from text file
* activity: Factor data from Y data frame which will be revised to activity names
* filteredFeaturesNames: filtered data which only contains mean or std data sets.


### The code consists of five sections.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##### 1. Merges the training and the test sets to create one data set.
Pulled out data sets of train and test for X, Y, and Subject, and combined it using rbind fuction. Each comined data is saved on data frames X, Y, and S.

##### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Pulled out feature names and filtered out which doesn't include mean or std in its name using grepl function. And saved filtered data into new data frame filteredData.

##### 3. Uses descriptive activity names to name the activities in the data set
Pulled out activity names from activity_labels.txt, and labeled it into activity data frame.

##### 4. Appropriately labels the data set with descriptive variable names. 
Combine all clean data frames into filteredData using cbind function. As we don't need feaures which doesn't include mean or std, filter out those data from data frame. Created cleaner function which make the name tidy and modified filteredData's name between Column 3 to at the end of its column.

##### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using melt and, make a new data set called tidy with the average of each variable. The tidy data set is saved in result.txt in working directoy as a result.

