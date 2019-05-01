#'@title mean function of a binomial distribution
#'@description calculate the mean
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calcuted mean
#'@examples
#'bin_mean(trials = 10, prob = 0.3)
#'@export

bin_mean <- function(trials, prob){
  if (check_trials(trials)!='TRUE'){
    check_trials(trials)
  } else if (check_prob(prob) !='TRUE'){
    check_prob(prob)
  } else {
    return(aux_mean(trials,prob))
  }
}
