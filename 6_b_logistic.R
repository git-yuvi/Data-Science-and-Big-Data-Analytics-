sex<-puffinbill$sex

curlen<-puffinbill$curlen

sexcode<-ifelse(sex == "F",1,0)

plot(curlen, jitter(sexcode, 0.15), pch = 19, xlab = "Bill length (mm)", ylab = "Sex (0 - male, 1 -
female)")

model<- glm(sexcode~curlen, binomial)

summary(model)

xv<- seq(min(curlen),max(curlen),0.01)

yv<- predict(model,list(curlen=xv),type="response")

lines(xv, yv, col = "red")

library(popbio)

logi.hist.plot(curlen,sexcode,boxp = FALSE,type= "count",col="gray",xlabel = "size")
