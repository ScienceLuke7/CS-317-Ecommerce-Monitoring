-- CREATE DATABASE ECommerceMonitorDB
USE ECommerceMonitorDB

CREATE TABLE WatchList (
    ProductGTIN INT,
    ProductModelNumber INT,
    ProductName varchar(200),
    DesiredPrice DECIMAL(18,2),
    PRIMARY KEY (ProductGTIN, ProductModelNumber)
);

CREATE TABLE Products (
    EcommerceID INT,
    ProductGTIN INT,
    ProductModelNumber INT,
    CurrentPrice DECIMAL(18,2),
    ProductURL varchar(8000),
    PRIMARY KEY (ECommerceID, ProductGTIN, ProductModelNumber)
);

CREATE TABLE UserInformation (
    CurrentEmail varchar(100),
    PRIMARY KEY (CurrentEmail)
);