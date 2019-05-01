#'@title binomial probability function
#'@description calculates the probability of a binomial distribution
#'@param success the number of success
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calculated probability
#'@examples
#'bin_probability(success = 2, trials = 5, prob = 0.5)
#'@export

bin_probability <- function(success, trials, prob){
  if (check_trials(trials)!='TRUE'){
    check_trials(trials)
  } else if (check_success(success,trials) !='TRUE'){
    check_success(success,trials)
  } else if (check_prob(prob) !='TRUE'){
    check_prob(prob)
  } else {
    probability = bin_choose(trials, success)*prob^success*(1-prob)^(trials - success)
    return(probability)
  }
}
