SELECT *
FROM cleaned_data;

SELECT OrderID, Product, Quantity, TotalPrice
FROM cleaned_data;


-- Total revenue
SELECT SUM(TotalPrice) AS Total_Revenue
FROM cleaned_data;

-- Total quantity sold
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM cleaned_data;

-- Total orders
SELECT COUNT(DISTINCT OrderID) AS Total_Orders
FROM cleaned_data;

-- Total customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM cleaned_data;

-- Average order value
SELECT AVG(TotalPrice) AS Average_Order_Value
FROM cleaned_data;


-- Customers with multiple orders
SELECT CustomerID,
       COUNT(*) AS Number_Of_Orders
FROM cleaned_data
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Orders by referral source
SELECT ReferralSource,
       COUNT(*) AS Total_Orders
FROM cleaned_data
GROUP BY ReferralSource;

-- Coupon usage
SELECT CouponCode,
       COUNT(DISTINCT OrderID) AS Total_Orders
FROM cleaned_data
GROUP BY CouponCode;


-- Total quantity sold by product
SELECT Product,
       SUM(Quantity) AS Total_Quantity_Sold
FROM cleaned_data
GROUP BY Product;

-- Revenue by product
SELECT Product,
       SUM(TotalPrice) AS Total_Revenue
FROM cleaned_data
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- Top 5 best selling orders
SELECT *
FROM cleaned_data
ORDER BY TotalPrice DESC
LIMIT 5;


-- Sales by payment method
SELECT PaymentMethod,
       SUM(TotalPrice) AS Total_Sales
FROM cleaned_data
GROUP BY PaymentMethod;

-- Average order value by payment method
SELECT PaymentMethod,
       AVG(TotalPrice) AS Average_Order_Value
FROM cleaned_data
GROUP BY PaymentMethod;

-- Order status analysis
SELECT OrderStatus,
       COUNT(DISTINCT OrderID) AS Total_Orders
FROM cleaned_data
GROUP BY OrderStatus;


-- Average items in cart
SELECT AVG(ItemsInCart) AS Average_Items_In_Cart
FROM cleaned_data;


-- Monthly revenue trend
SELECT YEAR(Date) AS Year,
       MONTH(Date) AS Month,
       SUM(TotalPrice) AS Revenue
FROM cleaned_data
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

-- Yearly average revenue
SELECT YEAR(Date) AS Year,
       AVG(TotalPrice) AS Avg_Revenue
FROM cleaned_data
GROUP BY YEAR(Date)
ORDER BY Year;

-- Monthly average revenue
SELECT MONTH(Date) AS Month,
       AVG(TotalPrice) AS Avg_Revenue
FROM cleaned_data
GROUP BY MONTH(Date)
ORDER BY Month;


-- Highest order value
SELECT MAX(TotalPrice) AS Highest_Order_Value
FROM cleaned_data;

-- Lowest order value
SELECT MIN(TotalPrice) AS Lowest_Order_Value
FROM cleaned_data;