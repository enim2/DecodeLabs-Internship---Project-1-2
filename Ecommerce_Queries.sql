SELECT *
FROM [Ecommerce Sales]

SELECT OrderID, Date, Product, Quantity, UnitPrice, TotalPrice, OrderStatus
FROM [Ecommerce Sales]

SELECT *
FROM [Ecommerce Sales]
WHERE OrderStatus = 'Delivered'

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE TotalPrice > 1000

SELECT OrderID, Product, Quantity, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE OrderStatus = 'Returned' OR OrderStatus = 'Cancelled'

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE OrderStatus IN ('Returned', 'Cancelled')

SELECT OrderID, Product, TotalPrice, ReferralSource, OrderStatus
FROM [Ecommerce Sales]
WHERE ReferralSource = 'Instagram' AND OrderStatus = 'Delivered'

SELECT OrderID, Product, TotalPrice, CouponCode
FROM [Ecommerce Sales]
WHERE CouponCode IS NULL

SELECT OrderID, Date, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE YEAR(Date) = 2024

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
ORDER BY TotalPrice DESC

SELECT OrderID, Date, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
ORDER BY Date DESC

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE OrderStatus = 'Delivered'
ORDER BY TotalPrice DESC

SELECT Product,
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue,
       AVG(TotalPrice) as AvgOrderValue
FROM [Ecommerce Sales]
GROUP BY Product
ORDER BY TotalRevenue DESC


SELECT OrderStatus,
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue
FROM [Ecommerce Sales]
GROUP BY OrderStatus
ORDER BY TotalOrders DESC


SELECT ReferralSource,
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue,
       AVG(TotalPrice) as AvgOrderValue
FROM [Ecommerce Sales]
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC


SELECT PaymentMethod,
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue,
       AVG(TotalPrice) as AvgOrderValue
FROM [Ecommerce Sales]
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC


SELECT YEAR(Date),
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue
FROM [Ecommerce Sales]
GROUP BY YEAR(Date)
ORDER BY YEAR(Date)


SELECT MONTH(Date) as MonthNumber,
       DATENAME(MONTH, Date) as MonthName,
       COUNT(OrderID) as TotalOrders, 
       SUM(TotalPrice) as TotalRevenue
FROM [Ecommerce Sales]
GROUP BY MONTH(Date), DATENAME(MONTH, Date) 
ORDER BY MONTH(Date)


SELECT
     CASE WHEN CouponCode IS NULL THEN 'No Coupon'
     ELSE 'Discounted'
END AS [Discount Flag],
     COUNT(OrderID) as TotalOrders, 
     SUM(TotalPrice) as TotalRevenue
FROM [Ecommerce Sales]
GROUP BY CASE WHEN CouponCode IS NULL THEN 'No Coupon'
     ELSE 'Discounted'
END


SELECT TOP 10 OrderID, Date, Product, TotalPrice, OrderStatus, ReferralSource
FROM [Ecommerce Sales]
WHERE YEAR(Date) = 2023
ORDER BY TotalPrice DESC


SELECT Product,
     AVG(TotalPrice) as AvgOrderValue
FROM [Ecommerce Sales]
GROUP BY Product
HAVING AVG(TotalPrice) > 1000
ORDER BY AvgOrderValue DESC

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE TotalPrice BETWEEN 500 AND 2000
ORDER BY TotalPrice DESC

SELECT OrderID, Product, TotalPrice, OrderStatus, ReferralSource
FROM [Ecommerce Sales]
WHERE Product IN ('Phone','Laptop') AND OrderStatus = 'Delivered'
ORDER BY TotalPrice DESC

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE Product LIKE 'M%'
ORDER BY TotalPrice DESC

SELECT COUNT(OrderID) as "Orders With No Coupon"
FROM [Ecommerce Sales]
WHERE CouponCode IS Null

SELECT OrderID, Date, Product, TotalPrice, OrderStatus
FROM [Ecommerce Sales]
WHERE MONTH(Date) BETWEEN 1 AND 6
ORDER BY Date

SELECT Product,
      MAX(TotalPrice) as HighestOrder,
      MIN(TotalPrice) as LowestOrder,
      AVG(TotalPrice) as AvgOrderValue
FROM [Ecommerce Sales]
GROUP BY Product
ORDER BY AvgOrderValue DESC

SELECT YEAR(Date) as Year, Product,
      COUNT(OrderID) as TotalOrders,
      SUM(TotalPrice) as TotalRevenue
FROM [Ecommerce Sales]
GROUP BY YEAR(Date), Product
ORDER BY Year, TotalRevenue DESC

SELECT YEAR(Date) as Year, OrderStatus,
      COUNT(OrderID) as TotalOrders
FROM [Ecommerce Sales]
GROUP BY YEAR(Date), OrderStatus
ORDER BY Year, TotalOrders DESC

SELECT YEAR(Date) AS Year,
       DATENAME(MONTH, Date) AS MonthName,
       SUM(TotalPrice) AS TotalRevenue
FROM [Ecommerce Sales]
GROUP BY YEAR(Date), DATENAME(MONTH, Date), MONTH(Date)
ORDER BY Year, TotalRevenue DESC

SELECT TOP 15 CustomerID,
       COUNT(OrderID) AS TotalOrders,
       SUM(TotalPrice) AS TotalSpent
FROM [Ecommerce Sales]
GROUP BY CustomerID
ORDER BY TotalSpent DESC