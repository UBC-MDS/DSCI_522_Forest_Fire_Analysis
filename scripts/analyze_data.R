#! /usr/bin/env python

###################################################
## analyse_data.R 
## Date: NOV 2018
## Author: Jim Pushor and Weifeng Davy Guo
## 
## Import the cleaned data to analyse to get the null distribution
##
## Usage: Rscript scripts/analyze_data.R data/cleaned_forestfires.csv data/null_distribution_two_means.csv
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
  
  # get estimate info for weekday fire
  weekday <- forest %>% 
    filter(day == "weekday")
  
  mean_weekday <- mean(weekday$area)
  
  weekday_ci <- weekday %>% 
    specify(response = area) %>% 
    generate(reps = 1000)  %>% 
    calculate(stat = "mean")  %>% 
    get_ci() %>% 
    rename(lower = `2.5%`, upper = `97.5%`) %>% 
    mutate(mean = mean_weekday,
           day = "weekday")
  
  # get estimate info for weekend fire
  weekend <- forest %>% 
    filter(day == "weekend")
  
  mean_weekend <- mean(weekend$area)
  
  weekend_ci <- weekend %>% 
    specify(response = area) %>% 
    generate(reps = 1000)  %>% 
    calculate(stat = "mean")  %>% 
    get_ci() %>% 
    rename(lower = `2.5%`, upper = `97.5%`) %>% 
    mutate(mean = mean_weekend,
           day = "weekend")
  
  # combine summarized data
  summarized <- bind_rows(weekday_ci, weekend_ci)
  write_csv(summarized,"data/Summarized_Data.csv")
  
  # plot estimates and ci's
  ggplot(forest, aes(x = day, y = area)) +
    geom_jitter(alpha = 0.6, width = 0.1, size = 1) +
    geom_violin() +
    stat_summary(fun.y = mean, geom = "point", shape = 18, size = 3, color = "red") +
    geom_errorbar(data = summarized, 
                  mapping = aes(x = day, y = mean, ymin = lower, ymax = upper),
                  color = "red", width=.5)+
    ylim(0,300) +
    theme_bw() +
    xlab("Day of the Fire Starting") +
    ylab("Burning Area (Hectare)") 
  
  #save plot
  ggsave("img/Estimation_and_CI_Plot.png")
  
  # test data correspond to null hypothesis
  mean_weekday <- mean(filter(forest, day == "weekday")$area)
  mean_weekend <- mean(filter(forest, day == "weekend")$area)
  obs_diff <- mean_weekday - mean_weekend
  
  set.seed(1)
  null_distribution_two_means <- forest %>% 
    specify(formula = area ~ day) %>% 
    hypothesize(null = "independence") %>% 
    generate(reps = 15000)  %>% 
    calculate(stat = "diff in means", order = c("weekday", "weekend")) 
  
  # save null distribution
  write_csv(null_distribution_two_means, output_file)
}

# call main function
main()