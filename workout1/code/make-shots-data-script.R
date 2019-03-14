# Title: short title
# description: a short description of what the script is about
# input(s): what are the inputs required by the script?
# output(s): what are the outputs created when running the script?


library(dplyr)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)

curry <- mutate(curry, name = "Stephen Curry")
iguodala <- mutate(iguodala, name = "Adre Iguodala")
green <- mutate(green, name = "Draymond Green")
thompson<- mutate(thompson, name = "Klay Thompson")
durant<- mutate(durant, name = "Kevin Durant")


curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'

green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'

thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'

durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'

##adding column minutes 

curry <- mutate(curry, minute = curry$period * 12 - curry$minutes_remaining)
thompson <- mutate(thompson, minute = thompson$period * 12 - thompson$minutes_remaining)
green <- mutate(green, minute = green$period * 12 - green$minutes_remaining)
durant <- mutate(durant, minute = durant$period * 12 - durant$minutes_remaining)
iguodala <- mutate(iguodala, minute = iguodala$period * 12 - iguodala$minutes_remaining)

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

tables <- rbind(curry, iguodala, green, thompson, durant)

write.csv(x = tables, file = "../data/shots-data.csv")

sink(file = '../output/shots-data-summary.txt')
summary(tables)
sink()


