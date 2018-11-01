#Read microarray.txt into R
microarray <- read.table("microarray.txt",header = TRUE)
attach(microarray)
dim(microarray)
head(microarray)

#Pick up only samples with lable COLON or OVARIAN and let them be a new data
sub <- microarray[,c(42:48,22,25:29)]
dim(sub)
head(sub)

# Plot the side-by-side boxplots
boxplot(sub, main = "boxplot for each column", col = 1:13)

#Plot a heatmap for the data
m <- data.matrix(sub)
dim(m)
head(m)
image(m)
heatmap(m)

install.packages("gplots")
library(gplots)
heatmap.2(m, col=greenred)

#Do a PCA analysis based on covariance 
microarray <- t(sub)
microarray.pca <- prcomp(microarray, scale=FALSE)

#Plot the barplot of the eigenvalues.
barplot(microarray.pca$sdev^2)

#Find the three genes that contribute most to the first principal component positively
pca1 <- microarray.pca$rotation[,1]
order(pca1, decreasing = TRUE)[1:3]
#three genes that contribute most to the first principal components negatively.
order(pca1)[1:3]

#Plot the projection of the data set on the first two principal components
plot(microarray.pca$x[, 1:2], type = "n")
points(microarray.pca$x[1:7,1:2],pch="c",col="blue")
points(microarray.pca$x[8:13,1:2],pch="o",col="red")
