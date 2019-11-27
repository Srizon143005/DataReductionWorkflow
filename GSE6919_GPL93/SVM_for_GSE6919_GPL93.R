
dataset=read.csv("F:/Thesis/New/Data/GSE6919_GPL93/GSE6919_GPL93_RFESelectedPCAs.csv")
dataset=dataset[2:7]

library(caTools)
set.seed(126)
split=sample.split(dataset$CLASS,SplitRatio = 0.70)
training=subset(dataset,split==TRUE)
testing=subset(dataset,split==FALSE)

training[-6]=scale(training[-6])
testing[-6]=scale(testing[-6])

library(e1071)

set.seed(126)
# tmodel<-tune(svm,CLASS~.,data=training,
#               ranges = list(epsilon=seq(0,1,0.1),cost=2^(2:10)))
#  classifier<-tmodel$best.model
system.time(svm_tune <- tune(svm, train.x=training[,1:5], train.y=as.factor(training[,6]), 
                             kernel="radial", ranges=list(cost=2^(-8:8), gamma=c(2^(-8:8)))))
wts <- 100 / table(training$CLASS)
classifier=svm(formula=factor(CLASS) ~ .,
               data=training,
               scale=TRUE,
               type='C-classification',
               kernel='radial',
               class.weights = wts,
               cost=svm_tune$best.parameters$cost,
               gamma=svm_tune$best.parameters$gamma)
print(classifier)
y_pred=predict(classifier,newdata=testing[-6])
#y_pred<-round(y_pred)
cm=table(testing[,6],y_pred)
miscl<-1-sum(diag(cm))/sum(cm)
print("Accuracy:")
print((1-miscl)*100)
sen = cm[2,2]/(cm[2,2]+cm[1,2])
spe = cm[1,1]/(cm[1,1]+cm[2,1])
print("Sensitivity:")
print(sen)
print("Specificity:")
print(spe)
