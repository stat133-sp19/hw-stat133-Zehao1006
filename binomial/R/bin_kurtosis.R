#'@title kurtosis function of a binomial distribution
#'@description calculate the kurtosis
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calcuted kurtosis
#'@examples
#'bin_kurtosis(trials = 10, prob = 0.3)
#'@export

bin_kurtosis <- function(trials, prob){
  if (check_trials(trials)!='TRUE'){
    check_trials(trials)
  } else if (check_prob(prob) !='TRUE'){
    check_prob(prob)
  } else {
    return(aux_kurtosis(trials,prob))
  }
}
