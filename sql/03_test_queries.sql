USE online_car_marketplace;

SELECT
    l.ListingID,
    v.make,
    v.model,
    v.year,
    i.status,
    i.location
FROM Inventory i
JOIN Listing l ON i.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN
WHERE i.status = 'Available';

INSERT INTO Vehicle
(VIN, make, model, year, trim, wheel_drive, body_style, num_seats)
VALUES
('3CZRU6H59MM123460', 'Honda', 'HR-V', 2022, 'Sport', 'AWD', 'SUV', 5);

UPDATE Inventory
SET quantity = 2
WHERE InventoryID = 1;

DELETE FROM Inventory
WHERE InventoryID = 5;

SELECT
    v.make,
    v.model,
    COUNT(*) AS total_sales
FROM Transactions t
JOIN Listing l ON t.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN
GROUP BY v.make, v.model
ORDER BY total_sales DESC;

SELECT
    v.make,
    v.model,
    COUNT(*) AS total_sales
FROM Transactions t
JOIN Listing l ON t.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN
GROUP BY v.make, v.model
ORDER BY total_sales ASC;

SELECT
    u.UserID,
    u.first_name,
    u.last_name,
    MAX(t.transaction_date) AS last_purchase
FROM Users u
JOIN Customer c ON u.UserID = c.UserID
LEFT JOIN Transactions t ON c.CustomerID = t.CustomerID
GROUP BY u.UserID, u.first_name, u.last_name;

SELECT
    u.first_name,
    u.last_name,
    v.make,
    v.model
FROM Users u
JOIN Customer c ON u.UserID = c.UserID
JOIN Transactions t ON c.CustomerID = t.CustomerID
JOIN Listing l ON t.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN;