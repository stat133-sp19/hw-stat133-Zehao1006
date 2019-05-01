# Description: calculate the mode of a binomial distribution
# Inputs
#   trials: the number of trials
#   prob: probability of success on each trial
# Output
#   the calculated mode

aux_mode <- function(trials, prob){
  if (as.integer(trials*prob+prob) == trials*prob+prob){
    return(c(as.integer(trials*prob+prob), as.integer(trials*prob+prob)-1))
  } else{
    return(as.integer(trials*prob+prob))
  }
}
