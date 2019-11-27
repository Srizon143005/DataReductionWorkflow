pcaCharts <- function(x,y,z,t) {
  x.var <- x$sdev ^ 2
  x.pvar <- x.var/sum(x.var)
  
  y.var <- y$sdev ^ 2
  y.pvar <- y.var/sum(y.var)
  
  z.var <- z$sdev ^ 2
  z.pvar <- z.var/sum(z.var)
  
  t.var <- t$sdev ^ 2
  t.pvar <- t.var/sum(t.var)
  
  #print("proportions of variance:")
  #print(x.pvar)
  
  par(mfrow=c(1,1))
  plot(cumsum(x.pvar),xlab="Principal Component", ylab="Accumulative Variance", ylim=c(0,1), type='l', col="blue")
  #plot(cumsum(y.pvar),xlab="Principal Component", ylab="Accumulative Variance", ylim=c(0,1), type='l', col="red")
  #plot(cumsum(z.pvar),xlab="Principal Component", ylab="Accumulative Variance", ylim=c(0,1), type='l', col="green")
  #plot(cumsum(t.pvar),xlab="Principal Component", ylab="Accumulative Variance", ylim=c(0,1), type='l', col="black")
}

data1<-read.csv("E:/New Conference Paper/New/Data/GSE6919_GPL8300/GSE6919_GPL8300_SelectedFeatures.csv",row.names = 1)
data1<-t(data1)
data2<-read.csv("E:/New Conference Paper/New/Data/GSE6919_GPL92/GSE6919_GPL92_SelectedFeatures.csv",row.names = 1)
data2<-t(data2)
data3<-read.csv("E:/New Conference Paper/New/Data/GSE6919_GPL93/GSE6919_GPL93_SelectedFeatures.csv",row.names = 1)
data3<-t(data3)
data4<-read.csv("E:/New Conference Paper/New/Data/GSE5325/GSE5325_SelectedFeatures.csv",row.names = 1)
data4<-t(data4)

pca1 <- prcomp(scale(data1),center = TRUE)
pca2 <- prcomp(scale(data2),center = TRUE)
pca3 <- prcomp(scale(data3),center = TRUE)
pca4 <- prcomp(scale(data4),center = TRUE)

pcaCharts(pca1, pca2, pca3, pca4)
