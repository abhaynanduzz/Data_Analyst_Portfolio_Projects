create database Adidas_Sales;
use Adidas_Sales; 

select * from adidassalesdata;

describe adidassalesdata;

#1.	Total Sales
select sum(`Total Sales`) from adidassalesdata;

#Total Profit
select (sum(`Total Sales`)-sum(`Operating Profit`)) as Total_profit from adidassalesdata;

#Average Price per Unit
select avg(`Price per Unit`) as average_price from  adidassalesdata;

#Total Units Sold
select sum(`Units Sold`) as total_unit_sold from  adidassalesdata;

#2.	Profit by Retailer
select Retailer, (sum(`Total Sales`)-sum(`Operating Profit`)) as Total_profit from  adidassalesdata
group by Retailer
order by Total_profit;



#converting date column text into date values
UPDATE  adidassalesdata
SET `Invoice Date` = STR_TO_DATE(`Invoice Date`, '%W, %M %e, %Y');

#Yearly Sales Trend:
select year(`Invoice Date`) as years, sum(`Total Sales`) as total_sales from  adidassalesdata
group by years
order by total_sales DESC ;



#Quarterly Sales Trend
SELECT CONCAT(YEAR(`Invoice Date`), ' Q', QUARTER(`Invoice Date`)) AS sales_quarter, SUM(`Total Sales`) AS total_sales
FROM adidassalesdata
GROUP BY YEAR(`Invoice Date`), QUARTER(`Invoice Date`)
ORDER BY sales_quarter;


#Monthly Sales Trend:
SELECT CONCAT(YEAR(`Invoice Date`), '-', LPAD(MONTH(`Invoice Date`), 2, '0')) AS sales_month, SUM(`Total Sales`) AS total_sales
FROM adidassalesdata
GROUP BY YEAR(`Invoice Date`), MONTH(`Invoice Date`)
ORDER BY sales_month;

#Daily Sales Trend:
SELECT `Invoice Date`as sales_date, SUM(`Total Sales`) AS total_sales
FROM adidassalesdata
GROUP BY sales_date
ORDER BY sales_date;

#4.	Product Category Sales Distribution
select `Product Category`, sum(`Total Sales`)as total_sales from adidassalesdata
group by`Product Category`
order by`total_sales`;


select * from adidassalesdata;

#5.	Units Sold by Product Category and Gender Type:
select  `Product Category`,`Gender Type`,sum(`Units Sold`)as Units_Sold  from adidassalesdata
group by`Product Category`,`Gender Type`
order by`Product Category`,`Gender Type`;

#6.	Effective Sales Methods: o	Determine the most effective sales method in generating sales and compare the performance of different sales channels.
select `Sales Method`,sum(`Total Sales`)as total_sales from adidassalesdata
group by `Sales Method`
order by total_sales;



#7.	Regional Sales Analysis: Explore how sales data varies by region, state, and city to identify potential areas for improvement.
select region, state, city, sum(`Total Sales`)as total_sales from adidassalesdata 
group  by region, state, city
order by region, state, city;

#8.	Top Performing Cities by Profit:	Identify the top 5 performing cities based on profit and gain insights into their sales strategies
select city , (sum(`Total Sales`)-sum(`Operating Profit`)) as Total_profit  from adidassalesdata
group by city
order by  Total_profit DESC limit 5 ;


