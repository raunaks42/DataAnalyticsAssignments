data <- read.csv ("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")
colnames(data) <- c("sepal_length", "sepal_width", "petal_length","petal_width", "species")
data$species = factor(data$species,levels = c('Iris-setosa', 'Iris-versicolor', 'Iris-virginica'),labels = c(1, 2, 3))
summary(data)
plot(data)
library(caTools)
set.seed(123)
split = sample.split(data$species, SplitRatio = 0.7)
data_train = subset(data, split == TRUE)
data_test = subset(data, split == FALSE)

model <- lm(species ~ petal_width,data=data_train)
model
plot(data_train$petal_width,data_train$species, xlab = "petal_width", ylab = "species",main = "Simple Regression")
abline(model)
speciespred<-predict(model, newdata=data_test)
table(actual=data_test$species,predicted=round(speciespred))

model <- lm(species ~ petal_width+sepal_width,data=data_train)
model
speciespred<-predict(model, newdata=data_test)
table(actual=data_test$species,predicted=round(speciespred))