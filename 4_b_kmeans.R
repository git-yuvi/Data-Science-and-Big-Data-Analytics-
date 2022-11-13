install.packages("Stats")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")
library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)
View(iris)
mydata = select(iris,c(1,2,3,4))
wssplot<- function(data, nc=15, seed=1234)
{
 wss <-(nrow(data-1))*sum(apply(data,2,var))
 for(i in 2:nc){
 set.seed(seed)
 wss[i] <- sum(kmeans(data,centers=i)$withinnss)}
 plot(1:nc,wss,type="b", xlab="number of clusters",
 ylab="within groups sum of squares")
}
wssplot(mydata)
KM = kmeans(mydata,2)
autoplot(KM,mydata,frame=TRUE)
