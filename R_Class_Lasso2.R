# install.packages("MASS")
library(MASS)
str(Boston)
head(Boston)
#Split the data into training
set.seed(123)

trainIdx <- sample(1:nrow(Boston), round(0.7 * nrow(Boston))) #The rows we will use to train the model
boston.test <- Boston[-trainIdx,"medv"] #The actual value for the testing datathat we will attempt to predict

library(glmnet)
x <- data.matrix(Boston[, -ncol(Boston)])
y <- Boston$medv

#Use cross-validation to select the value for 
cvfit <- cv.glmnet(x[trainIdx, ], y[trainIdx])
plot(cvfit)

#Inspect comuted coefficients for lambda.min and lambda.1se.
coef(cvfit, s = "lambda.1se")
coef(cvfit, s = "lambda.min")

#Compute the predictions for the test dataset the two choices of the tuning
#parameter, `lambda.min` and `lambda.1se`.#Evaluate the MSE for each.
preds <- predict(cvfit, newx = x[-trainIdx, ], s = c(cvfit$lambda.min, cvfit$lambda.1se))
(MSE.lambda.min <- mean((preds[, 1] - boston.test)^2))
(MSE.lambda.1se <- mean((preds[, 2] - boston.test)^2))

