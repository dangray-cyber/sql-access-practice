-- 03_queries.sql
-- Queries 01-05 are the SQLite versions of the five Access queries.
-- Queries 06-08 go a step further than the Access practice.
-- In DB Browser for SQLite: highlight one query and press Ctrl+Enter (or Shift+F5) to run just that one.

-- 01. Unpaid orders: "Which orders haven't been paid yet?"
SELECT c.CompanyName, o.OrderID, o.OrderDate, o.Amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.Paid = 0
ORDER BY o.OrderDate;

-- 02. Not shipped: "Which orders haven't shipped yet?"
SELECT c.CompanyName, o.OrderID, o.OrderDate, o.Amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.ShipDate IS NULL
ORDER BY o.OrderDate;

-- 03. October orders: "Show me all orders placed in October."
SELECT c.CompanyName, o.OrderID, o.OrderDate, o.Amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '2026-10-01' AND '2026-10-31'
ORDER BY o.OrderDate;

-- 04. Orders for one customer (the Access parameter query).
-- SQLite has no pop-up box, so change the name in quotes.
-- LIKE with % allows a partial match, the same as the Access "*" version.
SELECT c.CompanyName, o.OrderID, o.OrderDate, o.ShipDate, o.Amount, o.Paid
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CompanyName LIKE '%Tanaka%'
ORDER BY o.OrderDate;

-- 05. Total sales per customer, highest first.
SELECT c.CompanyName, SUM(o.Amount) AS TotalSales, COUNT(o.OrderID) AS NumOrders
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY TotalSales DESC;

-- 06. Sales by month: "How did October compare with November?"
SELECT strftime('%Y-%m', o.OrderDate) AS Month,
       SUM(o.Amount)                  AS TotalSales,
       COUNT(*)                       AS NumOrders
FROM Orders AS o
GROUP BY Month
ORDER BY Month;

-- 07. Money still owed per customer: "Who owes us the most?"
-- HAVING filters after grouping (WHERE filters before).
SELECT c.CompanyName, SUM(o.Amount) AS AmountOwed, COUNT(*) AS UnpaidOrders
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.Paid = 0
GROUP BY c.CompanyName
HAVING SUM(o.Amount) > 0
ORDER BY AmountOwed DESC;

-- 08. Customers with no orders: "Which customers haven't ordered anything?"
-- LEFT JOIN keeps every customer, and customers with no match get NULL in the Orders columns.
SELECT c.CompanyName, c.Prefecture
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
