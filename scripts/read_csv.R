# read_csv.R
# Weifeng Guo, Nov, 16

# This script read the data file for forest fire analysis 
# from forest.scv. This script takes no arguments.
#
# Usage: Rscript read_csv.R
library(tidyverse)
  # read in data
  data <- read.csv('data/forest.csv')