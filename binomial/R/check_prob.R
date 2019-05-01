# Description: check prob
# Inputs
#   prob: probability of success on each trial
# Output
#   'TRUE' for a valid prob and a warning message for a invalid one

check_prob <- function(prob){
  if ( length(prob)>1 ){
    stop('prob has to be length 1')
  } else if (class(prob)!='numeric'){
    stop('invalid prob value')
  } else if(prob<0|prob>1){
    stop('invalid prob value')
  } else{
    return('TRUE')
  }
}

