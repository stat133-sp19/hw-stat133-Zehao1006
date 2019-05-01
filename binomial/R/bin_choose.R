#'@title combination function
#'@description calculates the number of combinations in which k successes can occur in n trials
#'@param n the number of items
#'@param k the number of items choosen
#'@return the calculated combinations
#'@examples
#'bin_choose(n = 5, k = 2)
#'@export

bin_choose <- function(n, k){
  if (sum(k>n)>0){
    stop('k cannot be greater than n')
  }else{
    combinations <- factorial(n)/(factorial(k)*factorial(n-k))
    return(combinations)
  }
}
