best <- function(state, outcome) {
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv",colClasses="character")  
    
    ## Check that state and outcome are valid     
    if(!(state %in% data$State)) {
        stop("invalid state")
    }
    
    if(is.na(match(outcome,c("heart attack","heart failure","pneumonia")))) {
        stop("invalid outcome")
    }    
    
    ## Return hospital name in that state with lowest 30-day death rate
    data[,11] <- suppressWarnings(as.numeric(data[,11]))
    data[,17] <- suppressWarnings(as.numeric(data[,17]))
    data[,23] <- suppressWarnings(as.numeric(data[,23]))
    df <- data[, c(2,7,11,17,23)]
    colnames(df) <- c("hospital name","state","heart attack","heart failure","pneumonia")
    df_state <- subset(df,df$state==state)
    df[which.min(df[,outcome]),1]   

}


    


    

