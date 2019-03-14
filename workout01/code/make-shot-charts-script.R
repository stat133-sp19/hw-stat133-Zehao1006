#title: make-shot-charts-script.

#description: this file is ues to create shot charts.

#inputs:1 csv file, 'shots-data.csv'.

#outputs:6 shot charts, of which 5 are individual shot charts and 1 is team shot chart.

#loading data
iguodala <- read.csv("../hw-stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../hw-stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../hw-stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../hw-stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
shots_data <- read.csv("../hw-stat133/workout01/data/shots-data.csv", stringsAsFactors = FALSE)

#loading R packages
library('jpeg')
library('grid')
library('ggplot2')

#court image(to be used as background of plot)
court_file <- '../hw-stat133/workout01/images/nba-court.jpg'

#create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)

#create shot charts
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Clay Thompson (2016 season)') +
  theme_minimal()
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
pdf(file = "../hw-stat133/workout01/images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()
pdf(file = "../hw-stat133/workout01/images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()
pdf(file = "../hw-stat133/workout01/images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()
pdf(file = "../hw-stat133/workout01/images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()
pdf(file = "../hw-stat133/workout01/images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

#create facetted shot chart
shots_data$name <- as.factor(shots_data$name)
facetted_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal()
pdf(file = "../hw-stat133/workout01/images/gsw-shot-charts.pdf",width = 8,height = 7)
facetted_shot_chart
dev.off()
png(filename = "../hw-stat133/workout01/images/gsw-shot-charts.png",width = 8,height = 7,units = 'in',res = 100)
facetted_shot_chart
dev.off()


