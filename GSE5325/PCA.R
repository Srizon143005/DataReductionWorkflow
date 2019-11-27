data<-read.csv("F:/Thesis/New/Data/GSE5325/GSE5325_SelectedFeatures.csv",row.names = 1)
data<-t(data)
pca <- prcomp(scale(data),center = TRUE)
summary(pca)
print(summary(pca))

#write.csv(summary(pca),file="F:/Thesis/New/Data/GSE6919_GPL8300/GSE6919_GPL8300_PCASummary.csv")
write.csv(pca$x,file="F:/Thesis/New/Data/GSE5325/GSE5325_PCAData.csv")