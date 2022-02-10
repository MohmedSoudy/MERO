#' Evaluate the imputed data sets and select the best data set 
#'
#'The function is evaluate the imputed data sets based on the mean and standard deviation 
#'
#' @usage EvalImp(Originaldata, ImputedSets ,Imputed.mean, Imputed.sd)
#'
#' @param Originaldata data frame of original data containing the missing values
#'
#' @param ImputedSets list of imputed data frames 
#' 
#' @param Imputed.mean data frame of the means of the imputed data sets
#' 
#' @param Imputed.sd data frame of the standard deviations of the imputed data sets
#'
#' @return The best data frame which mean and standard deviation are close to the original data
#'
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
#' 
EvalImp <- function(Originaldata, ImputedSets ,Imputed.mean, Imputed.sd)
{
  Pro.means <- rowMeans(Originaldata, na.rm = T)
  Pro.sd <- apply(Originaldata, 1, sd, na.rm = T)
  
  Imputed.mean <- data.frame(Imputed.mean)
  Imputed.sd <- data.frame(Imputed.sd)
  
  NA.SD <- which(is.na(Pro.sd))
  if (length(NA.SD) != 0)
  {
    Pro.sd <- Pro.sd[-NA.SD]  
    Imputed.sd <- Imputed.sd[-NA.SD]
  }
  
  NA.mean <- which(is.na(Pro.means))
  if (length(NA.mean) != 0)
  {
    Pro.means <- Pro.means[-NA.mean]
    Imputed.mean <- Imputed.mean[-NA.mean]
  }
  
  RMSE.Mean <- NULL
  RMSE.Sd <- NULL
  for (i in 1:dim(Imputed.mean)[2])
  {
    RMSE.Mean[i] <- RMSE(Pro.means, Imputed.mean[,i])
  }
  for (i in 1:dim(Imputed.sd)[2])
  {
    RMSE.Sd[i] <- RMSE(Pro.sd, Imputed.sd[,i])
  }
  
  min.inx <- which.min(RMSE.Mean)
  Imp.return <- list(ImputedSets[[min.inx]], Pro.means, Imputed.mean[,min.inx])
  return(Imp.return)
}