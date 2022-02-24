---
title: 'MERO: Monte Carlo Expectation Maximization Random Forest Imputation for Biological Data'

tags:
  - R
  - Missing values
  - Biological data
  - Statistical analysis

authors:
  - name: Mohamed Soudy
    orcid: 0000-0003-2735-0038
    affiliation: "1"

affiliations:
 - name: Bioinformatics program, Faculty of computer science and information technology, Ain Shams University, Cairo, Egypt.
   index: 1

date: 24 February 2022

bibliography: paper.bib

---

# Summary

Missing value imputation is a keystone task in biological data analysis. The development of technologies and the profusion of biological data have led to a wide breakthrough in the missing value imputation algorithms and techniques. Although the optimal performance of the existing algorithm for missing value imputation, there are many obstacles and challenges to overcome. Existing methods are developed based on mathematical presuppositions between numbers rather than the biological presuppositions of data. Moreover, the imputed number can significantly affect the mean and standard deviation of groups, which will lead to misleading results. Our methodology emphasizes the homogeneity between the imputed and the original data. Experimental results show that the proposed method outperforms existing methods for missing value imputation.

# Statement of need

Biomarkers' discovery and expression quantification of genes and proteins are crucial tasks in biological research. Statistical analysis is the primary stage in identifying biomarkers that differ between groups. The occurrence of missing values (MVs) in gene/protein abundance data has a significant influence on the efficacy of statistical inference and downstream functional analysis [@jin2021comparative]. The presence of missing values may be due to biological factors or artifact factors. Four forms of missing data may be broadly classified. Missing completely at random (MCAR), missing at random, missing not at random, and structurally missing are all examples of missing. Each kind might be present in the data, or it could be a mix of numerous missing data types. Missing values in biological data can be generally characterized as missing at random (MAR) and missing not at random (MNAR) [@jin2021comparative]. While the null hypothesis of statistical tests such as the t-test is that there is no difference between the means of two groups, the analysis of variance (ANOVA) states that there is not always a difference in means. Therefore, most of the imputation methods strive to keep the means of each gene or protein constant after imputation. 

# Algorithm

The package uses the Monte Carlo Expectation-Maximization algorithm with random forest to impute the missing values in the data. The user selects the number of runs/simulations of the generated data and the generated data sets are evaluated based on their mean and standard deviation compared to the original mean and standard deviation, and the best data set is finally returned. Furthermore, the Root Mean Square Error (RMSE) and Pearson correlation test were used for further evaluation of the imputed data set. 


# Example

An example for the package usage by imputing the missing values of the iris data set and comparing the imputed means to the original means of the data.

```
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

# References
