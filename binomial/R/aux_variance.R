# Description: calculate the variance of a binomial distribution
# Inputs
#   trials: the number of trials
#   prob: probability of success on each trial
# Output
#   the calculated variance

aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}
