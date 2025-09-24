



 -- Create New Database E-Commerce --

CREATE DATABASE E_Commerce;   # Name of Database
USE E_Commerce;

-- Create Entitiys As E-commerce 
-- Before Create Tables 

CREATE TABLE Customers (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100) NOT NULL,
    Contact BIGINT NOT NULL,
    Email VARCHAR(100) ,
    Address VARCHAR(100) NOT NULL
);

DESC Customers;   
ALTER TABLE Customers AUTO_INCREMENT=201;  --  Unique number to be generated automatically

-- INSERT NEW ROWS USE INSERT sql quries 
INSERT INTO Customers(Full_Name,contact,Email,Address)VALUES
("Shubham Manik Deshmukh",9384986502,'shum021@gmail.com',"Alk Nagar Nashik"),
("Yash Rajesh Kale",9865234578,'yash1254@gmail.com',"Gokul Nagar Parbhani"),
("Ajay Mohan Shinde",7845968502,NULL,"Ram Nagar Pune"),    -- insert without email 
("Amit Ganesh Kumar ",6589256341,'amit97@gmail.com',"Bhakti Nagar Nagapur"),
("Shubham Manik Deshmukh",9384986502,NULL,"Raju Nagar Mumbai"); -- insert without email

SElECT * FROM Customers; -- Retrive Each data 

-- UPDATE NULL Email for customers id 203 
UPDATE Customers SET Email='ajay45@gmail.com' WHERE Customer_id=203; -- 

CREATE TABLE Products (
    Product_Id INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_quantity INT NOT NULL
);

DESC Products;        -- DESC helps to display the structure of a specified table 
ALTER TABLE Products AUTO_INCREMENT=111;  

-- INSERT  NEW ROWS 
INSERT INTO Products(Product_Name, Category, Price, Stock_quantity) VALUES
('HP-Laptop', 'Electronics',78520,200),
('Smartphone', 'Electronics', 34000,500),
('Desk Chair', 'Furniture', 999,450),
('T-shirt', 'Apparel',450,854),
('Watch', 'Accessories',1700,300);

SELECT * FROM Products; -- Show all data

-- Create the orders table with foreign keys
CREATE TABLE Orders(
    Order_Id INT AUTO_INCREMENT PRIMARY KEY,      -- The starting value for AUTO_INCREMENT is Default 1
    Customer_Id INT NOT NULL, 
    Product_Id INT NOT NULL,
    Order_Date TIMESTAMP NOT NULL,   
    Amount DECIMAL(10,2) NOT NULL, 
    Payment_Type ENUM('UPI','CARD','CASH') NOT NULL,
    FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id) , 
    FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id) 
);

DESC Orders;

INSERT INTO Orders(Customer_Id, Product_Id, Order_Date, Amount, Payment_Type) VALUES
(201, 111, '2025-01-05 10:00:00',78520, 'CARD'),
(202, 115, '2025-01-05 10:15:00',34000, 'UPI'),
(203, 112, '2025-01-06 11:30:00',999, 'CASH'),
(201, 114, '2025-01-06 12:00:00',78520, 'CARD'),
(204, 113, '2025-01-07 09:00:00',450, 'UPI'),
(205, 114, '2025-01-07 13:00:00',1700, 'CARD');

SELECT * FROM Orders;

-- Create the Payment table with foreign keys

CREATE TABLE Payments (
    Payment_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   
    Order_Id INT,                                         
    Payment_Date TIMESTAMP NOT NULL,                           
    Payment_Status ENUM('Paid', 'Unpaid','Cancelled') DEFAULT 'Cancelled', 
	FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)    
);

DESC Payments;
ALTER TABLE Payments AUTO_INCREMENT=10001;

-- INSERT DATA
INSERT INTO Payments(Order_id,Payment_Date,Payment_Status)VALUES
(1,'2025-01-06 18:02:00','Paid'),
(4,'2025-01-07 16:44:00','Paid'),
(3,'2025-01-06 08:23:00','Cancelled'),
(2,'2025-01-05 07:48:00','Unpaid');

SELECT * FROM Payments;  -- show data

-- DELETE Payment status is Cancelled 
DELETE FROM Payments WHERE Payment_status='Cancelled'; 

















