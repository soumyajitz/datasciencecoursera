corr<-function(directory,threshold=0){
  completedata<-completeCase(directory,1:332)
  nobs <- completedata$nobs
  ids <- completedata$id[nobs>threshold]
  correlation <- rep(0,length(ids))
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep ="/")
  count<-1
  for(i in ids){
    dir<-read.csv(file_paths[i],header = T,sep = ",")
    correlation[count] <- cor(dir$sulfate,dir$nitrate,use = "complete.obs")
    count<-count+1
  }
  correlation
}