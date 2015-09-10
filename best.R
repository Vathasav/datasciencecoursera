best <- function(state, outcome) {
  
  ## Read the outcome data
  dat <- na.omit(read.csv("outcome-of-care-measures.csv", colClasses = "character"))
  ## Check that state and outcome are valid
  if (!state %in% unique(dat[, 7])) {
    stop("invalid state")
  }
  switch(outcome, `heart attack` = {
    col = 11
  }, `heart failure` = {
    col = 17
  }, pneumonia = {
    col = 23
  }, stop("invalid outcome"))
  ## Return hospital name in that state with lowest 30-day death rate
  df = dat[dat$State == state, c(2, col)]
  df = na.omit(df)
  df[which.min(na.omit(df[, 2])), 1]
}