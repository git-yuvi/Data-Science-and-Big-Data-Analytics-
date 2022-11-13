install.packages("sqldf")
install.packages("readr")
library(sqldf)
library(readr)
Book1<-read_csv("Book1.csv")
Book2<-read_csv("Book2.csv")
Book3<-read_csv("Book3.csv")
View(Book1)
View(Book2)
View(Book3)
#Set_Operations
sqldf("SELECT * FROM Book1 UNION SELECT * FROM Book2")
sqldf("SELECT * FROM Book1 UNION ALL SELECT * FROM Book2")
sqldf("SELECT * FROM Book1 INTERSECT SELECT * FROM Book2")
sqldf("SELECT * FROM Book1 EXCEPT SELECT * FROM Book2")
#Join_Operations
sqldf("SELECT Book1.Name,Book3.College FROM Book1 INNER JOIN Book3 ON Book1.Id=Book3.Id")
sqldf("SELECT Book1.Name,Book3.College FROM Book1 FULL OUTER JOIN Book3 ON Book1.Id=Book3.Id")
sqldf("SELECT Book1.Name,Book3.College FROM Book1 LEFT OUTER JOIN Book3 ON Book1.Id=Book3.Id")
sqldf("SELECT Book1.Name,Book3.College FROM Book1 RIGHT OUTER JOIN Book3 ON Book1.Id=Book3.Id")

#Grouping_Extensions
Book4<- read_csv("Book4.csv")
View(Book4)

sqldf("SELECT Department,SUM(Salary) as Salary FROM Book4 GROUP BY Department")
sqldf("SELECT Department,Category,SUM(Salary) as Salary FROM Book4 GROUP BY Department, Category")
sqldf("SELECT Department,SUM(Salary) as Salary FROM Book4 GROUP BY Department HAVING SUM(Salary) = 95000")
sqldf("SELECT Department,Category,SUM(Salary) as Salary FROM Book4 GROUP BY Department, Category HAVING SUM(salary) = 25000")
