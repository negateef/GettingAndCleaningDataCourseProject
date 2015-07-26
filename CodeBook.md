# Code Book

This document describes the code in `run_analysis` script.
The code is devided by comments in multiple categories:

* Chicking the availability of data and packages
* Reading data
* Merging data
* Adding descriptive names and labels
* Subsetting only features connected to mean and standard deviation
* Getting average for all activities and subjects
* Writing new data to file

## Checking availability of data and packages

Script assumes that `UCI HAR Dataset` is placed in your working directory.
`Dplyr` package is required for this scipt

## Reading data

Test and training data is read to R variables using `read.table` function

## Merging data

Test and Training data is merged together in one variable using `cbind` and `rbind` commands

## Adding descriptive names and labels

To set appropriate names for each features `features.txt` file was used. It contains names for all features.
To set names for activity type file `activity_labels.txt` was used.

## Subsetting only features connected to mean and standard deviation

Using `select` R command, data was changed to data that has only columns connected to mean or std.

## Getting average for all activities and subjects 

Using `Ddply` function we created a new data frame, that contains averages of all columns of data, divided by activity and subject

## Writing new data to file

We wrote new data set to file using `write.table` function.
