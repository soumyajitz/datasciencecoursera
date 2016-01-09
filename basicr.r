# Basic R commands
x<- c("a","b","c","c","d")
x[1]
x[2]
x[x>"a"]
u<-x>"a"
u
x[u]
#Subsetting a list
x<-list(foo=1:4,bar = 0.6)
# Will get the sequence
x[1]
# Will get the list from 1:4
x[[1]]
x$foo
x$bar
x["bar"]
x[["bar"]]
#if we wanted to get 1 and 3,extract
x<-list(foo=1:4,bar = 0.6,hello="helloworld")
x[c(1,3)]
#Matrix
x<-matrix(1:6,2,3)
x[1,]
x[,1]
x <- list(hello=1:5)
x$h
x[["h",exact=FALSE]]
#Remove NA values
x<-c(1,2,3,NA,4,NA,5)
bad <- is.na(x)
good <- x[!bad]
good
#Multiple objects with missing values
x<-c(1,2,3,NA,4,NA,5)
y<-c("y","n","n",NA,"y",NA,"n")
good <- complete.cases(x,y)
