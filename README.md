# DS-Coursera-GettingData
this repo is for getting data clean course project in coursera

This repo contain run_analysis.R, CodeBook.md and UCI HAR Tidyset.txt

### run_analysis.R
the run_analysis.R contain the script to generate tidy data set from the UCI HAR Data set that retrieved from this URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

the run analysis needed dplyr package to run group_by and summarise_each function.
install.packages("dplyr")

the script will make several data set into your current working directory environment.


### CodeBook.md
The CodeBook.md contain explanation of data, variable, adn the transformation process been throught by the UCI HAR Tidyset.txt


### UCI HAR Tidyset.txt
The tidy data set that genreated by the run_analysis.R script.
The file contain the final data set that can be used for the further analytical need
