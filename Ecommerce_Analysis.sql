CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Customers (
    Customer_ID VARCHAR(10),
    Name VARCHAR(50),
    City VARCHAR(50),
    Join_Date DATE
);

INSERT INTO Customers VALUES

('C101','Amit','Delhi','2024-01-10'),
('C102','Neha','Mumbai','2024-02-15'),
('C103','Rohit','Jaipur','2024-03-20'),
('C104','Priya','Delhi','2024-04-05'),
('C105','Karan','Mumbai','2024-05-12'),
('C106','Simran','Punjab','2024-06-10'),
('C107','Rahul','Delhi','2024-06-25'),
('C108','Anjali','Jaipur','2024-07-01'),
('C109','Vikram','Mumbai','2024-07-15'),
('C110','Pooja','Delhi','2024-08-01');

select * from Customers;

CREATE TABLE Orders (
    Order_ID VARCHAR(10),
    Customer_ID VARCHAR(10),
    Order_Date DATE,
    Payment_Mode VARCHAR(20)
);

INSERT INTO Orders VALUES
('O201','C101','2025-01-05','UPI'),
('O202','C102','2025-01-06','Card'),
('O203','C103','2025-01-07','Cash'),
('O204','C101','2025-01-10','UPI'),
('O205','C104','2025-01-12','Card'),
('O206','C105','2025-01-15','Cash'),
('O207','C106','2025-01-18','UPI'),
('O208','C107','2025-01-20','Card'),
('O209','C108','2025-01-22','UPI'),
('O210','C109','2025-01-25','Cash');

select * from Orders;

CREATE TABLE Order_Details (
    Order_ID VARCHAR(10),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price INT
);

INSERT INTO Order_Details VALUES
('O201','Laptop','Electronics',1,50000),
('O202','Shoes','Fashion',2,2000),
('O203','Rice','Grocery',5,50),
('O204','Mobile','Electronics',1,20000),
('O205','Shirt','Fashion',3,800),
('O206','Oil','Grocery',2,180),
('O207','TV','Electronics',1,40000),
('O208','Jeans','Fashion',2,1500),
('O209','Wheat','Grocery',4,60),
('O210','Tablet','Electronics',1,15000);

select * from Order_Details;
-- JOIN: CUSTOMER + ORDER TABLE 
select 
	c.Customer_ID,
    c.Name,
    c.City,
    c.Join_Date,
    o.Order_ID,
    o.Order_Date,
    o.Payment_Mode
From Customers c
     join Orders o
     on c.Customer_ID = o.Customer_ID;
     
	-- JOIN: ORDER TABLE + ORDER_DETAIL TABLE
    
select 
	c.Customer_ID,
    c.Name,
    c.City,
    c.Join_Date,
    o.Order_ID,
    o.Order_Date,
    o.Payment_Mode,
    od.Order_ID,
    od.Product,
    od.Category,
    od.Quantity,
    od.Price,
    (od.Quantity * od.Price) AS
    Total_Amount
from Customers c
     join Orders o
     on c.Customer_ID = o.Customer_ID
     join Order_Details od
     on o.Order_ID = od.Order_ID;