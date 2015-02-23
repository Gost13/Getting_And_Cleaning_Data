CodeBook
========

The script file `run_analysis.R` contains a function `run_analysis`.

When excecuting the function, it performs the following tasks:
*  it checks if the dataset is available. If not, error message will come up asking to check data avaliability.
*  it loads the following files:
    -  features.txt
    -  activity_labels.txt
    -  test/subject_test.txt
    -  test/y_test.txt
    -  test/X_test.txt
    -  train/subject_train.txt
    -  train/y_train.txt
    -  train/X_train.txt
*  for the `X_test` and `X_train` data set, it will filter only the columns that have `mean` or `std` in the column name
*  the test and train data will be merged together
*  all the activity label numbers provided by `y_test` and `y_train` will be replaced by the activity name provided by `activity_labels.txt`
*  cleaned up column names will be provided by data from `features.txt`
*  an aggregated table will be returned containing the mean for every variable per subject and activity

Original data set
-----------------
Taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

For more information read visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, the website where the original data came from. 
