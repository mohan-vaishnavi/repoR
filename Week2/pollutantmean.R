pollutantmean<- function(directory="specdata", pollutant, id=1:332){
  dir_path = paste("C:/Users/TEST PC/Desktop/exposys/rprog_data_specdata/", directory, "/", sep = "")
  print(dir_path)
  file_list = list.files(dir_path)
  c <- vector()
  #print(file_list[1])
  for(i in id){
    
    file = paste(dir_path,file_list[[i]], sep = "")
    #print(file)
    data <- read.csv(file)
    req_data <- na.omit(data[pollutant])
    for (i in req_data){
      c <- append(c, i)
      
    }
  }
  mean(c)
}

#dir_path = "C:/Users/TEST PC/Desktop/exposys/rprog_data_specdata/specdata/"
#for(i in list.files(dir_path)){print(paste(dir_path,i, sep = ""))}

#pollutantmean(poll="sulfate",id=1:10)
