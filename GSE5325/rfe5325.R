data<-read.csv("F:/Thesis/New/Data/GSE5325/GSE5325_PCAData.csv",row.names = 1)
#data2<-read.csv("F:/Thesis/New/Data/GSE6919_GPL92/GSE6919_GPL92_SelectedFeatures.csv",row.names = 1)
#data2<-t(data2)
#library(mlbench)
library(caret)


# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)
# run the RFE algorithm
system.time(results <- rfe(data[,1:105], as.factor(data[,106]), sizes=c(1:6), rfeControl=control))
# summarize the results
print(results)
# list the chosen features
rfeRanked = predictors(results)
# plot the results
#plot(results, type=c("g", "o"))
