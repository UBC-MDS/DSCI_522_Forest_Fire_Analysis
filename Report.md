DSCI 522 Forest Fire Analysis
================
Jim Pushor, Weifeng Guo
November 24, 2018

# Report

## Introduction

The purpose of the project was to explore a data set featuring forest
fires in a national part of Portugal. We decided on an inferential
question: **Do fires that begin on weekends burn more area on average
than fires that begin on weekdays?** This question was spun out of
exploring the raw data set table (Table 1).

``` r
library(knitr)
FFR_data <- read.csv("data/FFRSample.csv")
FFC_data <- read.csv("data/FFCSample.csv")
FFS_data <- read.csv("data/Summraized_Data.csv")
```

*Table 1. Forest Fire Raw Dataset
Sample*

| X | Y | month | day | FFMC |   DMC |    DC |  ISI | temp | RH | wind | rain |    area |
| -: | -: | :---- | :-- | ---: | ----: | ----: | ---: | ---: | -: | ---: | ---: | ------: |
| 6 | 5 | sep   | sat | 92.5 | 121.1 | 674.4 |  8.6 | 25.1 | 27 |  4.0 |    0 | 1090.84 |
| 8 | 6 | aug   | thu | 94.8 | 222.4 | 698.6 | 13.9 | 27.5 | 27 |  4.9 |    0 |  746.28 |
| 7 | 4 | jul   | mon | 89.2 | 103.9 | 431.6 |  6.4 | 22.6 | 57 |  4.9 |    0 |  278.53 |
| 1 | 2 | sep   | tue | 91.0 | 129.5 | 692.6 |  7.0 | 18.8 | 40 |  2.2 |    0 |  212.88 |
| 2 | 2 | sep   | sat | 92.5 | 121.1 | 674.4 |  8.6 | 18.2 | 46 |  1.8 |    0 |  200.94 |
| 8 | 6 | aug   | sun | 91.4 | 142.4 | 601.4 | 10.6 | 19.6 | 41 |  5.8 |    0 |  196.48 |

The raw data set included many features that are typical to forest fire
analysis: wind speed, burn area, ambient temperature, dates, etc;
however, considering question criteria outlined in *The Art of Data
Science* By Roger Peng and Elizabeth Matsui, we chose a question that
may not have been answered from this data.

Prior to doing further analysis, we needed to perform some data cleaning
and wrangling. Using `Table 1` we removed any of the rows where the
burnt area was zero. A zero value indicated an extremely small or
neglibable burn area, which could skew our results. We wanted to focus
on the the fire events that resulted in measurable burnt area.

In addition to removing zero valued rows for area burned. We classified
the days of the week into two groups. One group, `Weekday` included all
the weekdays and the other group, `Weekend` included all the weekend
days.

*Table 2. Forest Fire Clean Dataset Sample*

| day     | area |
| :------ | ---: |
| weekday | 0.36 |
| weekday | 0.43 |
| weekday | 0.47 |
| weekday | 0.55 |
| weekday | 0.61 |
| weekend | 0.71 |

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Visualization (EDA)

We explored our clean data by creating a distribution plot to compare
the fire events on a weekend to a weekday. Our general observation was
that they were similarly distributed relative to burnt area.

*Figure 1. Distribution Plot of Forest Fires Weekday vs. Weekend Days*

![](img/EDA.png)

## Analysis

We completed a difference in means null hypothesis test to determine if
there was enough evidence to reject our null hypothesis: the difference
in means is zero.

We produced a data summation table to communicate the critical values of
our analysis between the two groups.

*Table 3. Data Summary Statistics*

|    lower |    upper |     mean | day     |
| -------: | -------: | -------: | :------ |
| 12.09896 | 30.24516 | 19.54287 | weekday |
| 16.86796 | 62.27287 | 34.88528 | weekend |

The following violin plot shows the distribution of the fires with the
above confidence intervals and means noted for each group. The weekend
group shows a larger range for the confidence intervals which suggests
greater variation of values, as well as, effect of a relatively smaller
data set.

*Figure 2. Distribution Plot of Size of Burnt Area by Day Type*  
*95% Confidence Intervals and Means Shown in Red*

![](img/Estimation_and_CI_Plot.png)

``` r
# calculate p-value with infer
  #null_distribution_two_means %>% 
    #get_pvalue(obs_stat = delta_sample, direction = "both")
```

After completing the null hypothesis, we visulized our observed
difference in means between the two groups compared to the null
hypothesis distribution. The resulting histogram shows that our observed
value in inside the range of our 95% confidence intervals. With a pvalue
of 0.158, and the alpha set at 0.05, there is not enough evidence to
reject the null hypothesis that the two means are different.

*Figure 3. Histogram of Null Hypothesis Distribution with Observed Diff
of Means Value in Red* *95% Confidence Intervals in Blue*

![](img/Result.png)

## Conclusion

The difference in means null hypothesis test produced not enough
evidence to reject the null hypothesis. We can say that given the null
hypothesis is true, the probability of us seeing a similar observation
of at least or greater extreme is likely enough (~16%) for us to not
dismiss the null hypothesis statement.

#### Critique and Future Steps

On reflection, there are a few things to consider:

  - Though we are testing the difference of means of a subpopulation of
    a feature, it may be more appropriate to do muliple regression
    testing to understand how the different features impact the response
    variable: burnt area. Some features will be a stronger explanatory
    variable than others. It is difficult to conclude from our analysis
    that only the day of the week has an impact on the size of the fire,
    while isolating the other influentual factors like wind speed and
    temperature.  
  - We made an assumption that there may be a different response rate on
    weekends versus weekdays because of the availability of resources.
    This was not substrantiated.
  - We do not know the priority of fighting these fires in the park. It
    may be the case that the fire fighting is triaged based on risk to
    public safety, versus risk of area burned.

**References**

[UCI Machine Learning Data
Sets](https://archive.ics.uci.edu/ml/datasets/Forest+Fires)  
Peng, Roger and Elizabeth Matsui. “The Art of Data Science: A Guide for
Anyone Who Works with Data” Leanpub. 2018.
