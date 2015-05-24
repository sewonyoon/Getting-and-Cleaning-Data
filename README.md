# Getting-and-Cleaning-Data

You need to download below zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip first. Place the run_analysis.R file in the top level of the folder to reproduce this result. 

You can refer codebook: https://github.com/sewonyoon/Getting-and-Cleaning-Data/blob/master/codebook.md


### Project Overview

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

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


