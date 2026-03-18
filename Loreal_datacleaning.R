reviews <- read.csv("/Users/mai/Downloads/MakeupProduct_CustomerReviews.csv", 
                    stringsAsFactors = FALSE)
loreal_reviews <- reviews[grepl("Loreal Paris|L'Oreal Paris", 
                                reviews$brand_name, ignore.case = TRUE), ]
table(loreal_reviews$brand_name)
loreal_reviews<-loreal_reviews[loreal_reviews$review_text
                               != "" & !is.na(loreal_reviews$review_text),]
loreal_reviews<-loreal_reviews[!duplicated(loreal_reviews$review_text),]
loreal_reviews$review_date <- as.POSIXct(loreal_reviews$review_date, 
                                         format="%Y-%m-%d %H:%M:%S")
loreal_reviews$review_year <- as.numeric(format(loreal_reviews$review_date, "%Y"))
head(loreal_reviews[, c("review_date", "review_year")])
write_csv(loreal_reviews, "loreal_reviews_clean.csv")]
getwd()
data <- read.csv("/Users/mai/Downloads/loreal_reviews_cleaned.csv")
head(data)
data$sentiment <- ifelse(data$review_rating >= 4, "Positive",
                         ifelse(data$review_rating == 3, "Neutral", "Negative"))
table(data$sentiment)
#for powerbi or sql
write.csv(data, "loreal_reviews_with_sentiment.csv", row.names = FALSE)

data <- read.csv("/Users/mai/Downloads/loreal_reviews_with_sentiment.csv")
getwd()
write.csv(data, "/Users/mai/Downloads/loreal_reviews_with_sentiment.csv", row.names = FALSE)
file.exists("/Users/mai/Downloads/loreal_reviews_with_sentiment.csv")
