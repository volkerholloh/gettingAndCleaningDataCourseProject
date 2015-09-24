#getting-and-cleaning-data-course-project


## Preparation
* Create a directory for this project
* Download the script `run_analysis.R` and move/save it to the directory created 
* Download the raw data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the directory created and unzip 

## Dependencies
The script `run_analysis.R` needs the libraries `plyr` and `reshape2`. Please install them, if you need to. Then you load them via `library("plyr")`and `library("reshape2")`.
    
## Running the analysis     
* Change the working directory in R to the above directory.   
* Source the script in R: `source("run_analysis.R")`
* Execute the function `startTidy` with no arguments: `startTidy()`

Two datasets will be written to your working directory now: `tidy1.csv` and `tidy2.csv` 


## Codebook
Information about the datasets is provided in `CodeBook.md`.     

## Code
When `startTidy`is called by the user, the functions `getTidy1`and `getTidy2` are executed, generating the two output files.
 
The code contains detailed comments on how the script is working.
