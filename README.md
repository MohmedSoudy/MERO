# MERO: Performing Monte Carlo Expectation Maximization Random Forest Imputation for Biological Data

[![](https://www.r-pkg.org/badges/version/MERO?color=green)](https://CRAN.R-project.org/package=MERO) 
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/MERO)](https://CRAN.R-project.org/package=MERO) 

# Installation

```R
install.packages("MERO")
```

# Description

Perform missing value imputation for biological data using the random forest algorithm, the imputation aim to keep the original mean and standard deviation consistent after imputation.

# Documentation

For the documentation see: [MERO Documentation](https://cran.r-project.org/web/packages/MERO/MERO.pdf).

# Package information

- link to package on CRAN: [MERO](https://cran.r-project.org/package=MERO)

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
![](https://raw.githubusercontent.com/MohmedSoudy/datasharing/master/Corr.jpeg)

# Contribution Guidelines

For bugs and suggestions, the most effective way is by raising an issue on the github issue tracker. Github allows you to classify your issues so that we know if it is a bug report, feature request or feedback to the authors.
