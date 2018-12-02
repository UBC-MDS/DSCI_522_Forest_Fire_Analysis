# Jim Pushor and Weifeng Davy Guo
# NOV 2018
# This Makefile will automatically rendering report.Rmd and create related output file
# Usuage: Make all; Make clean;

all: reports/report.md data/cleaned_forestfires.csv img/EDA.png data/null_distribution_two_means.csv img/Result.png reports/report.md

# Step 1 load and clean data
data/cleaned_forestfires.csv: data/forestfires.csv scripts/clean_data.R

# Step 2 create EDA plot
img/EDA.png: data/cleaned_forestfires.csv scripts/visualize_data.R
	Rscript scripts/visualize_data.R data/cleaned_forestfires.csv img/EDA.png

# Step 3 analyze data and create null distribution
data/null_distribution_two_means.csv: data/cleaned_forestfires.csv scripts/analyze_data.R
	Rscript scripts/analyze_data.R data/cleaned_forestfires.csv data/null_distribution_two_means.csv

# Step 4 create result plot
img/Result.png: data/cleaned_forestfires.csv scripts/result.R
	Rscript scripts/result.R data/cleaned_forestfires.csv img/Result.png

# Step 5 rendering report.Rmd file
reports/report.md: reports/report.Rmd data/FFRSample.csv data/FFCSample.csv data/Summarized_Data.csv img/Estimation_and_CI_Plot.png img/EDA.png img/Result.png
	Rscript -e "rmarkdown::render('reports/report.Rmd')"

# Clean all output files to reproduce the whole process
clean:
	rm -f data/cleaned_forestfires.csv
	rm -f img/EDA.png
	rm -f data/null_distribution_two_means.csv
	rm -f img/Result.png
	rm -f report/report.md
