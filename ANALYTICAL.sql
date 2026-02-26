CREATE TABLE sales (
    order_id     NUMBER PRIMARY KEY,
    customer_id  NUMBER,
    customer_name VARCHAR2(100),
    product_name VARCHAR2(100),
    category     VARCHAR2(50),
    region       VARCHAR2(50),
    order_date   DATE,
    quantity     NUMBER,
    price        NUMBER(10,2),
    sales_amount NUMBER(10,2),
    department   VARCHAR2(50),
    salary       NUMBER(10,2)
);

INSERT INTO sales VALUES (1,101,'John','Laptop','Electronics','North',DATE '2024-01-01',1,800,800,'IT',50000);
INSERT INTO sales VALUES (2,102,'Mary','Phone','Electronics','South',DATE '2024-01-02',2,500,1000,'HR',40000);
INSERT INTO sales VALUES (3,103,'David','Tablet','Electronics','North',DATE '2024-01-03',1,300,300,'IT',55000);
INSERT INTO sales VALUES (4,101,'John','Mouse','Accessories','East',DATE '2024-01-04',3,50,150,'IT',50000);
INSERT INTO sales VALUES (5,104,'Emma','Keyboard','Accessories','West',DATE '2024-01-05',2,70,140,'Finance',45000);
INSERT INTO sales VALUES (6,105,'Alex','Monitor','Electronics','South',DATE '2024-01-06',1,200,200,'HR',42000);
INSERT INTO sales VALUES (7,102,'Mary','Laptop','Electronics','North',DATE '2024-02-01',1,900,900,'HR',40000);
INSERT INTO sales VALUES (8,103,'David','Mouse','Accessories','East',DATE '2024-02-02',2,50,100,'IT',55000);
INSERT INTO sales VALUES (9,106,'Sophia','Phone','Electronics','West',DATE '2024-02-03',1,600,600,'Finance',47000);
INSERT INTO sales VALUES (10,101,'John','Tablet','Electronics','North',DATE '2024-02-04',1,350,350,'IT',50000);

COMMIT;

-- 1) Assign row numbers to each order
SELECT order_id,
       ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
FROM sales;

-- 2) Rank products by price
SELECT product_name, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM sales;

-- 3) Dense rank products by sales
SELECT product_name, sales_amount,
       DENSE_RANK() OVER (ORDER BY sales_amount DESC) AS dense_rank
FROM sales;

-- 4) Find running total of sales
SELECT order_date, sales_amount,
       SUM(sales_amount) OVER (ORDER BY order_date) AS running_total
FROM sales;

-- 5) Calculate cumulative sum by month
SELECT order_date,
       SUM(sales_amount) OVER 
       (PARTITION BY TO_CHAR(order_date,'MM')
        ORDER BY order_date) AS monthly_running_total
FROM sales;

-- 6) Find moving average of last 3 days
SELECT order_date,
       AVG(sales_amount) OVER
       (ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM sales;

-- 7) Calculate lag of previous day sales
SELECT order_date, sales_amount,
       LAG(sales_amount) OVER (ORDER BY order_date) AS prev_day_sales
FROM sales;

-- 8) Calculate lead of next day sales
SELECT order_date, sales_amount,
       LEAD(sales_amount) OVER (ORDER BY order_date) AS next_day_sales
FROM sales;

-- 9) Find difference between current and previous sale
SELECT order_date, sales_amount,
       sales_amount - LAG(sales_amount) 
       OVER (ORDER BY order_date) AS difference
FROM sales;

-- 10) Partition sales by region
SELECT region, sales_amount,
       SUM(sales_amount) OVER (PARTITION BY region) AS region_total
FROM sales;

-- 11) Find top 3 products per category
SELECT *
FROM (
    SELECT product_name, category, sales_amount,
           ROW_NUMBER() OVER 
           (PARTITION BY category ORDER BY sales_amount DESC) rn
    FROM sales
)
WHERE rn <= 3;

-- 12) Find bottom 2 customers by sales
SELECT *
FROM (
    SELECT customer_name,
           SUM(sales_amount) total_sales,
           ROW_NUMBER() OVER 
           (ORDER BY SUM(sales_amount)) rn
    FROM sales
    GROUP BY customer_name
)
WHERE rn <= 2;

-- 13) Calculate percentage of total sales
SELECT sales_amount,
       ROUND(100 * sales_amount /
       SUM(sales_amount) OVER (),2) AS percent_total
FROM sales;

-- 14) Calculate NTILE distribution of customers
SELECT customer_name,
       NTILE(4) OVER (ORDER BY sales_amount DESC) AS quartile
FROM sales;

-- 15) Find first order per customer
SELECT *
FROM (
    SELECT customer_id, order_date,
           ROW_NUMBER() OVER
           (PARTITION BY customer_id ORDER BY order_date) rn
    FROM sales
)
WHERE rn = 1;

-- 16) Find last order per customer
SELECT *
FROM (
    SELECT customer_id, order_date,
           ROW_NUMBER() OVER
           (PARTITION BY customer_id ORDER BY order_date DESC) rn
    FROM sales
)
WHERE rn = 1;

-- 17) Calculate average salary within department
SELECT department, salary,
       AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM sales;

-- 18) Compare current row with max value in partition
SELECT department, salary,
       MAX(salary) OVER (PARTITION BY department) AS max_salary,
       salary - MAX(salary) OVER (PARTITION BY department) AS difference
FROM sales;

-- 19) Identify duplicate records using ROW_NUMBER
SELECT *
FROM (
    SELECT customer_id, order_date,
           ROW_NUMBER() OVER 
           (PARTITION BY customer_id, order_date 
            ORDER BY order_id) rn
    FROM sales
)
WHERE rn > 1;

-- 20) Find cumulative distinct count
SELECT order_date,
       COUNT(DISTINCT customer_id) 
       OVER (ORDER BY order_date) AS cumulative_customers
FROM sales;