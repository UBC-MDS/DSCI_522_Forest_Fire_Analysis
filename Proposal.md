# The Proposal for Forest Fire Analysis


#### Data Set Identification
After review several dataset and dicusstion, we've chosen the Forest Fire Data Set from the UCI Machine Learning Repository as our project topic. 

#### Question Identification
In this dataset, there are 517 instance of forest fires in a natural park, each instance has 13 attributes. Among this attributes, we found it's interesting to take a look at the relationship between the days of fire starts and the buring area of the fire. 

The question we define is: Do fires that begin on weekends burn more area on average than fires that begin on weekdays? With this defination, our question is an inferential question

#### Analysis Plan

We will need to select two columns from the dataset. "day" and "area", then we label days from "mon" to "fri" as "weekday" and days from "sat" to "sun" as "weekend".


Folloing the five step method we've learned, our analysis plan is:

1. Define the null and alternative hypothesis:
    $H_0$: The average burning area of the fire which start on weekends is the *same* with the the average burning area of the fire which start on weekdays.
    $H_A$: The average burning area of the fire which start on weekends is the *different* from the the average burning area of the fire which start on weekdays

2. Compute the test statistic that corresponds to the null hypothesis:

$\delta$* = $S_weekends$-$S_weekdays$ = 0

3. Use a model of the null hypothesis to generate a random dataset similar to the original dataset ($\delta$) and calculate a test statistic from that randomly generated dataset (do this many times to generate a distribution)

4. See where the test statistic ($\delta$*) from our sample(s) falls on this distribution

5. If it is near the extremes (past some threshold) we reject the null hypothesis, otherwise we cannot.


#### Data summarization
We plan to use p-value = 0.05 and 95% confidence interval to see if the p-value could be rejected.


#### Citation

https://archive.ics.uci.edu/ml/datasets/Forest+Fires
Paulo Cortez, pcortez '@' dsi.uminho.pt, Department of Information Systems, University of Minho, Portugal. 
Aníbal Morais, araimorais '@' gmail.com, Department of Information Systems, University of Minho, Portugal.
