## Ecommerce SQL Analysis By Solomon Ebrahimoff

## Project Overview:
This project analyses the Brazilian E-Commerce Public Dataset by Olist to understand sales performance, customer behaviour, and product demand.
Using SQL, the analysis focuses on identifying revenue drivers, customer retention issues, and category-level performance to support data-driven business decisions.

## Business objective:
Analyse Olist’s e-commerce data to:
	-	Evaluate overall revenue performance
	-	Identify top-performing product categories
	-	Understand customer purchasing behaviour
	-	Analyse revenue trends over time
	-	Assess customer satisfaction through reviews

## Dataset:
Source: Brazilian E-Commerce Public Dataset by Olist (Kaggle) 
## Data Note
The `olist_geolocation_dataset.csv` file is excluded due to GitHub file size limits.
It can be downloaded from the original Kaggle dataset:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## Tables used:
	-	customers
	-	orders
	-	order_items
	-	products
	-	sellers
	-	order_payments
	-	order_reviews
	-	geolocation
	-	product_category_name_translation

 ## Tools Used:
	-	SQL (MySQL / phpMyAdmin)
	-	Localhost database
	-	CSV data import

 ## Key Business Questions:
	1.	What is the total revenue generated?
	2.	How does revenue change over time (monthly trends)?
	3.	Which product categories generate the most revenue?
	4.	How many customers are one-time vs repeat buyers?
	5.	What is the overall customer satisfaction level?

## Key Findings:
Revenue Performance:
	-	Total revenue: £15.84M
	-	Revenue shows strong growth from early 2017, peaking in late 2017–2018.
	-	Sales activity declines sharply toward the end of the dataset period.

Revenue by Product Category:
Top-performing categories:
	-	Health & Beauty: £1.44M
	-	Watches & Gifts: £1.31M
	-	Bed, Bath & Table: £1.24M
	-	Sports & Leisure: £1.16M
	-	Computers & Accessories: £1.06M

Lower-performing categories include:
	-	Electronics
	-	Consoles & Games
	-	Luggage & Accessories

Lifestyle and personal care categories dominate overall revenue.

Customer Behaviour:
	-	One-time customers: 99,441
	-	A large portion of customers make only a single purchase, highlighting low repeat purchase behaviour and a strong opportunity to improve retention.

Customer Satisfaction:
	-	Average review score: 4.09 / 5
	-	Overall customer satisfaction is high, suggesting product and service quality are strong.
	-	Despite positive reviews, customer retention remains a challenge.

Key KPIs:
	-	Total Revenue: £15.84M
	-	Average Review Score: 4.09 / 5
	-	One-Time Customers: 99,441
	-	Top Category Revenue: Health & Beauty (£1.44M)

## Business Recommendations:
	-	Increase focus on high-performing categories such as Health & Beauty and Watches & Gifts through promotions and stock optimisation.
	-	Improve customer retention by introducing loyalty programmes, personalised offers, and post-purchase engagement.
	-	Review underperforming categories to identify pricing, visibility, or demand issues and optimise product strategy.  
