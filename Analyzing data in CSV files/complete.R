complete<-function(directory,id=1:332){
 
  # get all files from directory
  # and select the files matching id
  
  allFilenames <- list.files(directory)
  fileNumbers <- as.numeric(sub('\\.csv$','', allFilenames))
  selectedFiles <- na.omit(allFilenames[match(id, fileNumbers)])
  
  
  readData <- lapply(file.path(directory,selectedFiles), read.csv)
  
  omittedData<-lapply(readData, na.omit)
  nobs<-unlist(lapply(omittedData,nrow))
    
  mydata <- data.frame(id,nobs)
  mydata
  
  
}