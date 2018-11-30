# Jim Pushor and Weifeng Davy Guo

all: reports/report.md

data/cleaned_forestfires.csv: data/forestfires.csv scripts/clean_data.R
	Rscript scripts/clean_data.R data/forestfires.csv data/cleaned_forestfires.csv

img/EDA.png: data/cleaned_forestfires.csv scripts/visualize_data.R
	Rscript scripts/visualize_data.R data/cleaned_forestfires.csv img/EDA.png

data/null_distribution_two_means.csv: data/cleaned_forestfires.csv scripts/analyze_data.R
	Rscript scripts/analyze_data.R data/cleaned_forestfires.csv data/null_distribution_two_means.csv

img/Result.png: data/cleaned_forestfires.csv scripts/result.R
	Rscript scripts/result.R data/cleaned_forestfires.csv img/Result.png

reports/report.md: reports/report.Rmd data/FFRSample.csv data/FFCSample.csv data/Summarized_Data.csv img/Estimation_and_CI_Plot.png img/EDA.png img/Result.png
	Rscript -e "rmarkdown::render('reports/report.Rmd')"

clean:
	rm -f data/cleaned_forestfires.csv
	rm -f img/EDA.png
	rm -f data/null_distribution_two_means.csv
	rm -f img/Result.png
	rm -f report/report.md
