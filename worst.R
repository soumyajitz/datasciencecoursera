worst <- function(state,outcome){
  if(nchar(state)>2){
    print("Enter State Abbreviation")
  }
  else
  {
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
    hospname <- NULL
    #Filter data according to state
    data <- data[data$State == state,]
    if(outcome == "heart attack"){
      data <- data[,c(2,11)]
      naremove <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
      hospname <- data$Hospital.Name[data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==max(naremove)]
    }
    else if(outcome == "heart failure"){
      data <- data[,c(2,17)]
      naremove <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
      naremove <- as.numeric(naremove)
      naremove <- naremove[!is.na(naremove)] 
      hospname <- suppressWarnings(data$Hospital.Name[data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==max(naremove)])
    }
    else if(outcome == "pneumonia"){
      data <- data[,c(2,23)]
      naremove <- data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
      naremove <- as.numeric(naremove)
      naremove <- naremove[!is.na(naremove)] 
      hospname <- suppressWarnings(data$Hospital.Name[data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==max(naremove)])
    }
  }
  hospname
}