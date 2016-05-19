# Base Plotting System
library(datasets)
data(cars)
with(cars,plot(speed,dist))

# Lattice Plotting System
library(lattice)
state <- data.frame(state.x77,region = state.region)
xyplot(Life.Exp ~ Income | region,data = state,layout =c(4,1))

# GGPlot() System
library(ggplot2)
data(mpg)
qplot(displ,hwy,data=mpg)

