.packages <- c("plot3D", "plotly", "heatmaply", "ggmap") 
lapply(.packages, install.packages, dependencies = TRUE)
dim(volcano)
Volcano <- volcano[seq(1, nrow(volcano), by = 3), seq(1, ncol(volcano), by = 3)]
library(plot3D)
par(mfrow = c(2, 2), mar = c(3, 3, 3, 3)) # mar = c(bottom, left, top, right)
contour2D(Volcano, lwd = 2) 
image2D(Volcano, clab = "height [m]") 
image2D(Volcano, facets = FALSE) 
image2D(Volcano, contour = TRUE)

par(mfrow = c(2, 3), mar = c(2, 2, 2, 3.5)) 
persp3D(z = Volcano, clab = "[m]")
persp3D(z = Volcano, clab = "[m]", shade = 0.2) 
persp3D(z = Volcano, facets = FALSE)
persp3D(z = Volcano, facets = FALSE, col = "black", curtain = TRUE) 
persp3D(z = Volcano, col = "white", shade = 0.5)
persp3D(z = Volcano, col = ramp.col(c("white", "black")), border = "black")

par(mfrow = c(2, 2), mar = c(1, 1, 1, 1))
persp3D(z = Volcano, facets = FALSE, col = "black", theta = 0, phi = 0) 
persp3D(z = Volcano, facets = FALSE, col = "black", theta = 40, phi = 0) 
persp3D(z = Volcano, facets = FALSE, col = "black", theta = 0, phi = 40) 
persp3D(z = Volcano, facets = FALSE, col = "black")



library(plot3D)
par(mfrow = c(2, 2), mar = c(3, 3, 3, 3)) # mar = c(bottom, left, top, right)
contour2D(Volcano, lwd = 2) 
image2D(Volcano, clab = "height [m]") 
image2D(Volcano, facets = FALSE) 
image2D(Volcano, contour = TRUE)

#3d contour plots
par(mfrow = c(1, 3), mar = c(1, 1, 2, 3))
contour3D(z = 100, colvar = Volcano, clab = c("[m]")) 
contour3D(z = Volcano, colvar = Volcano, lwd = 2, nlevels = 20, clab = "[m]")
contour3D(y = Volcano, colvar = Volcano, lwd = 2, nlevels = 10, clab = "[m]")

par(mfrow = c(1, 2), mar = c(1, 1, 2, 3))
# Generating perspective and contour plots together
persp3D(z = volcano, col = "white", shade = 0.1, plot = FALSE) 
contour3D(z = volcano, colvar = volcano, lwd = 2,add = TRUE, col = "black")
persp3D(z = Volcano, zlim = c(90, 300), col = "white",shade = 0.1, d = 2, plot = FALSE)
contour3D(z = Volcano, colvar = Volcano, lwd = 2, add = TRUE, nlevels = 20, clab = "[m]", plot = FALSE, colkey = list(at = seq(90, 190, length.out = 5))) 
contour3D(z = 300, colvar = Volcano, lwd = 2, col = "grey", add = TRUE, nlevels = 5)
