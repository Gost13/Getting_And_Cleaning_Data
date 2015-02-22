run_analysis <- function(){
  if (!file.exists('UCI HAR Dataset')){
    stop('No required data files found. Please check if files located under "UCI HAR Dataset" folder whithin working directory and try again')
  }
  
  # Get all data sets
  cat('Starting to load data sets...')
  X_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
  print('X_train.txt loaded...')
  X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
  print('X_test.txt loaded...')
  y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
  print('y_train.txt loaded...')
  y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
  print('y_test.txt loaded...')
  subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
  print('ubject_train.txt loaded...')
  subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
  print('subject_test.txt loaded. All data sets are loaded!')
  
  # 1. Merging the training and the test sets to create one data set.
  cat('Merging train and test data sets...')
  X <- rbind(X_train, X_test)
  y <- rbind(y_train, y_test)
  subject <- rbind(subject_train, subject_test)
  print('Done')
  
  # 2. Extracts only the measurements on the mean and standard deviation for each observation.
  cat('Removing columns we dont need...')
  features <- as.character(read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)[,2])
  mean_std_columns <- grep("[mM]ean|std", features)
  X <- X[,mean_std_columns]
  print('Done')
  
  # 3. Using descriptive activity names to name the activities in the data set.
  cat('Converting activity ids into corresponding names...')
  activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
  y$activity_name <- activity_labels[y$V1,2]
  print('Done')
  
  # 4. Labeling the data set with descriptive variable names (we use the feature names) 
  cat('Labeling columnns with descriptive names...')
  names(X) <- features[mean_std_columns]
  names(subject)[1] <- "subject"
  print('Done')
  
  # 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
  cat('Aggregating data by activity name and subject...')
  tidy_data <- aggregate(X, by=list(activity=y$activity_name, subject=subject$subject), mean)
  write.table(tidy_data, "tidy_data.txt", sep=" ", row.name=FALSE)
  print('Done')
}