--Selecting All
select *
from Amazon

--Order count
select count ("Order ID")
from Amazon

--Duplicat check 
select "Order ID",
count ("Order ID")
from Amazon
group by "Order ID"
order by "Order ID" asc

--Top Selling product by quantity
Select product, 
sum (Quantity) AS "product count",
sum ("Total Sales") AS "total sales"
from Amazon
group by product
order by "product count" desc

-- Top selling product by sales
select Product,
sum (Quantity) AS "Quantity sold",
Sum ("Total Sales") AS "total sales"
from Amazon
group by Product, Quantity, "Total Sales"
order by "total sales" desc

--Categories and orders ID count in each category
select category,
count (category) AS "category count"
from Amazon
group by category

--Price frequency 
select price, 
count (price) AS "Frequency"
from Amazon
group by price
order by "Frequency" desc

--Customer location and Order ID count in each location 
select "Customer Location",
count ("Customer Location") AS "customer count"
from Amazon
group by "Customer Location"
order by "customer count" desc

--PRICE Descriptive Statistics/ Data profiling
select
count (Price) AS "total orders count",
avg (price) AS "Mean/AvG Price",
min (price) AS "Min",
max (price) AS "Max",
(max (price) - min (price)) AS "Median Range",
STDDEV (price) AS "standard deviation",
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price) AS "Q1",
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price) AS "Q3",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price)) AS "IQR",
(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price)-(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price)))) AS "Lower outlier",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price)+(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price)))) AS "Upper outlier"
from "Amazon";

--Quantity Descriptive Statistics/ Data profiling
select
sum (Quantity) AS "total orders count",
avg (Quantity) AS "Mean/AvG Price",
min (Quantity) AS "Min",
max (Quantity) AS "Max",
(max (Quantity) - min (Quantity)) AS "Median Range",
STDDEV (Quantity) AS "standard deviation",
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Quantity) AS "Q1",
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Quantity) AS "Q3",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Quantity)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Quantity)) AS "IQR",
(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Quantity)-(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Quantity)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Quantity)))) AS "Lower outlier",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Quantity)+(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Quantity)-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Quantity)))) AS "Upper outlier"
from "Amazon";

--SALES Descriptive Statistics/ Data profiling
select
sum ("Total Sales") AS "total orders count",
avg ("Total Sales") AS "Mean/AvG Price",
min ("Total Sales") AS "Min",
max ("Total Sales") AS "Max",
(max ("Total Sales") - min ("Total Sales")) AS "Median Range",
STDDEV ("Total Sales") AS "standard deviation",
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Total Sales") AS "Q1",
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Total Sales") AS "Q3",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Total Sales")-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Total Sales")) AS "IQR",
(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Total Sales")-(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Total Sales")-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Total Sales")))) AS "Lower outlier",
(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Total Sales")+(1.5*(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Total Sales")-PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Total Sales")))) AS "Upper outlier"
from "Amazon";

--Top Cancelled products
select Product, Status,
sum (Quantity) As "quantity", 
sum ("Total Sales") As "total sales"
from Amazon
where status = 'Cancelled'
group by Product, status, "quantity"
order by "quantity" desc

--Top Completed products
select Product,status,
sum (Quantity) AS "Total count",
sum ("Total Sales") AS "total Completed sales"
from amazon 
where status = 'Completed'
group by Product, status
order by "Total count" desc

--Top Pending products
select Product,status,
sum (Quantity) AS "Total count",
sum ("Total Sales") AS "total Pending sales"
from amazon 
where status = 'Pending'
group by Product, status
order by "Total count" desc

--Price distrinution/ Price List
select distinct Product, 
Price
from Amazon

--Frequent Customers
select "Customer Name",
count ("Customer Name") AS "Order count"
from Amazon
group by "Customer Name"
order by "Order count" desc

--Customers with the Highest Number of Comleted Orders
select "Customer Name",
count ("Customer Name") AS "Order count"
from Amazon
where status = 'Completed'
group by "Customer Name"
order by "Order count" desc

--Customers with the Highest Number of Canceled Orders
select "Customer Name",
count ("Customer Name") AS "Order count"
from Amazon
where status = 'Cancelled'
group by "Customer Name"
order by "Order count" desc

--Customers with the Highest Number of pending Orders
select "Customer Name",
count ("Customer Name") AS "Order count"
from Amazon
where status = 'Pending'
group by "Customer Name"
order by "Order count" desc

--Payment Method
select "Payment Method",
count ("Payment Method") AS "Order count"
from Amazon
group by "Payment Method"
order by "Order count" desc
