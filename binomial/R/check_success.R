# Description: check success
# Inputs
#   success: the number of success out of the tirals
#   trials: the number of trials
# Output:
#   'TRUE' for a valid success and a warning message for an invalid one

check_success <- function(success,trials){
  if (class(success) == 'numeric'|class(success) == 'integer'){
    if (sum(success <0)+sum(success >trials) +sum(success%%1)> 0){
      stop('invalid success value')
    }else {
      return('TRUE')
    }
  }else{
    stop('invalid success value')
  }
}
