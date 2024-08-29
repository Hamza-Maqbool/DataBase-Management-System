CREATE DATABASE Auto_SpareParts

CREATE TABLE Employees (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
	contact VARCHAR(20),
	address VARCHAR(50),
	hired_date VARCHAR(20),
	salary INT,
	position VARCHAR(50)
);
CREATE TABLE Customer (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
	contact VARCHAR(20),
	address VARCHAR(50),
);
CREATE TABLE Company (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(100),
	contact VARCHAR(20),
	address VARCHAR(50),
);
CREATE TABLE Category (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100)
);
CREATE TABLE SpareParts (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) UNIQUE,
	cost INT,
	price INT,
	quantity INT,
	companyID INT,
	categoryID INT,
	FOREIGN KEY (companyID) REFERENCES Company(id),
	FOREIGN KEY (categoryID) REFERENCES Category(id)
);
CREATE TABLE Orders (
    id INT NOT NULL PRIMARY KEY,
    date VARCHAR(50),
	total_price INT,
	status VARCHAR(50),
	customerID INT,
	FOREIGN KEY (customerID) REFERENCES Customer(id)
);
CREATE TABLE Supplier (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
	address VARCHAR(50),
	categoryID INT,
	companyID INT,
	FOREIGN KEY (categoryID) REFERENCES Category(id),
	FOREIGN KEY (companyID) REFERENCES Company(id)
);
CREATE TABLE WareHouse (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
	location VARCHAR(50),
	capacity INT,
	stockLevel INT,
);
CREATE TABLE Delivery (
    id INT NOT NULL PRIMARY KEY,
    date VARCHAR(50),
	address VARCHAR(50),
	fuel_Charges INT,
	orderID INT,
	employeeID INT,
	FOREIGN KEY (orderID) REFERENCES Orders(id),
	FOREIGN KEY (employeeID) REFERENCES Employees(id)
);
CREATE TABLE SalesReport (
    id INT NOT NULL PRIMARY KEY,
    date VARCHAR(50),
	price INT,
	quantity INT,
	sparePartID INT,
	FOREIGN KEY (sparePartID) REFERENCES SpareParts(id)
);
CREATE TABLE Payment (
    id INT NOT NULL PRIMARY KEY,
    date VARCHAR(50),
	amount INT,
	orderID INT,
	FOREIGN KEY (orderID) REFERENCES Orders(id)
);
CREATE TABLE Profit_Lose_Report (
    id INT NOT NULL PRIMARY KEY,
	employeeID INT,
	saleReportID INT,
	Profit INT,
	FOREIGN KEY (employeeID) REFERENCES Employees(id),
	FOREIGN KEY (saleReportID) REFERENCES SalesReport(id)
);
CREATE TABLE Employee_Performance_Report (
    id INT NOT NULL PRIMARY KEY,
	profit INT,
	total_Cost INT,
	employeeID INT,
	FOREIGN KEY (employeeID) REFERENCES Employees(id)
);
CREATE TABLE Cart (
    id INT NOT NULL PRIMARY KEY,
	customerID INT,
	sparePartID INT,
	FOREIGN KEY (sparePartID) REFERENCES SpareParts(id),
	FOREIGN KEY (customerID) REFERENCES Customer(id)
);