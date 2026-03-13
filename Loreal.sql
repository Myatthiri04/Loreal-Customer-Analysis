USE Loreal;
SHOW TABLES;
SELECT * FROM `loreal_reviews_cleaned.2` LIMIT 10;
#selecting brand name
SELECT DISTINCT brand_name FROM `loreal_reviews_cleaned.2`;
#checking how many reviews are there for loreal
select count(*) as total_reviews from `loreal_reviews_cleaned.2`;
#average rating
select round(avg(review_rating),2) as avg_rating from `loreal_reviews_cleaned.2`;
#review rating
select review_rating,count(*) as count 
from `loreal_reviews_cleaned.2` group by review_rating order by review_rating desc;
#top 10 rated products
select product_title, round(avg(review_rating),2) as avg_rating,
count(review_id) as total_reviews from `loreal_reviews_cleaned.2`
group by product_title order by avg_rating desc;
#top 10 most reviewed products (only got 8)
select product_title, count(review_id) as total_reviews, 
round(avg(review_rating),2) as avg_rating from `loreal_reviews_cleaned.2`
group by product_title order by total_reviews desc;

#popular products with lower satisfication 
select product_title,
count(review_id) as total_reviews, 
round(avg(review_rating),2) as avg_rating
from `loreal_reviews_cleaned.2`
group by product_title
having count(review_id)>50
order by avg_rating asc;

#price tier analysis
select case when price<300 then 'Low' 
when price between 300 and 700 then 'mid'
else 'Premium' end as price_category, 
count(*)as review_count,
round(avg(review_rating),2) as avg_rating
from `loreal_reviews_cleaned.2` 
group by price_category
order by avg_rating desc;

#category analysis
select product_tags, count(*) as total_reviews, 
round(avg(review_rating),2) as avg_rating 
from `loreal_reviews_cleaned.2` group by product_tags 
order by avg_rating desc;

#review over time
SELECT review_year, COUNT(*) AS total_reviews,
ROUND(AVG(review_rating),2) AS avg_rating
FROM `loreal_reviews_cleaned.2` group by review_year
ORDER BY review_year;

#verified buyer & pro user analysis 
#verified 
select is_a_buyer, count(*) as review_count,
round(avg(review_rating),2) as avg_rating 
from `loreal_reviews_cleaned.2`
group by is_a_buyer;

#pro users
select pro_user, count(*) as review_count, 
round(avg(review_rating),2) as avg_rating 
from`loreal_reviews_cleaned.2`
group by pro_user;

#buyer sentiment behaviour 
select is_a_buyer, 
sentiment,
count(*) as review_count, 
round(avg(review_rating),2) as avg_rating
from `loreal_sentiment - loreal_sentiment-2`
group by is_a_buyer,sentiment
order by is_a_buyer;

#low-rated/potentially negative products
SELECT 
    product_title, 
    COUNT(review_id) AS total_reviews, 
    ROUND(AVG(review_rating),2) AS avg_rating
FROM `loreal_reviews_cleaned.2`
GROUP BY product_title
HAVING ROUND(AVG(review_rating),2) < 4       
   AND COUNT(review_id) > 5                
ORDER BY avg_rating ASC;

#individual reviews with 1 or 2 stars 
select product_title, review_rating, review_text, author, review_date
from  `loreal_reviews_cleaned.2`
where review_rating<=2
order by review_date desc
limit 20;

#aggregate product level metrics for predictive modelling 
select product_id, product_title,
avg(review_rating) as avg_rating, 
count(review_id) as total_reviews, 
avg(price) as avg_price,
avg(product_rating) as product_rating_avg,
sum(product_rating_count) as total_product_ratings
from `loreal_reviews_cleaned.2`
group by product_id,product_title;

#additional dashobard metrics 
#top products per year 
select review_year,product_title, 
count(review_id) as total_reviews, 
round(avg(review_rating),2) as avg_rating
from `loreal_reviews_cleaned.2`
group by review_year,product_title
order by review_year,avg_rating desc
limit 20;

#price tier vs year 
select review_year, 
case when price<300 then 'Low'
when price between 300 and 700 then 'Mid'
else 'Premium'
end as price_category,
count(*) as review_count, round(avg(review_rating),2) as avg_rating 
from`loreal_reviews_cleaned.2`
group by review_year, price_category
order by review_year, price_category;

#count reviews by sentiment 
select sentiment, count(*) as review_count
from`loreal_sentiment - loreal_sentiment-2` 
group by sentiment
order by review_count desc;

#average review rating per sentiment 
select sentiment,round(avg(review_rating),2) as avg_rating
from `loreal_sentiment - loreal_sentiment-2`
group by sentiment
order by avg_rating desc; 

#sentiment trend over years
select review_year, sentiment,count(*) as review_count
from `loreal_sentiment - loreal_sentiment-2`
group by review_year,sentiment
order by review_year,sentiment;

#precentage of sentiment per year
SELECT 
    sentiment_per_year.review_year,
    sentiment_per_year.sentiment,
    sentiment_per_year.review_count,
    ROUND((sentiment_per_year.review_count / total_per_year.total_reviews) * 100, 2) AS percent_of_year
FROM
    (SELECT review_year, sentiment, COUNT(*) AS review_count
     FROM `loreal_sentiment - loreal_sentiment-2`
     GROUP BY review_year, sentiment) AS sentiment_per_year
JOIN
    (SELECT review_year, COUNT(*) AS total_reviews
     FROM `loreal_sentiment - loreal_sentiment-2`
     GROUP BY review_year) AS total_per_year
ON sentiment_per_year.review_year = total_per_year.review_year
ORDER BY sentiment_per_year.review_year, sentiment_per_year.sentiment;






