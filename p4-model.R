## P4-model
## Created 02 April 2023
## The purpose of this code is to fit a linear regression model
## to the Carlsen roads data and determine graphically if the assumptions
## required for linear regression are reasonable.

##
library(tidyverse)
setwd("C:/Users/jason/Downloads/STAT 300/P4-Project")
road_data <- read_csv("Road_Data_2.csv")[-1]

## Fit a regression using all explanatory variables and interactions
## to start.
roads_biggest_model <- lm(log(Weeks) ~ Cars*Climate*Material, data = road_data)
summary(roads_biggest_model)

## Backwards Selection using AIC
roads_model <- step(roads_biggest_model,direction = "backward")
summary(roads_model)

## Residual plots
plot(roads_model)

## Mean 0 error assumption does not appear valid under ordinary linear
## regression, residuals vs fitted values plot makes me think there is a
## rational relationship between cars and weeks after adjusting for 
## climate and material

road_data$Cars2 <- 1/(road_data$Cars)
roads_biggest_model2 <- lm(Weeks ~ Cars2*Climate*Material +
                             Cars*Climate*Material, data = road_data)
summary(roads_biggest_model2)

## Backwards Selection using AIC
roads_model2 <- step(roads_biggest_model2,direction = "backward")
summary(roads_model2)

plot(roads_model2)
ggplot(data = road_data,
       mapping = aes(x = fitted.values(roads_model2),
                     y = residuals(roads_model2),
                     col = Material,
                     alpha = 0.25)) +
  geom_point() +
  ylab("residuals") +
  xlab("fitted values")
