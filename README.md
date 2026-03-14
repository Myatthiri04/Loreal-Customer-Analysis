Project Title
Customer Review & Sentiment Analysis for L'Oréal Products
Project Overview
This project analyses customer reviews for L'Oréal Paris products to understand customer sentiment, product performance, and behavioural patterns in online beauty retail.
The analysis aims to identify:
Top-performing products
Customer satisfaction drivers
Negative product feedback patterns
Consumer sentiment trends
Pricing impact on satisfaction
Although the dataset originates from the Indian e-commerce cosmetics market, consumer behaviour observed in online product reviews often translates across global markets.
These insights can therefore help inform beauty retail strategies in Australia, where online reviews and influencer-driven purchasing behaviour are also key drivers of customer decisions.
Data Preparation
The dataset initially contained:
Emoji characters in the review_text column
Text encoding inconsistencies
Duplicate entries
Data cleaning was performed using R, where:
Emojis were removed
Text fields were standardised
Missing values were handled
The cleaned dataset was then imported into MySQL for structured analysis.
Dataset summary:
Metric	Value
Total Reviews	525
Products	8
Years Covered	2014–2022
Average Rating	4.04
Analytical Methodology
The analysis was performed using SQL queries in MySQL, covering the following areas:
Product Performance
Top rated products
Most reviewed products
Product satisfaction comparison
Customer Behaviour
Verified vs non-verified buyers
Sentiment behaviour patterns
Pricing Strategy
Price tier analysis
Rating performance by price category
Time Trends
Review growth over time
Sentiment evolution across years
Sentiment Analysis
Customer reviews were classified into:
Positive
Neutral
Negative
Key Insights
Overall Customer Satisfaction
Average rating across all products:
4.04 / 5
Customer sentiment distribution:
Sentiment	Reviews
Positive	3453
Neutral	312
Negative	486
Positive sentiment consistently exceeds 80%, indicating strong brand perception.
Top Performing Products
Product	Avg Rating	Reviews
Superliner Black Lacquer	4.85	33
Karl Lagerfeld Lipstick	4.20	30
Volume Million Lashes Mascara	4.15	121
Les Macarons Liquid Lipstick	4.11	192
These products demonstrate strong customer satisfaction and high engagement.
Product Issues Identified
The following product received large review volumes but lower satisfaction scores:
Product	Reviews	Avg Rating
Matte Signature Eyeliner	130	3.59
Common issues identified in low-rating reviews:
Applicator design difficulty
Product drying too quickly
Low perceived product quantity
Pricing Insights
Price Tier	Reviews	Avg Rating
Premium	383	4.19
Mid	142	3.63
Premium products tend to receive higher ratings, suggesting stronger perceived value.
Relevance to the Australian Beauty Market
Although the dataset originates from India, the following behaviours are also widely observed in Australia:
Consumers heavily rely on online product reviews
Verified buyer feedback drives purchasing confidence
Premium beauty products are associated with higher quality perception
Negative feedback often focuses on product usability rather than price
These insights can therefore support data-driven product and marketing strategies for the Australian cosmetics market.
