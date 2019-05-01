#'@title skewness function of a binomial distribution
#'@description calculate the skewness
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calcuted skewness
#'@examples
#'bin_skewness(trials = 10, prob = 0.3)
#'@export

bin_skewness <- function(trials, prob){
  if (check_trials(trials)!='TRUE'){
    check_trials(trials)
  } else if (check_prob(prob) !='TRUE'){
    check_prob(prob)
  } else {
    return(aux_skewness(trials,prob))
  }
}
