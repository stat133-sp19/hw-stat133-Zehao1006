#'@title binomial variable function
#'@description return the binomial variables
#'@param trials the number of trials
#'@param prob the probability of success on each trial
#'@return the binomial variables
#'@examples
#'bin_variable(trials = 10 ,prob = 0.3)
#'@export

bin_variable <- function(trials, prob){
  if (check_trials(trials)!='TRUE'){
    check_trials(trials)
  } else if (check_prob(prob) !='TRUE'){
    check_prob(prob)
  } else {
    dat <- list(
      trials,
      prob
    )
    names(dat) <- c('number of trials','probability of success')
    class(dat) <- 'binvar'
    return(dat)
  }
}

#'@export

print.binvar <- function(dat){
  cat("\"Binomial variable\"\n")
  cat("\n")
  cat("Parameters\n")
  cat(sprintf("- number of trials: %s\n",dat[1]))
  cat(sprintf("- prob of success : %s",dat[2]))
  invisible(dat)
}

#'@export

summary.binvar <- function(dat){
  a <- list(
    dat[[1]],
    dat[[2]],
    aux_mean(dat[[1]],dat[[2]]),
    aux_variance(dat[[1]],dat[[2]]),
    aux_mode(dat[[1]],dat[[2]]),
    aux_skewness(dat[[1]],dat[[2]]),
    aux_kurtosis(dat[[1]],dat[[2]])
  )
  names(a) <- c('number of trials',
                'probability of success',
                'mean or expected value',
                'variance',
                'mode',
                'skewness',
                'kurtosis')
  class(a) <- 'summary.binvar'
  return(a)
}

#'@export

print.summary.binvar <- function(dat){
  cat("\"Summary Biomial\"\n")
  cat("\n")
  cat("Parameters\n")
  cat(sprintf("- number of trials: %s\n",dat[[1]]))
  cat(sprintf("- prob of success : %s\n",dat[[2]]))
  cat("\n")
  cat("Measures\n")
  cat(sprintf("- mean    : %s\n",dat[[3]]))
  cat(sprintf("- variance: %s\n",dat[[4]]))
  cat(sprintf("- mode    : %s\n",dat[[5]]))
  cat(sprintf("- skewness: %s\n",dat[[6]]))
  cat(sprintf("- kurtosis: %s\n",dat[[7]]))
  invisible(dat)
}
