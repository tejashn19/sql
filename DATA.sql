CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Store_Location VARCHAR(100)
);

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location)
VALUES
(1001, '2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore'),
(1002, '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad'),
(1003, '2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai'),
(1004, '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai'),
(1005, '2026-02-05', 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore'),
(1006, '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi'),
(1007, '2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata'),
(1008, '2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi'),
(1009, '2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad'),
(1010, '2026-02-10', 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');

--Extract year from Order_Date

SELECT EXTRACT(YEAR FROM order_date) AS year
FROM orders;

---Extract month from Order_Date
SELECT EXTRACT(MONTH FROM order_date) AS month
FROM orders;

--Extract day from Order_Date

SELECT EXTRACT(DAY FROM order_date) AS day
FROM orders;

---Find current date
SELECT SYSDATE FROM dual;

--- Find current timestamp
SELECT SYSTIMESTAMP FROM dual;

--Add 7 days to Order_Date
SELECT order_date + 7 AS new_date
FROM orders;

--⃣ Subtract 30 days from Order_Date
SELECT order_date - 30 AS new_date
FROM orders;

--- Find difference between two dates
SELECT end_date - start_date AS difference_in_days
FROM orders;

--- Get first day of the year
SELECT TRUNC(order_date, 'YEAR')
FROM orders;

---Format date as 'DD-MM-YYYY'
SELECT TO_CHAR(order_date, 'DD-MM-YYYY')
FROM orders;

---Convert string to date
SELECT TO_DATE('24-02-2026', 'DD-MM-YYYY')
FROM dual;

--- Convert date to string
SELECT TO_CHAR(order_date, 'DD-MON-YYYY')
FROM orders;

---- Find week number of the year
SELECT TO_CHAR(order_date, 'WW') AS week_number
FROM orders;

--- Find day name from date
SELECT TO_CHAR(order_date, 'DAY')
FROM orders;

---Find quarter of the year
SELECT TO_CHAR(order_date, 'Q') AS quarter
FROM orders;

---Calculate age from DOB
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, dob)/12) AS age
FROM orders;

--- Check if date is weekend
SELECT order_date,
       CASE 
           WHEN TO_CHAR(order_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') 
                IN ('SAT','SUN')
           THEN 'Weekend'
           ELSE 'Weekday'
       END AS day_type
FROM orders;