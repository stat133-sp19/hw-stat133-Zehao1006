#title: make-shot-data-script

#description:the primary goal of this file is to create 
#a csv data file shots-data.csv that will contain the required
#variables to be used in the visualization phase.

#inputs: five csv files, 'andre-iguodala.csv','draymond-green.csv','kevin-durant.csv','klay-thompson.csv','stephen-curry.csv'
#outputs: one csv file, 'shots-data.csv'

#reading 5 csv files
iguodala <- read.csv("../hw-stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../hw-stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../hw-stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../hw-stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)

#add a column 'name'
iguodala$name <- c('Andre Iguodala')
green$name <- c('Draymond Green')
durant$name <- c('Kevin Durant')
thompson$name <- c('Klay Thompson')
curry$name <- c('Stephen Curry')

#change the original values of shot_made_flag
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes'

#add a column 'minute'

iguodala$minute <- 48- iguodala$period*12 + iguodala$minutes_remaining
green$minute <- 48 - green$period*12 + green$minutes_remaining
durant$minute <- 48- durant$period*12 + durant$minutes_remaining
thompson$minute <- 48- thompson$period*12 + thompson$minutes_remaining
curry$minute <- 48- curry$period*12 + curry$minutes_remaining

#send summary
sink(file = '../hw-stat133/workout01/output/ander-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = '../hw-stat133/workout01/output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = '../hw-stat133/workout01/output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = '../hw-stat133/workout01/output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = '../hw-stat133/workout01/output/stephen-curry-summary.txt')
summary(curry)
sink()

#stack the tables
shots_data <- rbind(iguodala,green,durant,thompson,curry)

#export the assembled table
write.csv(
  x = shots_data,
  file = '../hw-stat133/workout01/data/shots-data.csv'
)

#exporting the summary of the assembled table
sink(file ='../hw-stat133/workout01/output/shots-data-summary.txt')
summary(shots_data)
sink()


















