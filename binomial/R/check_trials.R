# Description: check trials
# Inputs
#   trials: the number of trials
# Output
#   'TRUE' for a valid trials and a warning message for a invalid one
check_trials <- function(trials){
  if (length(trials)>1){
    stop('trials has to be length 1')
  }else if (class(trials)!='numeric'){
    stop('invalid trials value')
  }else if(trials<0|trials%%1!=0){
    stop('invalid trials value')
  }else{
    return('TRUE')
  }
}
