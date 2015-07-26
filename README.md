# Getting and Cleaning Data - CourseProject

## Introduction

This repository contains course project for [Coursera](https://coursera.org) course [Getting and Cleaning Data](https://www.coursera.org/course/getdata).
It contains a script called `run_analysis.R`, that does the following:

1. Reads UCI HAR data (supposing that it's placed in current working directory)
2. Modifies the data
3. Creates new data set with the average of each variable for each activity and each subject

For more information look at `CodeBook.md`.

## How to use it?

Download UCI HAR data, unzip it. Set working directory to directory that contains HAR data. 
Download `run_analysis.R` script. It will produce new data, stored in `tidy.txt` file.
