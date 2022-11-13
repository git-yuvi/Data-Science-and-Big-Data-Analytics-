#export data
install.packages("openxlsx")
library(openxlsx)

s.no <- seq(1,3, by=1)
employee_name <- c("arun", "rajesh", "prem")
id <- c(101,102,103)
age <- c(22,23,44)
year_of_joining<- c(2005,2008,2001)
experience <- c("5 years","7 yearS","12 years")

factory <- data.frame(employee_name,id,age,year_of_joining,experience)
factory

write.xlsx(factory, file="F:/rrr/exportdata.xlsx")

#import data
library(readxl)
exportdata <- read_excel("F:/rrr/e.xlsx")
View(exportdata)
