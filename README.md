# Forest Fire Analysis

November, 2018                               
Davy Guo and Jim Pushor    

#### Project Summary

The purpose of the project was to explore a data set featuring forest fires in a national park of Portugal. We decided on an inferential question: **Do fires that begin on weekends burn more area on average than fires that begin on weekdays?**.

Amongst the 13 related attributes in the data, we assume many, if not all to be associated with the size of the area burnt (wind speed or ambient temperature), but what about an attribute that might not be so obviously associated with the size of the forest that burns? Would the day of the week that a fire starts have any bearing on the average size of the burnt area?

The general set up of the analysis path was as follows. We conducted exploratory data analysis and established our inferential question. Subsequently, we established our null hypothesis: "There is no difference in mean area burnt between fires that start on weekdays compared to weekends". We wrangled the original data set into a subset with an aggregation to represent our explanatory variables (weekday and weekend day), which was used to conduct a simulation of sample draws under the assumption of the null hypothesis being true. We produced a sampling distribution under this assumption and compared where the observed difference of means value fell within the sampling distribution. In addition to a visual representation through a histogram plot, we utilized the p-value at a statistical significance level of 0.05 to assist with assessing whether there was enough evidence to reject the null hypothesis.

Finally, we offer some critical review of our decisions and assumptions. We end with discussing future considerations if the analysis is to continue.

#### General Orientation
In addition to the "Project Summary" above, this readme document contains a reference to the data set and our project dependencies related to the software used in statistical analysis. In order to reproduce our data, we offer the user shell commands to proceed through 5 steps of reproducing our work: from cleaning the data, to creating a markdown file containing our analysis report. In addition to individual scripts, we have provided a Docker image accessed through a few steps below, which will also reproduce the analysis. For orientation purposes, we have included an overview of the Forest Fire Analysis repository structure. Finally, a code of conduct is outlined to provide clarity on contribution and maintenance of the project within the context of responsible and reasonable usage.

#### Data Set Identification
After reviewing several datasets, we have chosen the ["Forest Fire Data Set" from the UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Forest+Fires).


![](img/script_ex.png)

#### Dependencies
R 3.5.1
R Libraries

* tidyverse 1.2.1

* infer 0.3.1

* ggbeeswarm 0.6.0

* knitr 1.20

#### Usage

To process the analysis, we could run the following individual statements at the command line, or simply run all the shell scripts "run_all.sh":

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

#### Repository Structure

```
project_root/
├── reports/
│   ├── report.Rmd
│   ├── report.md
├── scripts/
│   ├── forest_data.R
│   ├── clean_data.R
│   ├── analyze_data.R
│   ├── visualize_data.R
│   ├── result.R
├── data/
│   ├── FFCSample.csv
│   ├── FFC_data.csv
│   ├── FFRSample.csv
│   ├── Summarized_Data.csv
│   ├── cleaned_forestfires.csv
│   ├── forestfires.csv
│   ├── null_distribution_two_means.csv
├── img/
│   ├── EDA.png
│   ├── Estimation_and_CI_Plot.png
│   ├── Result.png
│   ├── script_ex.png
│   ├── EDA.png
├── README.md
├── .gitignore
├── run_all.sh
├── makefile
```

#### Docker Image

Docker provides a convenient method to package our entire analysis application, dependencies and all, so anyone can reproduce our work on their local computer. A user can run the entire the "Forest Fire Analysis", just like we did, and be confident that the Docker container contains everything they need to reproduce the work. Follow the steps below to reproduce our analysis:

**Step 1:** Clone/download this repository and create a local repository.

**Step 2:** Use the command line to navigate to the root of this project on your computer, and then type the following (filling in PATH_ON_YOUR_COMPUTER with the absolute path to the root of this project on your computer).

docker run --rm -e PASSWORD=1234 -v <PATH_ON_YOUR_COMPUTER>:/DSCI_522_Forest_Fire_Analysis davyguo/dsci_522_forest_fire_analysis  make -C '/DSCI_522_Forest_Fire_Analysis' all

**Step 3** The analysis is now in your local folder ready for your review.

**Step 4** Once you are completed with the analysis review, clean up/remove the analysis by inputting at the command line:

docker run --rm -e PASSWORD=1234 -v <PATH_ON_YOUR_COMPUTER>:/DSCI_522_Forest_Fire_Analysis davyguo/dsci_522_forest_fire_analysis make -C '/DSCI_522_Forest_Fire_Analysis' clean


#### Final Report

The report will be found through link below:

https://github.com/UBC-MDS/DSCI_522_Forest_Fire_Analysis/blob/master/reports/Report.md
