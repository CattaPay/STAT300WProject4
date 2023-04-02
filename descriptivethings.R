library(tidyverse)
dat = read_csv("Road_Data_2.csv")

sum(is.na(dat))

range(dat$Weeks)

sum(dat$Weeks > 2000)


hist(dat$Cars)
hist(dat$Weeks)

ggplot

ggplot(dat) + 
  geom_histogram(aes(x = Cars), color = "black",
                             fill = "lightblue")

ggplot(dat) + 
  geom_histogram(aes(x = Weeks), color = "black",
                 fill = "lightblue")


summary(dat$Cars)
summary(dat$Weeks)



