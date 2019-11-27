data <- read.csv("F:/Thesis/New/Data/GSE5325/GSE5325.csv", row.names=1)
for(i in 1:nrow(data))
{
  #print(i)
  x=as.numeric(data[i:i,1:ncol(data)])
  median.result <- median(x, na.rm = TRUE)
  #print(median.result)
  for(j in 1:ncol(data)){
    if(is.na(data[i:i,j:j])==TRUE){
      data[i:i,j:j]=median.result
    }
  }
}

write.csv(data,file="F:/Thesis/New/Data/GSE5325/GSE5325_MissingFilledUP.csv")
