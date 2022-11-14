library(readxl)

library(ggplot2)

zxp2 <- read_excel("D:/sudharson/exp2.xlsx")

summary(iris)

view(iris)

View(exp2)

barplot(exp2$shop1,col="blue")

hist(exp2$shop2,col="blue")

barplot(exp2$shop1,col="blue")

plot(exp2$shop1,exp2$shop3,col="blue")

plot(iris$Sepal.Width,col="blue")

plot(density(exp2$shop1),exp2$shop3,col="blue")

data1=data("iris")

pairs(data1)

pairs(exp2)

fruits <- c(1,2,3)

shop1 <-c(12,14,16)

shop2 <- c(22,15,24)

shop3 <- c(12,15,14)

shop4 <-c(66,26,33)

rate <- data.frame(fruits,shop1,shop2,shop3,shop4)

rate

pairs(rate)

exportexcl<- write.csv(rate,"D:\\sudharson\\expl2.csv")

importexcl<-read.csv("D:/sudharson/expl2.csv")

importexcl

pairs(importexcl)

dotplot<-ggplot(rate)

dotplot

numbers<-c(1,68,58,97,90,54,94,87,25,64,76)

dotchart(numbers)
