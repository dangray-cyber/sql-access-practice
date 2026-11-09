-- qry_October
-- Business question: "Show me all orders placed in October."
-- Access wraps dates in # and uses month/day/year order.
-- Access SQL (copied from SQL View).

SELECT
    Customers.CompanyName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.Amount
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE
    (((Orders.OrderDate) BETWEEN #10/1/2026# AND #10/31/2026#));
