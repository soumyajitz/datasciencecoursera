pollutantmean<-function(directory,pollutant,id = 1:332){
  total<-c()
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep ="/")
  for(i in id){
    dir<-read.csv(file_paths[i],header = T,sep = ",")
    removeNA<-dir[!is.na(dir[,pollutant]),pollutant]
    total <-c(total,removeNA)
  }
  round(mean(total),3)
  #round(total/length(id),3)
}

# #Calculate the mean value of each column by removing NAs
# meanVal<-function(f,pollutant,removeNA = TRUE){
#     if(pollutant == "sulfate"){
#       y <- f[,2]
#       means<- mean(y,na.rm = removeNA)
#     }
#   else if(pollutant == "nitrate")
#     {
#       y <- f[,3]
#       means<- mean(y,na.rm = removeNA)
#     }
#   means
# }

# k<-current_file[,pollutant]
# bad<-is.na(k)
# good<-k[!bad]
# mean(good)

