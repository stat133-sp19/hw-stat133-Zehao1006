#'@title binomial cumulative distribution function
#'@description return the cumulative distribution of a binomial distribution
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the calculated cumulative distribution
#'@examples
#'bin_cumulative(trials = 5 ,prob = 0.5)
#'@export

bin_cumulative <- function(trials, prob){
  dat <- bin_distribution(trials, prob)
  cumulative <- rep(0,(trials+1))
  for (i in 1:(trials+1)){
    cumulative[i] = sum(dat[1:i,2])
  }
  dat$cumulative <- cumulative
  class(dat) <- c('bincum','data.frame')
  dat
}

#'@export

plot.bincum <- function(dat){
  plot(dat[,3],xlab = 'successes', ylab = 'probability', type = 'o',xaxt='n')
  axis(1,at = seq(1,nrow(dat)+1),label = seq(0,nrow(dat)))
}
