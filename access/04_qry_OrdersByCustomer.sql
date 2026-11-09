-- qry_OrdersByCustomer (parameter query)
-- Business question: "Show me every order for one customer."
-- [Enter part of name] makes Access pop up a box asking for input when the query runs.
-- LIKE with * wildcards allows a partial match, so typing just "Tanaka" finds "Tanaka Kikai".
-- Access SQL (copied from SQL View).

SELECT
    Customers.CompanyName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.Amount,
    Orders.Paid
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE
    (((Customers.CompanyName) LIKE "*" & [Enter part of name] & "*"));
