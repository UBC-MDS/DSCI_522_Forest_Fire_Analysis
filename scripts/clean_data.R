#! /usr/bin/env python

##################################################
## analyze_data.R 
## Date: NOV 2018
## Author: Jim Pusher and Weifeng Davy Guo
## 
## Import the forest fire data and assign "weekday" and "weekend" to variable "day" then save 
## the cleaned data
##
## Usage: Rscript scripts/clean_data.R data/forestfires.csv data/cleaned_forestfires.csv
###################################################

# load library
library(tidyverse)
library(infer)

# read in commandline arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

#define main fucntion
main <- function(){
  
  # read in data
  fire_data <- read.csv(input_file)
  
  # data wrangling for later use, relabel the variable and filtering bias data 
  fire <- fire_data %>%
    filter(area != 0.0) %>% 
    select(day,area) %>%
    mutate(day = fct_recode(day,
                            "weekday" = "mon", 
                            "weekday" = "tue", 
                            "weekday" = "wed",
                            "weekday" = "thu", 
                            "weekday" = "fri", 
                            "weekend" = "sat",
                            "weekend" = "sun"))
  
  # save cleaned data
  write_csv(fire, output_file)
}

# call main function
main()

