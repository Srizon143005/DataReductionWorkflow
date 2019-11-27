data <- read.csv("F:/Thesis/New/Data/GSE6919_GPL92/GSE6919-GPL92.csv", row.names=1)
for(i in 1:nrow(data))
{
  print(i)
  x=as.numeric(data[i:i,1:ncol(data)])
  median.result <- median(x, na.rm = TRUE)
  #print(median.result)
  for(j in 1:ncol(data)){
    if(is.na(data[i:i,j:j])==TRUE){
      print("yes")
      data[i:i,j:j]=median.result
    }
  }
}

write.csv(data,file="F:/Thesis/New/Data/GSE6919_GPL92/GSE6919_GPL92_MissingFilledUP.csv")
