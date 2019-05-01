# Description: calculate the mean of a binomial distribution
# Inputs
#   trials: the number of trials
#   prob: probability of success on each trial
# Output
#   the calculated mean

aux_mean <- function(trials, prob){
  return(trials*prob)
}
