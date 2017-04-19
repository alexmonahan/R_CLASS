data("diamonds")
library(ggplot2) 

str(diamonds)
hist(diamonds$price, breaks = 50)
ggplot(diamonds, aes(x = price)) + geom_histogram()
set.seed(12345) # Make the sample reproducible 
dsmall <- diamonds[sample(nrow(diamonds), 200), ]

colorMap <- data.frame(color = rainbow(length(unique(dsmall$color)))) 
rownames(colorMap) <- unique(dsmall$color)
plot(price ~ carat, data = dsmall, col = colorMap[dsmall$color, "color"]) 
legend(x = 'bottomright', legend = rownames(colorMap), col = colorMap$color, pch = par("pch"), bty = 'n', xjust = 1)

#Now plot with ggplot2
ggplot(data = dsmall, aes(x = carat, y = price, color = color)) + geom_point()