#Problem 3
microarray <- read.table("D:/class/data_mining/hw1/microarray.txt",header = TRUE)
attach(microarray)
dim(microarray)
head(microarray)

sub1 <- microarray[,c('COLON','COLON.1','COLON.2','COLON.3','COLON.4','COLON.5','COLON.6','OVARIAN','OVARIAN.1', 'OVARIAN.2', 'OVARIAN.3', 'OVARIAN.4', 'OVARIAN.5')]
dim(sub1)

sub <- microarray[,c(42:48,22,25:29)]
dim(sub)
head(sub)

boxplot(sub, main = "boxplot for each column", col = 1:13)

m <- data.matrix(sub)
dim(m)
head(m)
image(m)
heatmap(m)

install.packages("gplots")
library(gplots)
heatmap.2(m, col=greenred)


