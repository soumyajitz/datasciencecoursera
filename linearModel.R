# set seed for random number generation
set.seed(100)
# x is a vector of random variables of 100 numbers
x <- rnorm(100)
# epsilon or e is also a vector of random variables with mean 0 and standard deviation 2
e <- rnorm(100,0,2)
# the linear model
y <- 0.5 + 2*x + e
summary(y)
#plotting x w.r.t y
plot(x,y)
# Now poisson distribution
set.seed(1)
x1 <- rnorm(100)
# set the logarithm for x1 according to the equation
log.mu <- 0.5 + 0.3 *x1
y1 <- rpois(100,exp(log.mu))
summary(y1)
plot(x1,y1)


# sample function
#sample four numbers between 1 and 10
sample(1:10,4)
#sample letters
sample(letters,5)
