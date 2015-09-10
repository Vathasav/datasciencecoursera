corr<-function(directory,threshold=0){
  
  # get all files from directory
  # and select the files matching id
  
 
 allFilenames <- list.files(directory)
 
 correx = c ()
 i<-0
 for (filex in allFilenames) {
   
   
     currentFile <- na.omit(read.csv(file.path(directory,filex)))
     if ( nrow(currentFile) > threshold) {
       corre <- cor(currentFile$nitrate, currentFile$sulfate)
       
       correx <- c(correx, corre);
     }
   }
  
  correx
 
 
 #print(correx)
 
 
    
}