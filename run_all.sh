
###################################################
## run_all.sh
## Date: NOV 2018
## Author: Jim Pushor and Weifeng Davy Guo
##
## run all the Scripts
##
## Usage: bash run_all.sh
##################################################

# load and clean data
Rscript scripts/clean_data.R data/forestfires.csv data/cleaned_forestfires.csv

# plot exploratory visualization
Rscript scripts/visualize_data.R data/cleaned_forestfires.csv img/EDA.png

# analyze data and save null distribution
Usage: Rscript scripts/analyze_data.R data/cleaned_forestfires.csv data/null_distribution_two_means.csv

# create plot and results
Rscript scripts/result.R data/cleaned_forestfires.csv img/Result.png

# make report
Rscript -e "rmarkdown::render('./reports/report.Rmd','github_document')"
