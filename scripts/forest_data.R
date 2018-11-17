# forest_data.R
# DSCI 522 Workflows
# Weifeng Guo
# Jim Pushor
# November 2018

# This script will read in the csv file of sample data for our forest fire analysis 
# from [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv)
# This script takes no arguments.
#
# Usage: Rscript forest_data.R

# load tidyverse library
library(tidyverse)
  
# read in data
forest_data <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv')

head(forest_data)
