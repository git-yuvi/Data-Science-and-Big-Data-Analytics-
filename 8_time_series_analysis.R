install.packages('forecast')
library(forecast)
weather_prod_input <- as.data.frame( read.csv("weather.csv") )
weather_prod <- ts(weather_prod_input[,3])
plot(weather_prod, xlab = "Time (months)",
     ylab = "weather between(1901-2017)")
plot(diff(weather_prod))
abline(a=0, b=0)
acf(diff(weather_prod), xaxp = c(0, 48, 4), lag.max=48, main="")
pacf(diff(weather_prod), xaxp = c(0, 48, 4), lag.max=48, main="")
arima_1 <- arima (weather_prod,
                  order=c(0,1,0),
                  seasonal = list(order=c(1,0,0),period=12))
arima_1
acf(arima_1$residuals, xaxp = c(0, 48, 4), lag.max=48, main="")
pacf(arima_1$residuals, xaxp = c(0, 48, 4), lag.max=48, main="")
arima_2 <- arima (weather_prod,
                  order=c(0,1,1),
                  seasonal = list(order=c(1,0,0),period=12))
arima_2
acf(arima_2$residuals, xaxp = c(0, 48, 4), lag.max=48, main="")
pacf(arima_2$residuals, xaxp = c(0, 48,4), lag.max=48, main="")
#Normality and Constant Variance
plot(arima_2$residuals, ylab = "Residuals")
abline(a=0, b=0)
hist(arima_2$residuals, xlab="Residuals", xlim=c(-20,20))
qqnorm(arima_2$residuals, main="")
qqline(arima_2$residuals)
#Forecasting
#predict the next 12 months
?predict()
arima_2.predict <- predict(arima_2,n.ahead=12)
?matrix()
matrix(c(arima_2.predict$pred-1.96*arima_2.predict$se,
         arima_2.predict$pred,
         arima_2.predict$pred+1.96*arima_2.predict$se), 12,1,
       dimnames=list( c(117:128) ,c("Pred")) )
plot(weather_prod)
lines(arima_2.predict$pred)
lines(arima_2.predict$pred+1.96*arima_2.predict$se, col=4, lty=2)
lines(arima_2.predict$pred-1.96*arima_2.predict$se, col=4, lty=2)
?arima()
