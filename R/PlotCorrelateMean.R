#' Plot the correlation in scatter plot between original mean and imputed mean
#'
#'The function is used to plot the correlation between the imputed mean and original mean
#'
#' @usage PlotCorrelateMean(OriginalMean, ImputedMean)
#'
#' @param OriginalMean means of the original data 
#'
#' @param ImputedMean means of the imputed data 
#'
#' @return The scatter plot
#'
#' @export
#' 
PlotCorrelateMean <- function(OriginalMean, ImputedMean)
{
  Mean.data <- data.frame(cbind(OriginalMean, ImputedMean))
  colnames(Mean.data) <- c("OriginalMean", "ImputedMean")
  
  P <- ggscatter(Mean.data, x = "OriginalMean", y = "ImputedMean",
            add = "reg.line",                                 
            conf.int = TRUE,                                  
            add.params = list(color = "blue",
                              fill = "lightgray")
  ) +
    stat_cor(method = "pearson", label.x = 3, label.y = 30) 
  
  plot(P)
  return(P)
}