complete<- function(directory="specdata", id=1:332){
  dir_path = paste("C:/Users/TEST PC/Desktop/exposys/rprog_data_specdata/", directory, "/", sep = "")
  print(dir_path)
  file_list = list.files(dir_path)
  nobs <- vector()
  #print(file_list[1])
  for(i in id){
    file = paste(dir_path,file_list[[i]], sep = "")
    #print(file)
    data <- read.csv(file)
    data<- na.omit(data)
    nobs <- append(nobs, nrow(data))
    
  }
  op <- data.frame(id, nobs)
  #print(op)
}
#complete(id=1:5)
