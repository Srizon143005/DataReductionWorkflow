
data <- read.csv("F:/Thesis/New/Data/GSE6919_GPL92/GSE6919_GPL92_Classified.csv", row.names=1)

alpha <- 0.05

cnt <- 0

names <- vector('character')
pvals <- vector('numeric')

for (i in 1:nrow(data)){
  vec1 = as.numeric(data[i:i,1:77])
  vec2 = as.numeric(data[i:i,78:168])
  
  vec1 = log2(vec1)
  vec2 = log2(vec2)
  
   #vec1 = vec1 - mean(vec1)
   #vec2 = vec2 - mean(vec2)
  
  #vec1 = scale(vec1)
  #vec2 = scale(vec2)
  #tt=t.test(vec1, vec2)
  tt = kruskal.test(list(vec1, vec2))
  #tt=wilcox.test(vec1,vec2)
  names <- c(names, row.names(data)[i])
  pvals <- c(pvals, tt$p.value)
}
#padjusted=pvals
#'arg' should be one of "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none"
padjusted = p.adjust(pvals, method = "bonferroni")

res = data.frame("Gene"=names, "p-value"=pvals, "Adjusted p-value"=padjusted)

kept = padjusted < 0.01
res2 = data.frame("Gene"=names[kept], "p-value"=pvals[kept], "Adjusted p-value"=padjusted[kept])

cat(nrow(res2))

write.csv(res, file="F:/Thesis/New/Data/GSE6919_GPL92/GSE6919_GPL92_KW_bonferroni_01_result_all.csv")
write.csv(res2, file="F:/Thesis/New/Data/GSE6919_GPL92/GSE6919_GPL92_KW_bonferroni_01_result.csv")

