# Description: calculate the kurtosis of a binomial distribution
# Inputs
#   trials: the number of trials
#   prob: probability of success on each trial
# Output
#   the calculated kurtosis

aux_kurtosis <- function(trials, prob){
  kurtosis <- (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return(kurtosis)
}
