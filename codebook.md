Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals ("time BodyAcc-XYZ" and "time GravityAcc-XYZ") using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals ("time BodyAccJerk-XYZ" and "time BodyGyroJerk-XYZ"). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm ("time BodyAccMag", "time GravityAccMag", "time BodyAccJerkMag", "time BodyGyroMag", "time BodyGyroJerkMag"). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing "freq BodyAcc-XYZ", "freq BodyAccJerk-XYZ", "freq BodyGyro-XYZ", "freq BodyAccJerkMag, "freq BodyGyroMag", "freq BodyGyroJerkMag". (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time BodyAcc-XYZ
time GravityAcc-XYZ
time BodyAccJerk-XYZ
time BodyGyro-XYZ
time BodyGyroJerk-XYZ
time BodyAccMag
time GravityAccMag
time BodyAccJerkMag
time BodyGyroMag
time BodyGyroJerkMag
freq BodyAcc-XYZ
freq BodyAccJerk-XYZ
freq BodyGyro-XYZ
freq BodyAccMag
freq BodyAccJerkMag
freq BodyGyroMag
freq BodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean value (): Mean value
Standard deviation (): Standard deviation
Mean value Freq(): Weighted average of the frequency components to obtain a mean frequency

The complete list of variables of each feature vector is available in 'tidyAvgData.txt'
