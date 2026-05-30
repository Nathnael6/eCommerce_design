DROP DATABASE IF EXISTS online_car_marketplace;
CREATE DATABASE online_car_marketplace;

USE online_car_marketplace;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    street_address VARCHAR(150),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    last_login DAaTETIME,
    MFA_enabled BOOLEAN DEFAULT FALSE
);

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    preferred_contact_method VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Seller (
    SellerID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    seller_rating DECIMAL(3,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Vehicle (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    trim VARCHAR(50),
    wheel_drive VARCHAR(50),
    body_style VARCHAR(50),
    num_seats INT
);

CREATE TABLE ConditionInfo (
    ConditionID INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    mileage INT,
    owner_count INT,
    key_count INT,
    vehicle_condition VARCHAR(50),
    accident_history VARCHAR(255),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

CREATE TABLE Listing (
    ListingID INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    SellerID INT NOT NULL,
    list_price DECIMAL(10,2) NOT NULL,
    listed_date DATE NOT NULL,
    listing_status VARCHAR(50) DEFAULT 'Active',
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ListingID INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    status VARCHAR(50) DEFAULT 'Available',
    location VARCHAR(100),
    date_added DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
);

CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ListingID INT NOT NULL,
    CustomerID INT NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    transaction_status VARCHAR(50) DEFAULT 'Completed',
    FOREIGN KEY (ListingID) REFERENCES Listing(ListingID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'Paid',
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount_paid DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

CREATE TABLE Deliveries (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT NOT NULL,
    delivery_address VARCHAR(150),
    delivery_status VARCHAR(50) DEFAULT 'Pending',
    delivery_date DATE,
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    ListingID INT NOT NULL,
    rating_number INT CHECK (rating_number BETWEEN 1 AND 5),
    review_subject VARCHAR(100),
    review_description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ListingID) REFERENCES Listing(ListingID)
);