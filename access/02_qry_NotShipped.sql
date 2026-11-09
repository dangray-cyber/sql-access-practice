-- qry_NotShipped
-- Business question: "Which orders haven't shipped yet?"
-- An empty (NULL) ShipDate means the order is still waiting to go out.
-- Access SQL (copied from SQL View).

SELECT
    Customers.CompanyName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.ShipDate
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE
    (((Orders.ShipDate) IS NULL));
