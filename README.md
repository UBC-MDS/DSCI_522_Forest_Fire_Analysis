# Forest Fire Analysis

November, 2018                               
Davy Guo and Jim Pushor    
    
#### Project Summary

The purpose of the project was to explore a data set featuring forest fires in a national park of Portugal. We decided on an inferential question: **Do fires that begin on weekends burn more area on average than fires that begin on weekdays?**. 

Among 13 related attributes in the data. Many of these attributes we assume to be obviously associated with the size of the burnt area (wind speed or ambient temperature), but what about an attribute that might not be so obviously associated with the size of the forest that burns? Would the day of the week that a fire starts have any bearing on the average size of the burnt area? Sometimes resources available in public services are more scarce on weekends versus weekdays, and this might contribute to larger fires that start on the weekend compared to weekdays.

We have already determined a fixed value of alpha to 0.05 to represent a threshold of significance for rejection of the null hypothesis. To provide the context of our analysis,a small set of sample data with the difference of means between the two groups can be produced along with the high and low confidence intervals. Additionally, we can provide a p-value and a plot (i.e. null hypothesis distribution) with the confidence intervals and test statistic overlayed clearly to assist with our supporting our conclusion from our data. To aid in communicating our conclusion, the null hypothesis distribution may be represented with a histogram or kernel density plot along with visually representing where our observed test statistic and confidence intervals sit.

#### Data Set Identification
After reviewing several datasets, we have chosen the ["Forest Fire Data Set" from the UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Forest+Fires).


![](img/script_ex.png)

#### Dependencies
R & R Libraries

* tidyverse 

* infer 

* ggbeeswarm

#### Usage

To process the analysis, we could run the following commandlines, or simply run the shell script "run_all.sh":

```
# load and clean data, inputfile: forestfires.csv, outputfile: cleaned_forestfires.csv 
Rscript scripts/clean_data.R data/forestfires.csv data/cleaned_forestfires.csv
    
# plot exploratory visualization, inputfile: cleaned_forestfires.csv, outputfile: EDA.png 
Rscript scripts/visualize_data.R data/cleaned_forestfires.csv img/EDA.png

# analyze data, inputfile: cleaned_forestfires.csv, outputfile: null_distribution_two_means.csv
Rscript scripts/analyze_data.R data/cleaned_forestfires.csv data/null_distribution_two_means.csv

# create plot and results, inputfile: cleaned_forestfires.csv, outputfile: result.png 
Rscript scripts/result.R data/cleaned_forestfires.csv img/result.png

# make report
Rscript -e "rmarkdown::render(''./reports/report.Rmd','github_document')"
```

 

