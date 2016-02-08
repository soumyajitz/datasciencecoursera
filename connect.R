## Connecting and Listing Databases
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user = "genome",host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;")
dbDisconnect(ucscDb)

## Connect to a Specific Table
hg19 <- dbConnect(MySQL(),user = "genome",db = "hg19",host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

## Get Dimensions of a specific table
dbListFields(hg19,"affyU133Plus2")
res <- dbGetQuery(hg19,"Select * from affyU133Plus2")
dbGetQuery(hg19,"Select count(*) from affyU133Plus2")

## Read Data from Table
affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)

dbDisconnect(hg19)
