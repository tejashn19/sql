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

-- 1. Round Unit_Price to 2 decimal places
SELECT ROUND(Unit_Price,2) FROM Orders;

-- 2. Find total sales per order
SELECT Order_ID, Quantity * Unit_Price AS Total_Sales
FROM Orders;

-- 3. Calculate average order value
SELECT AVG(Quantity * Unit_Price) FROM Orders;

-- 4. Find highest product price
SELECT MAX(Unit_Price) FROM Orders;

-- 5. Find lowest product price
SELECT MIN(Unit_Price) FROM Orders;

-- 6. Calculate percentage discount applied
-- Example (10% discount)
SELECT Unit_Price * 0.10 AS Discount FROM Orders;

-- 7. Find modulus of Quantity divided by 2
SELECT MOD(Quantity,2) FROM Orders;

-- 8. Convert negative values to positive
SELECT ABS(Unit_Price) FROM Orders;

-- 9. Truncate price without rounding
SELECT TRUNC(Unit_Price,2) FROM Orders;

-- 10. Find square root of total sales
SELECT SQRT(Quantity * Unit_Price) FROM Orders;

-- 11. Calculate exponential value
SELECT EXP(2) FROM dual;

-- 12. Calculate power of 2^5
SELECT POWER(2,5) FROM dual;

-- 13. Find absolute difference between two prices
SELECT ABS(799 - 650) FROM dual;

-- 14. Calculate sales growth percentage
-- Example formula
SELECT ((1500-1000)/1000)*100 FROM dual;

-- 15. Random number between 1 and 100
SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) FROM dual;

-- 16. Divide total sales by number of orders
SELECT SUM(Quantity*Unit_Price)/COUNT(Order_ID)
FROM Orders;

-- 17. Find ceiling value of price
SELECT CEIL(Unit_Price) FROM Orders;

-- 18. Find floor value of price
SELECT FLOOR(Unit_Price) FROM Orders;

-- 19. Convert decimal to integer
SELECT ROUND(Unit_Price) FROM Orders;

-- 20. Calculate compound interest
-- Example: P=1000, R=5%, T=2 years
SELECT 1000 * POWER((1+0.05),2) FROM dual;