# Description: calculate the skewness of a binomial distribution
# Inputs
#   trials: the number of trials
#   prob: probability of success on each trial
# Output
#   the calculated skewness

aux_skewness <- function(trials, prob){
  skewness = (1-2*prob)/sqrt(trials*prob*(1-prob))
  return(skewness)
}
