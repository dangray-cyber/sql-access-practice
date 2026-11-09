-- qry_Unpaid
-- Business question: "Which orders haven't been paid yet?"
-- Joins Customers to Orders so each unpaid order shows the company name.
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
    (((Orders.Paid) = No));
