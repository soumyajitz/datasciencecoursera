g <- read.csv("/Users/soumyajitsarkar/Desktop/datasciencecoursera/getdata-data-ss06hid.csv")
k<-g$VAL
l<-is.na(k)
z<-k[!l]
q<-z[z>=24]
length(q)
#EXCEL
library(XLConnect)
q<- readWorksheetFromFile("/Users/soumyajitsarkar/Desktop/datasciencecoursera/getdata-data-DATA.gov_NGAP.xlsx",sheet = 1, header = TRUE, startCol = 7, startRow = 18, endCol = 15, endRow = 23)
sum(q$Zip*q$Ext,na.rm=T)
# XML
library(XML)
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
z<-zipcode[zipcode == 21231]
length(z)
# CSV
DT<- read.csv("/Users/soumyajitsarkar/Desktop/datasciencecoursera/getdata-data-ss06pid.csv")
library(data.table)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
