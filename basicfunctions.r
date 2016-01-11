# Add 2 numbers
add2 <-function(x,y){
  x+y
}

#Above 10
above10 <- function(x){
  use <- x>10
  x[use]
}
# Use default values
above <- function(x,n=10){
  use<-x>n
  x[use]
}
# Calculate the means of all columns of a data frame
colmean <- function(y,removeNA = TRUE){
  nc <- ncol(y)
  nr  <- nrow(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i],na.rm = removeNA)
  }
  means
}
