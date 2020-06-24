corr<-function(directory="specdata", threshold=0){
  dir_path = paste("C:/Users/TEST PC/Desktop/exposys/rprog_data_specdata/", directory, "/", sep = "")
  #print(dir_path)
  file_list = list.files(dir_path)
  nobs <- vector()
  desired <- vector()
  #print(file_list[1])
  for(i in file_list){
    file = paste(dir_path,i, sep = "")
    data <- read.csv(file)
    data<- na.omit(data)
    nobs <- append(nobs, nrow(data))
    if(nrow(data)>threshold){
      desired <- append(desired, cor(data$sulfate, data$nitrate))
    }
  }
  desired
}