rankhospital <- function(state,outcome,num = "best"){
  # read data
  data<- read.csv("/Users/soumyajitsarkar/Desktop/datasciencecoursera/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
  states <- unique(data$State)
  # possible outcomes
  outcomes <-c("heart attack","heart failure","pneumonia")
  
  if(!(state %in% states)){
    stop("invalid state")
  }
  
  if(!(outcome %in% outcomes)){
    stop("invalid outcome")
  }
  if(class(num) == "character"){
    if (! (num == "best" || num == "worst")){
      stop("invalid number")
    }
  }
  if(class(num) == "numeric" && num > nrow(data)){
    return (NA)
  }
#   s<-data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
#   s<- as.numeric(s)
#   s<- suppressWarnings(as.numeric(s))
#   s<-s[!is.na(s)]
  data = data[data$State==state,]
 # data = data[,c(11,17,23)]
  
  if(outcome == "heart attack") {
    data = data[,c(2,11)]
  } else if(outcome == "heart failure") {
    data = data[,c(2,17)]
  } else if(outcome == "pneumonia") {
    data = data[,c(2,23)]
  }
  names(data)[2] = "Rate"
  data[, 2] = suppressWarnings( as.numeric(data[, 2]) )
  data <- data[!is.na(data$Rate),]
  data = data[order(data$Rate,data$Hospital.Name),]
  
  if(class(num) == "character") {
    if(num == "best") {
      return (data$Hospital.Name[1])
    }
    else if(num == "worst") {
      return (data$Hospital.Name[nrow(data)])
    }
  }
  else {
    return (data$Hospital.Name[num])
  }
}