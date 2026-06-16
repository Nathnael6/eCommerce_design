USE online_car_marketplace;

SELECT 
    v.body_style,
    COUNT(*) AS quantity_in_stock
FROM Inventory i
JOIN Listing l ON i.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN
WHERE i.status = 'Available'
GROUP BY v.body_style
ORDER BY quantity_in_stock DESC;

SELECT 
    v.body_style,
    COUNT(t.TransactionID) AS total_units_sold,
    SUM(t.total_amount) AS total_revenue
FROM Transactions t
JOIN Listing l ON t.ListingID = l.ListingID
JOIN Vehicle v ON l.VIN = v.VIN
WHERE t.transaction_status = 'Completed'
GROUP BY v.body_style
ORDER BY total_units_sold DESC;


SELECT
    cu.CustomerID,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    u.city AS customer_city,
    MAX(t.transaction_date) AS last_purchase_date,
    ROUND(DATEDIFF(CURDATE(), MAX(t.transaction_date)) / 30.0, 1) AS months_since_purchase,
    CASE
        WHEN DATEDIFF(CURDATE(), MAX(t.transaction_date)) / 30.0 > 12 
            THEN 'Inactive 12mo+'
        WHEN DATEDIFF(CURDATE(), MAX(t.transaction_date)) / 30.0 > 6 
            THEN 'Inactive 6mo+'
        WHEN DATEDIFF(CURDATE(), MAX(t.transaction_date)) / 30.0 > 3 
            THEN 'Inactive 3mo+'
        ELSE 'Active'
    END AS activity_status
FROM Customer cu
JOIN Users u ON cu.UserID = u.UserID
LEFT JOIN Transactions t ON cu.CustomerID = t.CustomerID
GROUP BY cu.CustomerID, u.first_name, u.last_name, u.city
ORDER BY months_since_purchase DESC;

SELECT
    v.make,
    ROUND(AVG(DATEDIFF(CURDATE(), l.listed_date)), 1) AS avg_days_on_market
FROM Listing l
JOIN Vehicle v ON l.VIN = v.VIN
JOIN Inventory i ON l.ListingID = i.ListingID
WHERE i.status = 'Available'
GROUP BY v.make
ORDER BY avg_days_on_market DESC;