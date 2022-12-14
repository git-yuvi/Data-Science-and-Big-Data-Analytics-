install.packages("tm")
install.packages("wordcloud")
install.packages("syuzhet")
library(tm)
library(wordcloud)
library(syuzhet)
reviews<-read.csv(file.choose(),header=1)
str(reviews)
corpus<-iconv(reviews$text)
corpus<-Corpus(VectorSource(corpus))
inspect(corpus[1:10])
corpus <- tm_map(corpus,tolower)
corpus <- tm_map(corpus,removePunctuation)
corpus <- tm_map(corpus,removeNumbers)
corpus <- tm_map(corpus,removeWords,stopwords("english"))
#corpus <- tm_map(corpus,removeWords,c("book","read","life"))
corpus <- tm_map(corpus,stripWhitespace)
inspect(corpus[1:10])
reviews_final <- corpus
tdm <- TermDocumentMatrix(reviews_final)
tdm <- as.matrix(tdm)
tdm[1:10,1:10]
w <- sort(rowSums(tdm),decreasing = T)
set.seed(2000)
wordcloud(words = names(w),
 freq = w,
 max.words=50,
 random.order = T,
min.freq=5,
 colors=brewer.pal(25,"Dark2"),
 scale = c(5,0.5))
sentiment_data <- iconv(reviews$text)
s <- get_nrc_sentiment(sentiment_data)
s[1:10,]
s$score <- s$positive - s$negative
s[1:10,]
write.csv(x=s,file="reviews.csv")
review_score <- colSums(s[,])
print(review_score)
barplot(colSums(s),
 las =2,
 col=rainbow(10),
 ylab='Count',
 main='Sentiment')
