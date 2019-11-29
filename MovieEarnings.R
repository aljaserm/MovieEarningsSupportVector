movie <- read.csv("C:/Users/aljas/OneDrive/Documents/Development/R/MovieEarningsSupportVector/MovieEarningsSupportVector/Movie_regression.csv", header = TRUE)


## Data Preprocessing
summary(movie)
df$Time_taken[is.na(movie$Time_taken)] <- mean(movie$Time_taken,na.rm = TRUE)

## Test-Train Split

# install.packages('caTools')
library(caTools)
set.seed(0)
split =sample.split(movie,SplitRatio = 0.8)
train = subset(movie,split == TRUE)
test = subset(movie,split == FALSE)

## Importing relevant Library e1071

# install.packages('e1071')
library (e1071)

svmfit = svm(Collection~., data=train , kernel = "linear", cost =0.01, scale = TRUE )
summary (svmfit)

## Predicting on test set
ypred = predict (svmfit ,test)

mse <- mean((ypred-test$Collection)^2)