DATA DICTIONARY

activities : number of observations - activity label including 6 types of activities as follows:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

features:  accelerometer and gyroscope 3-axial raw signals (prefixed t represents time domain signals captured at a constant rate of 50 Hz, prefixed f represents the frequency domain signals at lower capacity.  These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions , categorized as follows:
tBodyAcc-XYZ  				fBodyAcc-XYZ
tGravityAcc-XYZ 			fBodyAccJerk-XYZ	
tBodyAccJerk-XYZ			fBodyGyro-XYZ
tBodyGyro-XYZ				fBodyAccMag
tBodyGyroJerk-XYZ			fBodyAccJerkMag
tBodyAccMag				    fBodyGyroMag
tGravityAccMag				fBodyGyroJerkMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

subj_train :  subject in the training dataset, which composes of 30 volunteers aged 19-48.

xtrain:  training dataset - measurements generated from 70% of the volunteers participating in the experiment.  Refer to features for breakdown of measurements.

ytrain:  labels for the training dataset.

subj_test:  subject in the test dataset (same as the training subject).

xtest:  test dataset – measurements generated from 30% of the volunteers participating in the experiment.  Refer to features for breakdown of measurements.

ytest:   labels for the test dataset.    
       
train_act:  joining the training data or measurement to each activity.

test_act:  joining the test data or measurement to each activity.

merge_act:   training and test activities combined.

merge_subj:  training and test subjects combined.

merge_subj_act :  matching each subject to each activity.

merge_train_test:  training and test data combined to a complete dataset of measurement.

meas_header:  header or column names.
 
completeDS:   a complete dataset with all measurement data with proper row and column names.

m_sd_subset:  extracted mean and standard deviation data from the complete dataset, not including frequency mean and standard deviation.

tidy_ds:  a clean dataset with proper descriptive activity and variable names.
       
tidy_ds_grp :  tidy data set grouped by Subject ID and Activity Type.

sum_m_grp:  summary of calculated mean of each variable grouped by Subject ID and Activity Type.


