pollutantmean<-function(directory,pollutant,id=001:332){
  allFilenames <- list.files(directory)
  fileNumbers <- as.numeric(sub('\\.csv$','', allFilenames))
  selectedFiles <- na.omit(allFilenames[match(id, fileNumbers)])
  
  print(selectedFiles)
  
  readData <- lapply(file.path(directory,selectedFiles), read.csv)
 
  
  totalData<-do.call("rbind",readData)
  
  sulfateData<-totalData [pollutant]
  
  #print(sulfateData[1])
  
  mean(sulfateData[[1]],na.rm = TRUE)
  
  
 }