USE online_car_marketplace;

-- Users
INSERT INTO Users
(first_name, last_name, email, street_address, city, state, zip_code, last_login, MFA_enabled)
VALUES
('John', 'Smith', 'john.smith@email.com', '123 Main St', 'Seattle', 'WA', '98101', NOW(), TRUE),
('Sarah', 'Johnson', 'sarah.j@email.com', '456 Pine St', 'Bellevue', 'WA', '98004', NOW(), FALSE),
('Michael', 'Brown', 'michael.b@email.com', '789 Oak Ave', 'Everett', 'WA', '98201', NOW(), TRUE),
('Emma', 'Davis', 'emma.d@email.com', '321 Cedar Rd', 'Lynnwood', 'WA', '98036', NOW(), FALSE),
('David', 'Wilson', 'david.w@email.com', '654 Maple Dr', 'Bothell', 'WA', '98011', NOW(), TRUE),
('Olivia', 'Martinez', 'olivia.m@email.com', '111 Lake St', 'Kirkland', 'WA', '98033', NOW(), TRUE),
('James', 'Anderson', 'james.a@email.com', '222 Hill Ave', 'Tacoma', 'WA', '98402', NOW(), FALSE),
('Sophia', 'Lee', 'sophia.lee@email.com', '333 Market St', 'Redmond', 'WA', '98052', NOW(), TRUE),
('Daniel', 'Garcia', 'daniel.g@email.com', '444 River Rd', 'Renton', 'WA', '98057', NOW(), FALSE),
('Mia', 'Thomas', 'mia.t@email.com', '555 Sunset Blvd', 'Kent', 'WA', '98030', NOW(), TRUE);

-- Customers
INSERT INTO Customer
(UserID, preferred_contact_method)
VALUES
(1, 'Email'),
(2, 'Phone'),
(4, 'Email'),
(7, 'Email'),
(8, 'Phone'),
(9, 'Email'),
(10, 'Text');

-- Sellers
INSERT INTO Seller
(UserID, seller_rating)
VALUES
(3, 4.8),
(5, 4.5),
(6, 4.7);

-- Vehicles
INSERT INTO Vehicle
(VIN, make, model, year, trim, wheel_drive, body_style, num_seats)
VALUES
('1HGCM82633A123456', 'Honda', 'Civic', 2020, 'EX', 'FWD', 'Sedan', 5),
('2T1BURHE5JC123457', 'Toyota', 'Corolla', 2021, 'LE', 'FWD', 'Sedan', 5),
('5YJ3E1EA7KF123458', 'Tesla', 'Model 3', 2022, 'Standard Range', 'RWD', 'Sedan', 5),
('1FTFW1E50LFA12345', 'Ford', 'F-150', 2020, 'XLT', '4WD', 'Truck', 5),
('2HKRW2H89MH123459', 'Honda', 'CR-V', 2021, 'Touring', 'AWD', 'SUV', 5),
('JTDBR32E720123461', 'Toyota', 'Camry', 2020, 'SE', 'FWD', 'Sedan', 5),
('KMHD84LF5LU123462', 'Hyundai', 'Elantra', 2021, 'SEL', 'FWD', 'Sedan', 5),
('JN8AT2MV9LW123463', 'Nissan', 'Rogue', 2020, 'SV', 'AWD', 'SUV', 5),
('WBA5R1C08LF123464', 'BMW', '330i', 2020, 'Base', 'RWD', 'Sedan', 5),
('1C4RJFBG8MC123465', 'Jeep', 'Grand Cherokee', 2021, 'Limited', '4WD', 'SUV', 5);

-- Condition information
INSERT INTO ConditionInfo
(VIN, mileage, owner_count, key_count, vehicle_condition, accident_history)
VALUES
('1HGCM82633A123456', 45000, 1, 2, 'Good', 'No accidents reported'),
('2T1BURHE5JC123457', 38000, 1, 2, 'Excellent', 'No accidents reported'),
('5YJ3E1EA7KF123458', 25000, 1, 2, 'Excellent', 'Minor scratch on rear bumper'),
('1FTFW1E50LFA12345', 62000, 2, 1, 'Good', 'One minor accident reported'),
('2HKRW2H89MH123459', 41000, 1, 2, 'Very Good', 'No accidents reported'),
('JTDBR32E720123461', 52000, 2, 2, 'Good', 'No accidents reported'),
('KMHD84LF5LU123462', 31000, 1, 2, 'Excellent', 'No accidents reported'),
('JN8AT2MV9LW123463', 47000, 1, 1, 'Very Good', 'Minor rear-end accident reported'),
('WBA5R1C08LF123464', 36000, 2, 2, 'Good', 'No accidents reported'),
('1C4RJFBG8MC123465', 29000, 1, 2, 'Excellent', 'No accidents reported');

-- Listings
INSERT INTO Listing
(VIN, SellerID, list_price, listed_date, listing_status)
VALUES
('1HGCM82633A123456', 1, 18500.00, '2026-01-10', 'Sold'),
('2T1BURHE5JC123457', 1, 19500.00, '2026-01-15', 'Sold'),
('5YJ3E1EA7KF123458', 2, 28500.00, '2026-02-01', 'Sold'),
('1FTFW1E50LFA12345', 2, 32500.00, '2026-02-10', 'Sold'),
('2HKRW2H89MH123459', 1, 24500.00, '2026-03-05', 'Active'),
('JTDBR32E720123461', 3, 21500.00, '2026-03-12', 'Sold'),
('KMHD84LF5LU123462', 2, 17900.00, '2026-03-20', 'Sold'),
('JN8AT2MV9LW123463', 3, 22900.00, '2026-04-02', 'Active'),
('WBA5R1C08LF123464', 1, 33900.00, '2026-04-15', 'Sold'),
('1C4RJFBG8MC123465', 2, 31500.00, '2026-05-01', 'Active');

-- Inventory
INSERT INTO Inventory
(ListingID, quantity, status, location)
VALUES
(1, 0, 'Sold', 'Seattle Lot A'),
(2, 0, 'Sold', 'Seattle Lot A'),
(3, 0, 'Sold', 'Bellevue Lot B'),
(4, 0, 'Sold', 'Bellevue Lot B'),
(5, 1, 'Available', 'Everett Lot C'),
(6, 0, 'Sold', 'Seattle Lot A'),
(7, 0, 'Sold', 'Bellevue Lot B'),
(8, 1, 'Available', 'Everett Lot C'),
(9, 0, 'Sold', 'Seattle Lot A'),
(10, 1, 'Available', 'Bellevue Lot B');

-- Transactions
INSERT INTO Transactions
(ListingID, CustomerID, transaction_date, total_amount, transaction_status)
VALUES
(4, 1, '2026-03-15 10:00:00', 32000.00, 'Completed'),
(2, 2, '2026-04-01 14:30:00', 19500.00, 'Completed'),
(6, 4, '2026-04-10 11:20:00', 21000.00, 'Completed'),
(7, 5, '2026-04-18 15:10:00', 17600.00, 'Completed'),
(9, 6, '2026-05-05 12:00:00', 33500.00, 'Completed'),
(1, 3, '2026-05-12 09:45:00', 18300.00, 'Completed'),
(3, 1, '2026-05-20 16:30:00', 28000.00, 'Completed');

-- Payments
INSERT INTO Payment
(TransactionID, payment_method, payment_status, payment_date, amount_paid)
VALUES
(1, 'Bank Transfer', 'Paid', '2026-03-15 10:15:00', 32000.00),
(2, 'Credit Card', 'Paid', '2026-04-01 14:45:00', 19500.00),
(3, 'Credit Card', 'Paid', '2026-04-10 11:30:00', 21000.00),
(4, 'Bank Transfer', 'Paid', '2026-04-18 15:20:00', 17600.00),
(5, 'Cashier Check', 'Paid', '2026-05-05 12:15:00', 33500.00),
(6, 'Credit Card', 'Paid', '2026-05-12 10:00:00', 18300.00),
(7, 'Bank Transfer', 'Paid', '2026-05-20 16:45:00', 28000.00);

-- Deliveries
INSERT INTO Deliveries
(TransactionID, delivery_address, delivery_status, delivery_date)
VALUES
(1, '123 Main St, Seattle, WA', 'Delivered', '2026-03-20'),
(2, '456 Pine St, Bellevue, WA', 'Delivered', '2026-04-05'),
(3, '222 Hill Ave, Tacoma, WA', 'Delivered', '2026-04-14'),
(4, '333 Market St, Redmond, WA', 'Delivered', '2026-04-22'),
(5, '444 River Rd, Renton, WA', 'Delivered', '2026-05-09'),
(6, '321 Cedar Rd, Lynnwood, WA', 'Delivered', '2026-05-16'),
(7, '123 Main St, Seattle, WA', 'Scheduled', '2026-05-25');

-- Reviews
INSERT INTO Review
(UserID, ListingID, rating_number, review_subject, review_description)
VALUES
(1, 4, 5, 'Great Truck', 'Vehicle was exactly as described and delivery was smooth.'),
(2, 2, 4, 'Good Experience', 'Seller was responsive and the car was in excellent condition.'),
(7, 6, 5, 'Smooth purchase', 'The Camry was clean and the process was easy.'),
(8, 7, 4, 'Good value', 'The Elantra was affordable and in great condition.'),
(9, 9, 5, 'Luxury car experience', 'The BMW was exactly what I expected.'),
(4, 1, 4, 'Reliable car', 'The Civic was a good purchase for daily driving.'),
(1, 3, 5, 'Great electric car', 'The Tesla was clean and fun to drive.');