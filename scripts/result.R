#! /usr/bin/env python

###################################################
## result.R 
## Date: NOV 2018
## Author: Jim Pusher and Weifeng Davy Guo
## 
## Import the null distribution to generate the a plot of the result figure
##
## Usage: Rscript scripts/result.R data/cleaned_forestfires.csv img/Result.png
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
  forest <- read.csv(input_file)
  
  set.seed(2018)
  null_distribution_two_means <- forest %>% 
    specify(formula = area ~ day) %>% 
    hypothesize(null = "independence") %>% 
    generate(reps = 15000)  %>% 
    calculate(stat = "diff in means", order = c("weekday", "weekend"))
  
  # the test data coresponds to null hypothesis 
  mean_weekday <- mean(filter(forest, day == "weekday")$area)
  mean_weekend <- mean(filter(forest, day == "weekend")$area)
  obs_diff <- mean_weekday - mean_weekend
  
  # draw plot to show result 
  ci <- null_distribution_two_means %>%  get_ci()
  
  null_distribution_two_means%>% visualize() +
    geom_vline(xintercept = obs_diff, colour = "red") +
    geom_vline(xintercept = c(ci[[1]], ci[[2]]), color = "blue", lty = 2)
  
  p_value <- sum(abs(null_distribution_two_means$stat) >= abs(obs_diff))/15000
  
  # save plot
  ggsave(output_file)
}

# call main function
main()


