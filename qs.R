# Question of assignment
ir<-data.frame(iris)
in1<-c()
for (i in 1:nrow(ir))
{
  if(ir[i,"Species"] == "virginica"){
    in1<-c(in1,ir[i,"Sepal.Length"])
  }
}
#----------------------------------------
#Another Approach for first q
tr<-ir$Species == "virginica"
trm<-ir[tr,]
mean(trm$Sepal.Length)
#----------------------------------------

#Another Question
library(datasets)
data(mtcars)
mt<-data.frame(mtcars)

#Another Q
m1<-mean(mt$hp[mt$cyl==8])
m2<-mean(mt$hp[mt$cyl==4])
abs(m1-m2)

#another Solution is:
tapply(mtcars$hp, mtcars$cyl, mean)