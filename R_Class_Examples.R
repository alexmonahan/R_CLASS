#Using GGPlot to look over economics data

library(ggplot2) 
data("economics") 
str(economics)
ggplot(data = economics, aes(x = date, y = unemploy/pop)) + geom_line()
economics$month <-months(economics$date) 
economics$year <- format(economics$date, format="%Y") 

cat("Data type of economics$month:", class(economics$month), "\n")
economics$month <- factor(economics$month, levels = month.name)

data2009 <- subset(economics, year == 2009)
data2014 <- subset(economics, year == 2014)

plot(unemploy/pop ~ as.numeric(month), data = data2009, ylim = c(0.025, 0.05), type = "l") 
lines(unemploy/pop ~ as.numeric(month), data = data2014, col = "red")
legend("topleft", c("2009", "2014"), title="Year", col=c("black", "red"), lty = c(1,1))


data2009_2014 <- subset(economics, year %in% c(2014, 2009))
# No need to specify a legend, it is produced automatically 
ggplot(data = data2009_2014, aes(x = month, y = unemploy/pop)) + geom_line(aes(group = year, color = year)) + theme(axis.text.x = element_text(angle = 45))