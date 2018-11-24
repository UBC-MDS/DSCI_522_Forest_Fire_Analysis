#! /usr/bin/env python

###################################################
## visualize_data.R 
## Date: NOV 2018
## Author: Jim Pushor and Weifeng Davy Guo
## 
## Import the cleaned data to generate a general plot for user to understand the background
##
## Usage: Rscript scripts/visualize_data.R data/cleaned_forestfires.csv img/EDA.png
###################################################

# load library
library(tidyverse)
library(ggbeeswarm)

# read in commandline arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

#define main fucntion
main <- function(){
  
  # read in data
  forest <- read.csv(input_file)
  
  # draw plot to compare data 
  ggplot(forest, aes(x = day, y = area))+
    geom_quasirandom(alpha = 0.5)+
    scale_y_log10()+
    xlab("Day of the Fire Starting") +
    ylab("Burning Area (Hectare)")
  
  # save plot
  ggsave(output_file)
}

# call main function
main()


