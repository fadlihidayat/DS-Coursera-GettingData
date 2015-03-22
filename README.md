# DS-Coursera-GettingData
this repo is for getting data clean course project in coursera

This repo contain run_analysis.R, CodeBook.md and UCI HAR Tidyset.txt

## run_analysis.R
the run_analysis.R contain the script to generate tidy data set from the UCI HAR Data set that retrieved from this URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

the run analysis needed dplyr package to run group_by and summarise_each function.

install.packages("dplyr")

the script will make several data set into your current working directory environment.

### How run_analysis.R works
1. Download the data and unzipped the file in your current R workdir. it also make new dircetory call data
2. Store all the needed file location into variables
3. load the data of each variable in this sequence :
   - load variable label
   - load test data, subject & activity  set
   - load train data, subject & activity set
4. Names the variables for each one test and train data set
5. Select mean & std column
6. Add subject & activity var to each observation 
7. Binding the train and test data together
8. Give the activity descriptive label by cast it into factor
9. Group by the final data set by subject and activity
10. Summarise each group by its mean value
11. Write the final data setinto file.

### CodeBook.md
The CodeBook.md contain explanation of data, variable, adn the transformation process been throught by the UCI HAR Tidyset.txt


### UCI HAR Tidyset.txt
The tidy data set that genreated by the run_analysis.R script.
The file contain the final data set that can be used for the further analytical need
