---
title: 'MERO: Monte Carlo Expectation Maximization Random Forest Imputation for Biological Data'
tags:
  - R
  - Missing values
  - Biological data
  - Imputation
authors:
  - name: Mohamed Soudy
    orcid: 0000-0003-2735-0038
    affiliation: Bioinformatics program, Faculty of computer science and information technology, Ain Shams University
date: 22 February 2022
bibliography: paper.bib

# Summary

Missing value imputation is a keystone task in biological data analysis. The development of technologies and the profusion of biological data have led to a 
wide breakthrough in the missing value imputation algorithms and techniques. Although the optimal performance of the existing algorithm for missing value imputation,
there are many obstacles and challenges to overcome. Existing methods are developed based on mathematical presuppositions between numbers rather than
the biological presuppositions of data. Moreover, the imputed number can significantly affect the mean and standard deviation of groups, which will lead to misleading results.
Our methodology emphasizes the homogeneity between the imputed and the original data. Experimental results show that the proposed method outperforms existing methods for missing value imputation.

# Statement of need

Biomarkers' discovery and expression quantification of genes and proteins are crucial tasks in biological research. 
Statistical analysis is the primary stage in identifying biomarkers that differ between groups. The occurrence of missing values (MVs)
in gene/protein abundance data has a significant influence on the efficacy of statistical inference and downstream functional analysis [@Jin:2021].
The presence of missing values may be due to biological factors or artifact factors. Four forms of missing data may be broadly classified.
Missing completely at random (MCAR), missing at random, missing not at random, and structurally missing are all examples of missing.
Each kind might be present in the data, or it could be a mix of numerous missing data types. Missing values in biological data can be generally
characterized as missing at random (MAR) and missing not at random (MNAR) [@Jin:2021]. While the null hypothesis of statistical tests
such as the t-test is that there is no difference between the means of two groups, the analysis of variance (ANOVA) states that there is not always a difference in means.
Therefore, most of the imputation methods strive to keep the means of each gene or protein constant after imputation. 

`MERO` was designed to be used by both biological researchers to fill the need of finding a roubst tool for missing value imputation. 
Our package aims to keep the mean and standard deviation of the imputed data consistent to limit the misleading results due to the effect of the imputation.


# Usage and Features

### Installation
```{r}
install.packages("MERO")
```
### Documentation
For the documentation see: [MERO Documentation](https://cran.r-project.org/web/packages/MERO/MERO.pdf).

# Usage

**Example**

```R
library(MERO) 
library(missForest)
#Load a sample data 
data(iris)
summary(iris)
## The data contains four continuous and one categorical variable.
## Artificially produce missing values using the 'prodNA' function:
iris.mis <- prodNA(iris, noNA = 0.2)
summary(iris.mis)
#Impute the missing data using random forest 
#Nsets is the number of data sets to be imputed/ the number of runs or simulations
#ntree is the number of trees for random forest
Imp.data <- MERO(Data = iris.mis[,1:4], ntree = 100, Nsets = 5)
#Select the best data set which mean and standard deviation are very close to the original mean and standard deviation of the input data
Best.hit <- EvalImp(Originaldata = iris.mis[,1:4], ImputedSets = Imp.data[[1]],
                    Imputed.mean = Imp.data[[2]], Imp.data[[3]])
#Visualize the correlation between the original means and the imputed means of  the data sets
PlotCorrelateMean(Best.hit[[2]],Best.hit[[3]])
```
# Conclusion 

Imputation of missing values is a critical job in the biological data processing. The advancement of technology and the abundance of biological data have resulted in significant advances in missing value imputation algorithms and approaches. The random forest algorithm is widely used for missing value imputation of biological data and is reported as the best performer.
Our package aims to keep the mean and standard deviation of the imputed data consistent to limit the misleading results due to the effect of the imputation.

# References
