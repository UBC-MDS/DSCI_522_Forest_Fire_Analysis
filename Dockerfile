# Docker file for DSCI522_Forest_Fire_Analysis
# Jim Pushor and Weifeng Davy Guo, Dec, 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# then install the infer, ggbeeswarm package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    infer\
    ggbeeswarm\
