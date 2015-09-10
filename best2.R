best <- function(state, outcome) {
 
    fileData = read.csv("outcome-of-care-measures.csv")
    
   # print(fileData$State)
    if (!state %in% fileData[,7]){
        stop("invalid state")
    }

  switch(outcome, 'heart attack' = {col = 11},
                  'heart failure' = {col = 17},
                  'pneumonia'= {col = 23}, stop("invalid outcome"))
  
  outcomeData = fileData[fileData$State == "state", (c (2,col))]
  
  fileData[which.min(outcomeData[,2]),1]
  
  #print(outcomeData)
  
}