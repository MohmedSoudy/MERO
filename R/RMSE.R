#' Calculate Root Mean Square Error 'RMSE' between vectors
#'
#'The function is used to calculate the root mean square error between two vectors
#'
#' @usage RMSE(Actual, Predicted)
#'
#' @param Actual Vector of actual data
#'
#' @param Predicted vector of predicted data
#'
#' @return The root mean square error between the two input vectors
#'
#' @examples RMSE(c(1,2,3), c(10,20,30))
#'
#' @export
#'
#' @author Mohamed Soudy \email{Mohmedsoudy2009@gmail.com}
RMSE <- function(Actual, Predicted)
{
  return(sqrt(mean((Actual - Predicted)^2)))
}
