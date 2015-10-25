---
title: "CODEBOOK"
author: "Alexey Tkachev"
date: "26/10/2015"
output: html_document
---

##Description
The main task of this project is reading raw data from UCI HAR Dataset, clearing this data, and creating a new tidy dataset with some integral data based on source dataset.

You can read description in a README file. There is a code book for data in a final dataset only.

##Fields:

###subjectID
Identifies the subject who performed the activity for each sample. Its range is from 1 to 30.
Type - numeric

###activity
Identifies the activity type.
It has one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Type - character string

###variable
Identifies the variable name. These variables were selected from source dataset. 
It can has one of values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Type - character string

###mean
Contains the mean value for given combination of subject, activity, and variable. These values was calculated from a variables in source dataset.
Type - numeric (double)
