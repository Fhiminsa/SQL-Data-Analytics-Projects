--total sales and total profits of each year--
select DATE_PART('year', "Order_Date") as year,
 		SUM("Sales") AS total_sales,
    	SUM("Profit") AS total_profit
FROM superstore_clean sc
GROUP BY year
ORDER BY year ASC;

--total profits and total sales per quarter--
select DATE_PART('year', "Order_Date") as year,
	case 
		when DATE_PART('month', "Order_Date") in (1, 2, 3) then 'Q1'
		when DATE_PART('month', "Order_Date") in (4, 5, 6) then 'Q2'
		when DATE_PART('month', "Order_Date") in (7, 8, 9) then 'Q3'
		else 'Q4'
	end as quarter,
	SUM("Sales") AS total_sales,
    SUM("Profit") AS total_profit
from superstore_clean sc
group by year, quarter
order by year, quarter;

--region generates the highest sales and profits--
select "Region",
		SUM("Sales") AS total_sales,
    	SUM("Profit") AS total_profit
 from superstore_clean sc 
 group by "Region"
 order by total_profit desc;


-- Gain Profit Margin --
SELECT "Region",
       ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
FROM superstore_clean sc 
GROUP BY "Region" 
ORDER BY profit_margin desc;

--state brings in the highest sales and profits--
select "State", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "State" 
order by total_profit desc
limit 10;

--state brings in the lowest sales and profits--
select "State", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "State" 
order by total_profit ASC
limit 10;

--The top cities--
select "City", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "City" 
order by total_profit DESC
limit 10;

--The top cities--
select "City", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "City" 
order by total_profit ASC
limit 10;

--The relationship between discount and sales and the total discount per category--
select "Discount",
		avg("Sales") as Avg_sales
from superstore_clean sc 
group by "Discount"
order by "Discount";

--total discount per product category--
select "Category",
		sum("Discount") as total_discount
from superstore_clean sc 
group by "Category"
order by total_discount desc;

select "Category",
		"Sub_Category",
		sum("Discount") as total_discount
from superstore_clean sc 
group by "Category", "Sub_Category"
order by total_discount desc;

--What category generates the highest sales and profits in each region and state--
select "Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "Category" 
order by total_profit desc;

--the highest total sales and total profits per Category in each region--
select "Region",
		"Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "Region","Category" 
order by total_profit desc;

--the highest total sales and total profits per Category in each state--
select "State",
		"Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "State","Category" 
order by total_profit desc;

--the total sales and total profits of each subcategory with their profit margins--
select "Sub_Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit,
		ROUND((CAST(SUM("Profit") AS numeric) / CAST(SUM("Sales") AS numeric)) * 100, 2) AS profit_margin
from superstore_clean sc 
group by "Sub_Category"
order by total_profit desc;

--the highest total sales and total profits per subcategory in each region:--
select "Region",
		"Sub_Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "Region","Sub_Category"
order by total_profit desc;

--the highest and lowest total sales and total profits per subcategory in each state--
select "State",
		"Sub_Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "State","Sub_Category"
order by total_profit desc;

select "State",
		"Sub_Category", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "State","Sub_Category"
order by total_profit asc;

--the names of the products that are the most and least profitable--
select "Product_Name", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "Product_Name"
order by total_profit desc;

select "Product_Name", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "Product_Name"
order by total_profit asc;

--What segment makes the most of our profits and sales--
select "Segment", 
		sum("Sales") as total_sales, 
		sum("Profit") as total_profit
from superstore_clean sc 
group by "Segment"
order by total_profit desc;

--How many customers do we have (unique customer IDs) in total and how much per region and state?--
select COUNT (distinct "Customer_ID") as Total_Customer
from superstore_clean sc 

--Regonally--
select "Region",  
		COUNT (distinct "Customer_ID") as Total_Customer
from superstore_clean sc 
group by "Region"
order by Total_Customer desc;

--by state--
select "State",  
		COUNT (distinct "Customer_ID") as Total_Customer
from superstore_clean sc 
group by "State"
order by Total_Customer desc;

--What customers spent the most with us? That is generated the most sales--
select "Customer_ID",
		sum("Sales")  as total_sales,
		sum("Profit")  as total_profit
from superstore_clean sc 
group by "Customer_ID"
order by total_sales desc 
limit 15;

--Average shipping time per class and in total--
select round(avg("Ship_Date" - "Order_Date"), 1) as avg_shipping_time
from superstore_clean sc 

--The shipping time in each shipping mode--
select "Ship_Mode",
		round(avg("Ship_Date" - "Order_Date"), 1) as avg_shipping_time
from superstore_clean sc
group by "Ship_Mode"
order by avg_shipping_time 