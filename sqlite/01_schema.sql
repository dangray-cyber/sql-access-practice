-- 01_schema.sql
-- Creates the two tables. Same design as the Access version.
-- SQLite has no Yes/No or Currency types, so:
--   Paid   -> INTEGER (1 = paid, 0 = not paid)
--   Amount -> INTEGER (yen has no decimals)
--   Dates  -> TEXT in YYYY-MM-DD format (sorts and compares correctly)

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID   INTEGER PRIMARY KEY AUTOINCREMENT,
    CompanyName  TEXT NOT NULL,
    Prefecture   TEXT
);

CREATE TABLE Orders (
    OrderID     INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID  INTEGER NOT NULL,
    OrderDate   TEXT NOT NULL,
    ShipDate    TEXT,                       -- NULL = not shipped yet
    Amount      INTEGER NOT NULL,           -- yen
    Paid        INTEGER NOT NULL DEFAULT 0 CHECK (Paid IN (0, 1)),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);
