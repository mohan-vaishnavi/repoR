
stop<-function(code)
{
  if(code==1){
    print("invalid state")
  }
  else if(code==0){
    print("invalid outcome")
  }
}
best <- function(state, outcome)
{
  num<-vector()
  outcome <- tolower(outcome)
  ##checking for validity
  if(is.na(match(state,state_list)))
  {
    stop(1)
    
  }
  else if(is.na(match(outcome,oc_list)))
  {
    stop(0)
    
  }
  ##returning the best hospital name
  else{
    
    ##reading data
    hdata<-read.csv("outcome-of-care-measures.csv")
    
    ##creating a vector each of state and outconme names
    state_list <- unique(hdata$State)
    oc_list<-c('heart attack', 'heart failure', 'pneumonia')
  
    if(outcome == "heart attack"){
      e <- 11
    } else if(outcome == "heart failure"){
      e <- 17
    } else {
      e <- 23
    }
    req<- hdata[hdata$State==state, c(2,e)]
    
    for(i in 2:nrow(req)){
      if(req[i,2]!="Not Available")
      { num<- append(num, as.numeric(req[i,2]))
      }
      
    }
    ##find the minimum 30 day mortality rate 
    m <- min(num)
    ## extract names of hospitals that have min mortality rate 
    
    for(i in 2:nrow(req)){
      if(req[i,2]!="Not Available" && as.numeric(req[i,2])==m){
        print(req[i,1])
      }
      
    }
    
  }
  
}
