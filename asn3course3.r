library(httr)
setwd("/Users/soumyajitsarkar/Desktop/datasciencecoursera/")
# Q1

data1 <- read.csv("getdata-data-ss06hid1.csv")
logic <- data1$ACR==3 & data1$AGS==6
ans1 <- which(logic)[1:3]
ans1

#Q2
install.packages("jpeg")
library(jpeg)

download1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
filename <- "jeff.jpg"
download.file(download1,filename,method = "curl")
pic <-readJPEG("jeff.jpg",native=TRUE)
quantile(pic,probs = c(0.3, 0.8))

#Q3
gdpdata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdpdestination <- "gdp.csv"
download.file(gdpdata,gdpdestination,method="curl")

edudata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
edudestination <- "edu.csv"
download.file(edudata,edudestination,method = "curl")

gdp <- read.csv("gdp.csv",header=F, skip=5, nrows=190)
gdp <- gdp[,c(1,2,4,5)]
edu <- read.csv("edu.csv")
mergedData <- merge(gdp,edu,by.x = "V1",by.y = "CountryCode", sort=T)

mergedData[with(mergedData,order(-V2))]

#Q5
quantile(mergedData$V2,probs = c(0.2,0.4,0.6,0.8,1))
q <- mergedData$V2<=38

xtabs(q ~ mergedData$Income.Group)



