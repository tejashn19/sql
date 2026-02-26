CREATE TABLE orders (
    order_id      NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    product_name  VARCHAR2(100),
    quantity      NUMBER,
    unit_price    NUMBER(10,2),
    order_date    DATE
);
INSERT INTO orders VALUES (1, 'John', 'Laptop', 2, 800, DATE '2024-01-10');
INSERT INTO orders VALUES (2, 'Mary', NULL, 1, 500, DATE '2024-02-15');
INSERT INTO orders VALUES (3, NULL, 'Tablet', 3, NULL, DATE '2024-03-20');
INSERT INTO orders VALUES (4, 'David', 'Phone', 5, 300, NULL);
INSERT INTO orders VALUES (5, NULL, NULL, 2, NULL, NULL);
INSERT INTO orders VALUES (6, 'Emma', 'Headphones', 1, 0, DATE '2024-04-12');
INSERT INTO orders VALUES (7, '', 'Monitor', 2, 150, DATE '2024-05-01');

COMMIT;

--1)Replace NULL price with 0
select nvl(unit_price,0) as price
from orders;

--2)Replace NULL Customer_Name with 'Unknown'
select nvl(customer_name,'unknown')
from orders;

--3)Count NULL values in Product_Name
select count(*) as null_count
from orders
where product_name is null;

--4)Find rows where Order_Date is NULL
select * from orders where order_date is null;

--5)Use COALESCE to return first non-null value
select coalesce(customer_name,product_name,'no data')
from orders;

--6)Use NVL to replace NULL
select nvl(product_name,'not avaliable')
from orders;

--7)Use IFNULL function
select nvl(unit_price,0)
from orders;

--8)check if column is null
select * from orders where unit_price is null;

--9)check if column is not null
select * from orders where unit_price is not null

--10)use nullif between 2 columns
select nullif(quantity, unit_price)
from orders;

--11) replace blank value as null
select nullif(customer_name,'')
from orders;

--12)Count non-NULL values
select count(unit_price)
from orders;

--13)filter records where price is null or 0
select *from orders where unit_price is null or unit_price = 0
 
--14)use case to handle null
select case 
when customer_name is Null
then 'unknown' else customer_name
end as customer
from orders;

--15)Compare NULL values properly 
where unit_price is null

--16)handle null in aggregation
--sum handling null
SELECT SUM(NVL(Unit_Price,0)) AS Total_Price
FROM Orders;
--avg halndling null
select avg(nvl(unit_price,0)) as avg_price
from orders;

--17) average excluding null values
select avg(unit_price)
from orders;

--18)sum ignoring null values
select sum(unit_price)
from orders;

--19) identify columns containg null
select column_name from user_tab_columns where table_name = 'orders' and nullable = 'y';

--20) convert null to default system date
select nvl(order_date,sysdate) as order_date
from orders;