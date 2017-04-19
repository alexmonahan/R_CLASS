#Lasso regression is implemented in an R package glmnet.
#When to use lasso regression: the number of available covariates is extremely large, but only a handful of them are relevant for the prediction of the outcome.
library(glmnet)
data("mtcars")
head(mtcars)
y <- mtcars[, 1] # mileage per gallon
x <- mtcars[, -1] # all other variables treated as predictors 
x <- data.matrix(x, "matrix") # converts to NUMERIC matrix
set.seed(123)
trainIdx <- sample(1:nrow(mtcars), round(0.7 * nrow(mtcars))) 
fit <- glmnet(x[trainIdx, ], y[trainIdx])
names(fit)
print(fit)
plot(fit, label = TRUE)
# Lambda = 1
coef(fit, s = 1)
# Predict for the test set:
predict(fit, newx = x[-trainIdx, ], s = c(0.5, 1.5, 2)) #Each of the columns corresponds to a choice of λ.


#To choose λ can use cross-validation.
set.seed(1)
# `nfolds` argument sets the number of folds (k).
cvfit <- cv.glmnet(x[trainIdx, ], y[trainIdx], nfolds = 5)
plot(cvfit)

#The red dots are the average MSE over the k-folds.
cvfit$lambda.min #λ with minimum MSE

cvfit$lambda.1se #The biggest λ such that the MSE is within one standard error of the minimum MSE