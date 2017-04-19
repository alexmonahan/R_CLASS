data("mtcars")
head(mtcars)

# convert am (0 = automatic, 1 = manual) column to a factor
mtcars$am <- factor(mtcars$am, levels = c(0, 1), head(mtcars), labels = c("automatic", "manual"))

library(ggplot2)
ggplot(mtcars, aes(x = am, y = mpg)) + geom_boxplot() + xlab("Trasmission") + ylab("Fuel efficiency") + geom_jitter(width = 0.4)

(tt <- t.test(formula = mpg ~ am, data = mtcars)) #Results are below

#Welch Two Sample t-test 
#data:  mpg by am
#t = -3.7671, df = 18.332, p-value = 0.001374
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -11.280194  -3.209684
#sample estimates:
#  mean in group 0 mean in group 1 
#17.14737        24.39231 

names(tt)
tt$p.value
tt$conf.int