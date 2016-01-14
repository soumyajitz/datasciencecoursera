completeCase<-function(directory,id = 1:332){
  completedata<-rep(0,length(id))
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep ="/")
  count<-1
  for(i in id){
    dir<-read.csv(file_paths[i],header = T,sep = ",")
    completedata[count] <- sum(complete.cases(dir))
    count<-count+1
  }
  result <- data.frame(id = id,nobs = completedata)
  result
}