head(mtcars)
mtscaled <- as.matrix(scale(mtcars)) head(mtscaled)

#Heatmap
heatmap(mtscaled, Rowv = NA, Colv = NA)

#heatmaps with dendograms and reordered (by means) rows and columns
heatmap(as.matrix(mtscaled))

#Compute dendograms
# Cluster rows (by default healmaps uses method = "euclidean")
data.dist.r <- dist(mtcars, method = "manhattan") 
row.clus <- hclust(data.dist.r, "aver")
# Cluster columns
data.dist.c <- dist(t(mtcars), method = "manhattan") 
col.clus <- hclust(data.dist.c, "aver")

# Plot dendograms:
layout(matrix(c(1,2),nrow=1), widths=c(3,2)); par(mar = c(1,4,2,1)) 
plot(row.clus, xlab = "", main = "Row Dendogram", sub = "") 
plot(col.clus, xlab = "", main = "Column Dendogram", sub = "")

library(RColorBrewer)
# Define color scheme
scaleredblues <- colorRampPalette(colors = brewer.pal(9, "RdBu"))(100) 
heatmap(as.matrix(mtscaled), col = scaleredblues, Rowv = as.dendrogram(row.clus), Colv = as.dendrogram(col.clus))

