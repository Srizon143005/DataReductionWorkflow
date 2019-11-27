
# data <- read.csv("F:/Thesis/New/Data/GSE5325/GSE5325_Classified.csv")
# data<-t(t(data))
# write.csv(data,file="F:/Thesis/New/Data/GSE5325/GSE5325_forSelection.csv")

Original<-read.csv("F:/Thesis/New/Data/GSE5325/GSE5325_forSelection.csv", row.names=1)
selected<-read.csv("F:/Thesis/New/Data/GSE5325/GSE5325_T_bonferroni_05_result.csv", row.names=1)

result<-read.csv("F:/Thesis/New/Data/GSE5325/SelectedFeature.csv", row.names=1)

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
write.csv(result,"F:/Thesis/New/Data/GSE5325/GSE5325_SelectedFeatures.csv")

