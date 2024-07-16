create database ConnguoiShopManagement
Go
USE ConnguoiShopManagement
Go

DROP TABLE Admin
DROP TABLE Customer
DROP TABLE Products
DROP TABLE Payments
DROP TABLE Orders
DROP TABLE OrderDetail

CREATE TABLE Admin (
    idAdmin INT PRIMARY KEY IDENTITY(1,1),
    adName NVARCHAR(100) NOT NULL,
    adAccount CHAR(50) NOT NULL UNIQUE,
    adPass CHAR(255) NOT NULL
);


CREATE TABLE Customer (
    idCustomer INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    firstName NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    customerAccount CHAR(50) NOT NULL UNIQUE,
    customerPassword CHAR(255) NOT NULL,
	address NVARCHAR(200) NOT NULL,
    gender NVARCHAR(10),
    email NVARCHAR(100),
    phoneNumber CHAR(20)
);



select * from Customer



CREATE TABLE Products (
    idProduct INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nameProduct NVARCHAR(100) NOT NULL,
	size VARCHAR(40) NOT NULL,
    type nvarchar(20) NOT NULL,
	color nvarchar(20) NOT NULL,
    productQuantity INT,
    cost DECIMAL(10, 2),
    description NVARCHAR(MAX) NOT NULL,
    [images] VARCHAR(255) NOT NULL,
);

CREATE TABLE Payments(
paymentid INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
payment_method NVARCHAR(30)
)


CREATE TABLE Orders (
    idOrder INT PRIMARY KEY IDENTITY(1,1),
    idCustomer INT ,
    startDate DATE,
	totalMoney Money ,
	paymentid INT NOT NULL FOREIGN KEY REFERENCES Payments(paymentid),
    FOREIGN KEY (idCustomer) REFERENCES Customer(idCustomer)
);


CREATE TABLE OrderDetail (
    idOrder INT NOT NULL,
    idProduct INT NOT NULL,
    quantity INT NOT NULL,
    totalCost DECIMAL(10, 2),
    PRIMARY KEY (idOrder, idProduct),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder),
    FOREIGN KEY (idProduct) REFERENCES Products(idProduct)
);
