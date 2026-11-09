-- 02_seed_data.sql
-- Sample data: 6 fictional customers, 12 orders across October and November 2026.
-- Customer 6 has no orders on purpose (used by query 08).

INSERT INTO Customers (CompanyName, Prefecture) VALUES
    ('Tanaka Kikai',    'Fukuoka'),
    ('Saga Seiki',      'Saga'),
    ('Osaka Robotics',  'Osaka'),
    ('Nagoya Motors',   'Aichi'),
    ('Kumamoto Tech',   'Kumamoto'),
    ('Nagasaki Marine', 'Nagasaki');

INSERT INTO Orders (CustomerID, OrderDate, ShipDate, Amount, Paid) VALUES
    (1, '2026-10-02', '2026-10-06', 120000, 1),
    (2, '2026-10-05', '2026-10-09',  85000, 1),
    (3, '2026-10-11', '2026-10-15', 240000, 0),
    (1, '2026-10-18', '2026-10-22',  60000, 1),
    (4, '2026-10-23', '2026-10-28', 310000, 1),
    (5, '2026-10-29', '2026-11-04',  45000, 0),
    (2, '2026-11-02', '2026-11-05', 150000, 1),
    (3, '2026-11-04', NULL,          98000, 0),
    (4, '2026-11-06', '2026-11-10', 175000, 0),
    (1, '2026-11-09', NULL,          72000, 0),
    (5, '2026-11-12', '2026-11-16', 130000, 1),
    (2, '2026-11-14', NULL,          55000, 0);
