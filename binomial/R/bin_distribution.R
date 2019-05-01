#'@title binomial distribution function
#'@description return the distribution of a binomial distribution
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calculated distribution
#'@examples
#'bin_distribution(trials = 5 ,prob = 0.5)
#'@export

bin_distribution <- function(trials, prob){
  success = 0:trials
  probability = bin_probability(success = success, trials = trials, prob = prob)
  dat <- data.frame(
    success = success,
    probability = probability
  )
  class(dat) <- c('bindis','data.frame')
  dat
}

#'@export

plot.bindis <- function(dat){
  barplot(dat[,2], names.arg =  dat[,1], xlab = 'successes',ylab = 'probability')

}
