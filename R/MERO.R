#' Perform Monte Carlo Expectation Maximization Random Forest Imputation
#'
#'The function is used to impute the missing data using Monte Carlo Expectation Maximization Random Forest Imputation
#'
#' @usage MERO(Data, ntree = 100, Nsets = 5)
#'
#' @param Data a data matrix with missing values. The columns correspond to the variables and the rows to the observations.
#'
#' @param ntree number of trees to grow in each forest.
#' 
#' @param Nsets number of simulations/ data sets to be generated.
#'
#' @return A list containing data sets and imputed means, and imputed standard deviation.
#'
#' @export
#' 
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#' 
MERO <- function(Data, ntree = 100, Nsets = 5)
{
  Datasest <- vector(mode = "list", length = Nsets)
  Imputed.mean <- NULL
  Imputed.sd <- NULL
  pb <- progress_bar$new(total = Nsets)
  Count <- 1
  x <- foreach(
    i = 1:Nsets, 
    .combine = 'c'
  ) %dopar% {
    Imputed.data <- missForest(Data, ntree = 100, verbose = F)
    Datasest[[Count]] <<- Imputed.data$ximp
    Count <<- Count + 1
    Imputed.mean <<- cbind(Imputed.mean,rowMeans(Imputed.data$ximp, na.rm = T))
    Imputed.sd <<- cbind(Imputed.sd, apply(Imputed.data$ximp, 1, sd, na.rm = T))
    pb$tick()
  }
  Out.data <- list(Datasest, Imputed.mean, Imputed.sd)
}