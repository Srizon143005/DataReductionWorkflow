
# data <- read.csv("E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/GSE6919_GPL92_Classified.csv")
# data<-t(t(data))
# write.csv(data,file="E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/GSE6919_GPL92_forSelection.csv")

Original<-read.csv("E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/GSE6919_GPL92_forSelection.csv", row.names=1)
selected<-read.csv("E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/GSE6919_GPL92_T_bonferroni_05_result.csv", row.names=1)

result<-read.csv("E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/SelectedFeature.csv", row.names=1)

for (i in 1:nrow(selected)){
  gene=selected[i,1]
  for(j in 1:nrow(Original)){
    if(gene==Original[j,1]){
      #print(Original[j,])
      #print(i)
      result<-rbind(result,Original[j,])
      break
    }
  }
}
write.csv(result,"E:/Study/Thesis/New Thesis/Utsha/GSE6919_GPL92/GSE6919_GPL92_SelectedFeatures.csv")

