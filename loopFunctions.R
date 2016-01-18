#Creating a list
x<-list(a=1:10,b=abs(rnorm(10)),c=abs(rnorm(100,5)))
#applying the lapply(list,Function) over each and every element of the list
lapply(x, mean)
sapply(x, mean)
y<-1:4
lapply(y,runif,min=0,max=10)

z<-list(matrix(1:8,4,2),matrix(1:6,3,2))
#using lapply on an anonymous function
lapply(z, function(frow) frow[,1])

a<-matrix(rnorm(200),20,10)
#taking the column dimension which is 2 and eliminating the row dimension which is 1 thus 
# containing the means of each of the columns
apply(a, 2, mean)

# calculate the sum of each row
rowsums = apply(a, 1, sum)
#calculate the sum of each column
colsums = apply(a, 2, sum)
# calculate the means of each row
rowmeans = apply(a, 1, mean)
#calculate the means of each column
colmeans = apply(a, 2, mean)

#applying mapply, rep() is the repeat function
mapply(rep, 1:4,4:1)

#tapply()
m<-c(rnorm(10),runif(10),rnorm(10))
f<-gl(3,10)
tapply(m, f, mean,simplify = TRUE)

#split()
split(m,f)