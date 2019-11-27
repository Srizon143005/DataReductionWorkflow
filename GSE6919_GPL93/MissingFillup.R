data <- read.csv("F:/Thesis/New/Data/GSE6919_GPL93/GSE6919_GPL93_Classified.csv", row.names=1)
for(i in 1:nrow(data))
{
  print(i)
  x=as.numeric(data[i:i,1:ncol(data)])
  median.result <- median(x, na.rm = TRUE)
  #print(median.result)
  for(j in 1:ncol(data)){
    if(is.na(data[i:i,j:j])==TRUE){
      print("Yes")
      #data[i:i,j:j]=median.result
    }
  }
}

#write.csv(data,file="F:/Thesis/New/Data/GSE6919_GPL93/GSE6919_GPL93_MissingFilledUP.csv")
