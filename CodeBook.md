Code book 
=================

This document describes how the R file `run_analysis.R` (see this directory) works.


##Functions
The file `run_analysis`contains three functions.

1. `startTidy`- starts the other two functions
2. `getTidy1` - writes the dataset 'tidy1.csv`
3. `getTidy2` - writes the dataset 'tidy2.csv`


## Data sets
`tidy1.csv` is the result of a cleaning and selection of the original dataset.

`tidy2.csv` is the result of an aggregation of `tidy1.csv`.

### Data set `tidy1.csv`

The original data was derived from an experiment, which was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For further info please see:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ](http://)

`tidy1.csv` consists of the following variables:

1. `subject` denotes the subject number performing an activity. In total there are 30 subjects.
2. `activity` shows the activity performed by the subject. There are six activites:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

From the original 561 features only features of the mean and the standard deviations were selected. There were 79 features left. Variables of the activity and the subjectID were added, making a total of 81 columns.

Original feature names were changed to make the more readable.

* The prefix `t` for "time" was changed into `time`.
* The prefix `f` was changed into `freq`.
* BodyBody has been replaced by Body
* "mean" and "std" were changed to capital letters to make reading easier.

Full information on the original features can be found in the original dataset, filename: "features_info.txt".

### Data set `tidy2.csv`
The observations from `tidy1.csv` were grouped by subject and activity and then aggregated using the mean function. With 30 subjects and 6 activities we get 180 aggregated observations, described by 81 columns (subject, activity and 79 features of mean and standard deviation).

