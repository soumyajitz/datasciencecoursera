setwd("/Users/soumyajitsarkar/Desktop/datasciencecoursera/")
#Q1
urlData <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filename<- "ACS2006.csv"
download.file(urlData,filename,method = "curl")

data1<- read.csv("ACS2006.csv")
list1 <- strsplit(names(data1),"wgtp")
list1[123]

#Q2
gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
filename2 <- "gdpData.csv"
download.file(gdpURL,filename2,method = "curl")

gdpData <- read.csv("gdpData.csv",nrow=190,skip=4)
removeComma <- as.numeric(gsub(",","",gdpData$X.4))
mean(removeComma,na.rm = TRUE)

#Q3
countrys <- grep("^United",gdpData$X.3,value = T)
length(countrys)