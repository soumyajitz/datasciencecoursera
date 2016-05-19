library(datasets)
data(cars)
with(cars,plot(speed,dist))

library(lattice)
state <- data.frame(state.x77,region = state.region)
xyplot(Life.Exp ~ Income | region,data = state,layout =c(4,1))
