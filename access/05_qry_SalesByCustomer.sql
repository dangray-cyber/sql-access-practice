-- qry_SalesByCustomer (totals query)
-- Business question: "What are total sales per customer?"
-- Built with the Totals (Σ) button: Group By CompanyName, Sum of Amount.
-- The AS keyword names the result column TotalSales.
-- TotalSales has the Format property #,##0"円" so amounts display in yen.
-- Access SQL (copied from SQL View).

SELECT
    Customers.CompanyName,
    Sum(Orders.Amount) AS TotalSales
FROM
    Customers
    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
    Customers.CompanyName;
